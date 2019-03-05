<?php

namespace App\Controller;

use App\Entity\ComunityAnswer;
use App\Entity\ComunityQuestion;
use App\Form\ComunityAnswerType;
use App\Form\ComunityQuestionType;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
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
        $paginator = $this->get('knp_paginator');
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $usuario = $this->getUser();
//            $pregunta = $form->getData();
            $pregunta->setUsuario($usuario);
            $pregunta->setUrl($this->random_str(32));
            $file = $pregunta->getFile();
            if ($file) {
                $fileName = $this->generateUniqueFileName() . '.' . $file->guessExtension();
                // Move the file to the directory where brochures are stored
                try {
                    $file->move(
                        $this->getParameter('comunity_directory'),
                        $fileName
                    );
                } catch (FileException $e) {
                    throw new Exception('Ups, algo ha ocurrido');
                }
                $pregunta->setFile($fileName);
            }
            $em->persist($pregunta);
            $em->flush();
            return $this->redirectToRoute('comunidad');
        }
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1),
            4
        );
        return $this->render('Comunidad/comunidad.html.twig', array('formulario' => $form->createView(), 'pagination' => $pagination));
    }


    /**
     * @Route("/Question/{url}", name="SeeQuestion")
     */
    public function SeeQuestion($url, Request $request, \Swift_Mailer $mailer)
    {
        $em = $this->getDoctrine()->getManager();
        $question = $em->getRepository(ComunityQuestion::class)->findOneBy(['url' => $url]);
        $answer = new ComunityAnswer();
        $form = $this->createForm(ComunityAnswerType::class, $answer);
        $form->handleRequest($request);
        $paginator = $this->get('knp_paginator');
        if ($form->isSubmitted() && $form->isValid()) {
            $answer = $form->getData();
            $answer->setUsuario($this->getUser());
            $answer->setPregunta($question);
            $em->persist($answer);
            $flush = $em->flush();
            if (!$flush) {
                $username = $this->getUser()->getUsername();
                $message = (new \Swift_Message('Matemágicas-Han respondido tu pregunta.'))
                    ->setFrom('info@foodies24-7.com')
                    ->setTo($question->getUsuario()->getEmail())
                    ->setBody('El usuario.' . $username . ' ha respondido tu pregunta Realizada en Matemágicas, Es hora de echar un vistazo');
                $mailer->send($message);
            }
            return $this->redirectToRoute('SeeQuestion', ['url' => $question->getUrl()]);
        }
        $pagination = $paginator->paginate(
            $question->getAnswers(),
            $request->query->getInt('page', 1),
            4
        );
        return $this->render('Comunidad/Question.html.twig', array(
            'Question' => $question,
            'form' => $form->createView(),
            'pagination' => $pagination
        ));
    }

    /**
     * @Route("/CheckCorrect/", options={"expose"=true}, name="CheckCorrect")
     */
    public function checkCorrectAnswer(Request $request, \Swift_Mailer $mailer)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new \Exception('This is not An Ajax Call');
        }
        $em = $this->getDoctrine()->getManager();
        $Answerid = $request->request->get('answerId');
        $answer = $em->getRepository(ComunityAnswer::class)->find($Answerid);
        $answer->setCorrect(true);
        $answer->getPregunta()->setSolved(true);
        $flush = $em->flush();
        if (!$flush) {
            $EmailTo = $answer->getUsuario()->getEmail();
            $User = $this->getUser()->getUsername();
            $QuestionUrl = $answer->getPregunta()->getUrl();
            $url = $this->generateUrl('SeeQuestion', array('url' => $QuestionUrl));
            $message = (new \Swift_Message('Matemágicas - Respuesta Aertada!'))
                ->setFrom('info@foodies24-7.com')
                ->setTo($EmailTo)
                ->setBody('El usuario ' . $User . ' Ha marcado tu respuesta como correcta. Gracias por contribuir a la comunidad Matemágicas' . ' Mira tu logro aquí: ' . $url);
            $mailer->send($message);
        }


        return new JsonResponse(['success' => true]);

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


    /**
     * @return string
     */
    private function generateUniqueFileName()
    {
        // md5() reduces the similarity of the file names generated by
        // uniqid(), which is based on timestamps
        return md5(uniqid());
    }
}
