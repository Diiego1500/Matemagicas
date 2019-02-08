<?php

namespace App\Controller;

use App\Entity\ComunityQuestion;
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
        $form = $this->createForm(ComunityQuestionType::class, $pregunta);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em = $this->getDoctrine()->getManager();
            $usuario=$this->getUser();
            $pregunta= $form->getData();
            $pregunta->setUsuario($usuario);
            $em->persist($pregunta);
            $em->flush();
            return $this->redirectToRoute('comunidad');
        }
        return $this->render('Comunidad/comunidad.html.twig', array('formulario'=>$form->createView()));
    }
}
