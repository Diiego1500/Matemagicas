<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserStatisticsRepository")
 */
class UserStatistics
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", name="trying")
     */
    private $solvedExercises;


    /**
     * @ORM\Column(type="integer")
     */
    private $errorRate;


    /**
     * @ORM\Column(type="integer")
     */
    private $successRate;

    /**
     * UserStatistics constructor.
     * @param $solvedExercises
     * @param $errorRate
     * @param $successRate
     */
    public function __construct($solvedExercises, $errorRate, $successRate)
    {
        $this->solvedExercises = $solvedExercises;
        $this->errorRate = $errorRate;
        $this->successRate = $successRate;
    }


    /**
     * @return mixed
     */
    public function getTryings()
    {
        return $this->solvedExercises;
    }

    /**
     * @param mixed $solvedExercises
     */
    public function setTryings($solvedExercises)
    {
        $this->solvedExercises = $solvedExercises;
    }

    /**
     * @return mixed
     */
    public function getErrorRate()
    {
        return $this->errorRate;
    }

    /**
     * @param mixed $errorRate
     */
    public function setErrorRate($errorRate)
    {
        $this->errorRate = $errorRate;
    }

    /**
     * @return mixed
     */
    public function getSuccessRate()
    {
        return $this->successRate;
    }

    /**
     * @param mixed $successRate
     */
    public function setSuccessRate($successRate)
    {
        $this->successRate = $successRate;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

}
