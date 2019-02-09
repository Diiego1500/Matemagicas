<?php

namespace App\Controller;

use App\Entity\ComunityAnswer;
use App\Entity\ComunityQuestion;
use App\Form\ComunityAnswerType;
use App\Form\ComunityQuestionType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ComunidadController extends Controller
{
    /**
     * @Route("/comunidad/", name="comunidad")
     */
    public function index(Request $request)
    {
        $pregunta = new ComunityQuestion();
        $em = $this->getDoctrine()->getManager();
        $form = $this->createForm(ComunityQuestionType::class, $pregunta);
        $form->handleRequest($request);
        $query = $em->getRepository(ComunityQuestion::class)->SearchQuestions();
        $paginator  = $this->get('knp_paginator');
        if($form->isSubmitted() && $form->isValid()){
            $em = $this->getDoctrine()->getManager();
            $usuario=$this->getUser();
            $pregunta= $form->getData();
            $pregunta->setUsuario($usuario);
            $pregunta->setUrl($this->random_str(32));
            $em->persist($pregunta);
            $em->flush();
            return $this->redirectToRoute('comunidad');
        }

        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1),
            4
        );

        return $this->render('Comunidad/comunidad.html.twig', array('formulario'=>$form->createView(), 'pagination' => $pagination));
    }






    /**
     * @Route("/Question/{url}", name="SeeQuestion")
     */
    public function SeeQuestion($url, Request $request){
        $em= $this->getDoctrine()->getManager();
        $question = $em->getRepository(ComunityQuestion::class)->findOneBy(['url'=>$url]);
        $answer = new ComunityAnswer();
        $form = $this->createForm(ComunityAnswerType::class, $answer);
        $form->handleRequest($request);
        $paginator  = $this->get('knp_paginator');
        if($form->isSubmitted() && $form->isValid()){
            $answer = $form->getData();
            $answer->setUsuario($this->getUser());
            $answer->setPregunta($question);
            $em->persist($answer);
            $em->flush();
            return $this->redirectToRoute('SeeQuestion',['url'=>$question->getUrl()]);
        }
        $pagination = $paginator->paginate(
            $question->getAnswers(),
            $request->query->getInt('page', 1),
            4
        );
            return $this->render('Comunidad/Question.html.twig', array(
                'Question'=>$question,
                'form'=>$form->createView(),
                'pagination'=>$pagination
            ));
    }










    function random_str($length, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    {
        $str = '';
        $max = mb_strlen($keyspace, '8bit') - 1;
        for ($i = 0; $i < $length; ++$i) {
            $str .= $keyspace[random_int(0, $max)];
        }
        return $str;
    }
}
