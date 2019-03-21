<?php

namespace App\Controller;

use App\Entity\Theme;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class PrimaryController extends Controller
{

    /**
     * @Route("/Numeros/", name="Numeros")
     */
    public function Numeros(){
        return $this->render('Aritmetica/numeros.html.twig');
    }

    /**
     * @Route("/MatematicaAritmetica/", name="MatematicaAritmetica")
     */
    public function MatematicaAritmetica(){
        $MATEMATICAARITMETICA = 1;
        $accessible = true;
        $response = $this->forward('App\Controller\StandardController::SearchSection', array('section'=>$MATEMATICAARITMETICA, 'accessible'=>$accessible));
        return $response;
    }

    /**
     * @Route("/Geometria/", name="Geometria")
     */
    public  function geometria(){
        $GEOMETRIA = 2;
        $user = $this->getUser();
        $ThemesUnlokeds = json_decode($user->getAvailableThemes());
        $accessible = false;
        if(in_array(14, $ThemesUnlokeds)){$accessible=true;}
        $response = $this->forward('App\Controller\StandardController::SearchSection', array(
            'section'=>$GEOMETRIA,
            'accessible'=>$accessible
        ));
        return $response;
    }

    /**
     * @Route("/Geometria/figurageometrica/", name="figurageometrica")
     */
    public function figurageometrica(){
        return $this->render('Geometria/figurageometrica.html.twig');
    }


    /**
     * @Route("/Geometria/Area/", name="Area")
     */
    public function Area(){
        return $this->render('Geometria/Area.html.twig');
    }

    /**
     * @Route("/Geometria/Perimetro", name="Perimetro")
     */
    public function Perimetro(){
        return $this->render('Geometria/Perimetro.html.twig');
    }

    /**
     * @Route("/Geometria/Pi/", name="Pi")
     */
    public function Pi(){
        return $this->render('Geometria/pi.html.twig');
    }


    /**
     * @Route("/Geometria/Angulos/", name="Angulos")
     */
    public  function Angulos(){
        return $this->render('Geometria/angulos.html.twig');
    }

    /**
     * @Route("/Diferencia-Entre-Area-Perimetro/", name="Diferencia-Area-Perimetro")
     */
    public function DiferenciaAreaPerimetro(){
        return $this->render('Geometria/Area_Perimetro.html.twig');
    }
}
