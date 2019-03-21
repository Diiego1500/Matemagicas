<?php

namespace App\Controller;

use App\Entity\GlobalsTips;
use App\Entity\Theme;
use App\Entity\User;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Debug\Exception\ContextErrorException;
use Symfony\Component\Debug\Exception\FatalThrowableError;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use App\Entity\PracticalExercise;

class StandardController extends Controller
{

    /**
     * @Route("/section/{section}/{accessible}", name="section")
     */
    public function SearchSection($section,$accessible)
    {
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $AvailablesThemes = json_decode($user->getAvailableThemes());
        $themes = $em->getRepository(Theme::class)->searchThemeBySection($section);
        return $this->render('standard/themes.html.twig', array('themes' => $themes, 'AvailablesThemes' => $AvailablesThemes, 'section' => $section,'accessible'=>$accessible));
    }


    /**
     * @Route("/Exercise/theme/{idTheme}/{level}", name="Exercise")
     */
    public function exerciseTheme($idTheme, $level)
    {
        try {
            $em = $this->getDoctrine()->getManager();
            $Exercises = $em->getRepository(PracticalExercise::class)->searchExercisesByThemeId($idTheme);
            $EasyArray = array();
            $MediumArray = array();
            $HardArray = array();
            foreach ($Exercises as $Exercise) {
                switch ($Exercise['level']) {
                    case 1:
                        $EasyArray[] = $Exercise;
                        break;
                    case 2:
                        $MediumArray[] = $Exercise;
                        break;
                    case 3:
                        $HardArray[] = $Exercise;
                        break;
                }
            }
            //$user = $this->getUser();
            //$solvedExercises = json_decode($user->getSolvedExercises());
            switch ($level) {
                case 1:
                    return $this->forward('App\Controller\StandardController::PracticeExerciseTemplate', array('idExercise' => $EasyArray[0]['id']));
                    break;
                case 2:
                    return $this->forward('App\Controller\StandardController::PracticeExerciseTemplate', array('idExercise' => $MediumArray[0]['id']));
                    break;
                case 3:
                    return $this->forward('App\Controller\StandardController::PracticeExerciseTemplate', array('idExercise' => $HardArray[0]['id']));
                    break;
            }
        } catch (\Exception $exception) {
            return $this->render('');
        }
    }

    /**
     * @Route("/PracticeExercise/{idExercise}", options={"expose" = true} , name="PracticeExercise")
     */

    public function PracticeExerciseTemplate($idExercise)
    {

        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $Exercise = $em->getRepository(PracticalExercise::class)->searchExerciseById($idExercise);
        $themeSources = json_decode($em->getRepository(Theme::class)->searchSourceById($Exercise['idTheme'])['source']);
        return $this->render('standard/PracticalExercises.html.twig', array(
            'Exercise' => $Exercise,
            'ThemeSources' => $themeSources,
            'ThemeSources2' => $themeSources,
            'boardKind' => $user->getBoardKind()
        ));
    }

