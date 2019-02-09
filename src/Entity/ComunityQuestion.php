<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ComunityQuestionRepository")
 */
class ComunityQuestion
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\Column(type="string", length=255 , nullable=true)
     */
    private $title;


    /**
     * @ORM\Column(type="string", length=10000 , nullable=true)
     */
    private $question;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\ComunityAnswer", mappedBy="pregunta")
     */
    private $respuestas;


    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="preguntas")
     */
    private $usuario;

    /**
     * @ORM\Column(type="date")
     */
    private $date;


    /**
     * @ORM\Column(type="string")
     */
    private $url;

    /**
     * @ORM\Column(type="boolean")
     */
    private $solved;

    /**
     * ComunityQuestion constructor.
     * @param $title
     * @param $question
     * @param $image
     */
    public function __construct($title=null, $question=null, $image=null)
    {
        $this->title = $title;
        $this->question = $question;
        $this->image = $image;
        $this->solved =false;
        $this->date = new \DateTime('now');
        $this->respuestas= new ArrayCollection();
    }


    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @return mixed
     */
    public function getQuestion()
    {
        return $this->question;
    }

    /**
     * @param mixed $question
     */
    public function setQuestion($question)
    {
        $this->question = $question;
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param mixed $image
     */
    public function setImage($image)
    {
        $this->image = $image;
    }

   public function addAnswer(ComunityAnswer $Answer){
        return $this->respuestas->add($Answer);
   }

   public function removeAnswer(ComunityAnswer $Answer){
        return $this->respuestas->removeElement($Answer);
   }

   public function getAnswers(){
        return $this->respuestas;
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
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * @param mixed $url
     */
    public function setUrl($url)
    {
        $this->url = $url;
    }

    /**
     * @return mixed
     */
    public function getSolved()
    {
        return $this->solved;
    }

    /**
     * @param mixed $solved
     */
    public function setSolved($solved)
    {
        $this->solved = $solved;
    }

    /**
     * @return mixed
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param mixed $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }









}
