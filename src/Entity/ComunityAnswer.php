<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ComunityAnswerRepository")
 */
class ComunityAnswer
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true, length=10000)
     */
    private $answer;

    /**
     * @ORM\Column(type="string", nullable=true, length=10000)
     */
    private $img;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="Respuestas")
     */
    private $usuario;



    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\ComunityQuestion", inversedBy="respuestas")
     */
    private $pregunta;



    /**
     * ComunityAnswer constructor.
     * @param $answer
     * @param $img
     * @param $userId
     */
    public function __construct($answer=null, $img=null)
    {
        $this->answer = $answer;
        $this->img = $img;
    }

    /**
     * ComunityAnswer constructor.
     * @param $answer
     * @param $img
     */



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
    public function getImg()
    {
        return $this->img;
    }

    /**
     * @param mixed $img
     */
    public function setImg($img)
    {
        $this->img = $img;
    }

    /**
     * @return mixed
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * @param mixed $usuario
     */
    public function setUsuario($usuario)
    {
        $this->usuario = $usuario;
    }

    /**
     * @return mixed
     */
    public function getPregunta()
    {
        return $this->pregunta;
    }

    /**
     * @param mixed $pregunta
     */
    public function setPregunta($pregunta)
    {
        $this->pregunta = $pregunta;
    }





}
