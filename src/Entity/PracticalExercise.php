<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PracticalExerciseRepository")
 */
class PracticalExercise
{

//   tablero primaria -> 0
//   tablero booleana -> 1
    CONST ANSWER = "/Matemagicas/public/Img/Answers/";


    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="float")
     */
    private $level;


    /**
     * @ORM\Column(type="string")
     */
    private $problemPath;

    /**
     * @ORM\Column(type="decimal")
     */
    private $answer;


    /**
     * @ORM\Column(type="string")
     */
    private $answerString;

    /**
     * @ORM\Column(type="integer")
     */
    private $nextExercise;


    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Theme", inversedBy="practicalExercise")
     * @ORM\JoinColumn(nullable=true)
     */
    private $theme;


    /**
     * @ORM\Column(type="integer", options={"default" : 0})
     */
    private $boardType=0;


    /**
     * @ORM\Column(type="boolean")
     */
    private $Seeanswer = false;

    /**
     * @return mixed
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * @param mixed $level
     */
    public function setLevel($level)
    {
        $this->level = $level;
    }

    /**
     * @return mixed
     */
    public function getAnswer()
    {
        return $this->answer;
    }

    /**
     * @param mixed $answer
     */
    public function setAnswer($answer)
    {
        $this->answer = $answer;
    }

    /**
     * @return mixed
     */
    public function getAnswerString()
    {
        return $this->answerString;
    }

    /**
     * @param mixed $answerString
     */
    public function setAnswerString($answerString)
    {
        $this->answerString = $answerString;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getTheme()
    {
        return $this->theme;
    }

    public function getproblemPath()
    {
        return $this->problemPath;
    }

    /**
     * @return mixed
     */
    public function getNextExercise()
    {
        return $this->nextExercise;
    }

    /**
     * @param mixed $nextExercise
     */
    public function setNextExercise($nextExercise)
    {
        $this->nextExercise = $nextExercise;
    }

    /**
     * @return mixed
     */
    public function getBoardType()
    {
        return $this->boardType;
    }

    /**
     * @param mixed $boardType
     */
    public function setBoardType($boardType)
    {
        $this->boardType = $boardType;
    }

    /**
     * @return mixed
     */
    public function getSeeanswer()
    {
        return $this->Seeanswer;
    }

    /**
     * @param mixed $Seeanswer
     */
    public function setSeeanswer($Seeanswer)
    {
        $this->Seeanswer = $Seeanswer;
    }








}