    /**
     * @Route("/ChangeBoard/", options={"expose" = true}, name="ChangeBoard")
     */
    public function ChangeBoard(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw  new \Exception('Ups! This is not an ajax call!');
        }
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $BoardKind = $user->getBoardKind();
        //Change Kind of Board
        if ($BoardKind) {
            $user->setBoardKind(!$BoardKind);
        } else {
            $user->setBoardKind(!$BoardKind);
        }
        $em->persist($user);
        $em->flush();
        return new JsonResponse(['success' => true]);

    }

    /**
     * @Route("/VerifyAnswer/", options={"expose" = true}, name="VerifyAnswer")
     */
    public function VerifyAnswer(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new Exception('Ups this is not an ajax call');
        }
        $em = $this->getDoctrine()->getManager();
        $id = $request->request->get('ExerciseId');
        $answer = $request->request->get('answer');
        $Execercise = $em->getRepository(PracticalExercise::class)->find($id);
        $array = array();
        $user = $this->getUser();
        $statistics = $user->getStatistics();
        $solvedExercises = json_decode($user->getSolvedExercises());
        $statistics->setTryings(($statistics->getTryings()) + 1);
        if ($Execercise->getAnswer() == $answer || \strpos((string)$Execercise->getAnswerString(), (string)$answer) || $Execercise->getAnswerString() == $answer) {
            if (!(in_array($id, $solvedExercises))) {
                $solvedExercises[] = $id;
                $user->setSolvedExercises(json_encode($solvedExercises));
            }
            $statistics->setSuccessRate(($statistics->getSuccessRate()) + 1);
            $array = array('answer' => true);
        } else {
            $statistics->setErrorRate(($statistics->getErrorRate()) + 1);
            $array = array('answer' => false);
        }
        $em->flush();
        $response = new JsonResponse($array);
        return $response;
    }

    /**
     * @param Request $request
     * @throws \Exception
     * @Route("/GetImageAnswer/", options={"expose"=true}, name="GetImageAnswer")
     */
    public function GetImageAnswer(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new \Exception('Ups! this is not an Ajax Call');
        }
        $em = $this->getDoctrine()->getManager();
        $id = $request->request->get('id');
        $Exercise = $em->getRepository(PracticalExercise::class)->find($id);
        $ProblemPathArray = explode("/", $Exercise->getproblemPath());
        $Route = "";
        for ($i = 0; $i < count($ProblemPathArray); $i++) {
            if ($i + 1 == count($ProblemPathArray)) {
                $Route = $Route . $ProblemPathArray[$i];
            } else {
                $Route = $Route . $ProblemPathArray[$i] . '/';
            }
        }
        $AnswerArray = PracticalExercise::ANSWER . $Route;
        return new JsonResponse(["Route" => $AnswerArray]);
    }

    /**
     * @Route("ChooseLevel/{idTheme}", name="ChooseLevel")
     */
    public function choseLevel($idTheme)
    {
        $em = $this->getDoctrine()->getManager();
        $exercise = $em->getRepository(PracticalExercise::class)->searchExerciseById($idTheme);
        $Nametheme = $em->getRepository(Theme::class)->searchNameThemeById($idTheme);
        return $this->render('standard/ChooseLevel.html.twig', array('idTheme' => $exercise['id'], 'name' => $Nametheme['name']));
    }


    /**
     * @Route("/GetRandomTip", options={"expose"=true}, name="GetRandomTip")
     */
    public function getRandomTip(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new Exception('Ups! this is not an ajax call');
        }
        $em = $this->getDoctrine()->getManager();
        $cantidad = $em->getRepository(GlobalsTips::class)->getCountRegisters();
        $randomNum = rand(1, $cantidad);
        $tip = $em->getRepository(GlobalsTips::class)->find($randomNum);
        $array = array("Tip" => $tip->getDescription());
        return new JsonResponse($array);
    }

    /**
     * @Route("/success/{idExercise}", options={"expose"=true}, name="Success")
     */
    public function successController($idExercise)
    {
        $em = $this->getDoctrine()->getManager();
        $Exercise = $em->getRepository(PracticalExercise::class)->find($idExercise);
        $Theme = $Exercise->getTheme();
        $NextTheme = $em->getRepository(Theme::class)->find(($Theme->getId()) + 1);
        $user = $this->getUser();
        $solvedExercises = json_decode($user->getSolvedExercises());
        $AvailablesThemes = [];
        //MEJORAR, PONER UN CONTAINS
        for ($i = 0; $i < count($solvedExercises); $i++) {
            if ($solvedExercises[$i] == $idExercise) {
                if ($Theme->getUnloker() == $solvedExercises[$i]) {
                    if (!(in_array($NextTheme->getId(), $AvailablesThemes))) {
                        $AvailablesThemes = json_decode($user->getAvailableThemes());
                        $AvailablesThemes[] = $NextTheme->getId();
                        $user->setAvailableThemes(json_encode($AvailablesThemes));
                        $em->flush();
                    }
                }
            }
        }
        if ($NextTheme) {
            return $this->render('standard/Success.html.twig', array('AvailableThemes' => $AvailablesThemes, 'ThemeUnloked' => $NextTheme->getName(), 'Theme' => $Theme->getName(), 'IdTheme' => $NextTheme->getId()));
        } else {
            return $this->render('standard/Success.html.twig', array(
                'AvailableThemes' => $AvailablesThemes,
                //'ThemeUnloked' => $NextTheme->getName(),
                'Theme' => $Theme->getName(),
                'IdTheme' => 10000
            ));
        }
    }


    /**
     * @Route("/ChangeImage/", options={"expose"=true}, name="ChangeImage")
     */
    public function ChangeImage(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new Exception('Ups! this is not an ajax call');
        }
        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();

        $filename = $this->random_str(32);
        $location = User::UPLOADPATH . $filename;
        move_uploaded_file($_FILES['file']['tmp_name'], $location);
        $response = new JsonResponse(array('Img' => User::PATH . $filename));
        $user->setImgProfile($filename);
        $em->flush();
        return $response;
    }


    function random_str($length, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    {
        $str = '';
        $max = mb_strlen($keyspace, '8bit') - 1;
        for ($i = 0; $i < $length; ++$i) {
            $str .= $keyspace[random_int(0, $max)];
        }
        return $str . '.png';
    }

}
