<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\BlogNotificationRepository")
 */
class BlogNotification
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string")
     */
    private $email;

    /**
     * @ORM\Column(type="string")
     */
    private $blogRecibido;

    /**
     * @ORM\Column(type="boolean")
     */
    private $activate;
    /**
     * @ORM\Column(type="string")
     */
    private $secretToken;

    /**
     * BlogNotification constructor.
     * @param $email
     * @param $blogRecibido
     * @param $activate
     */
    public function __construct($email=null, $blogRecibido='[]', $activate=true)
    {
        $this->email = $email;
        $this->blogRecibido = $blogRecibido;
        $this->activate = $activate;
        $this->secretToken = md5(uniqid());
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function getBlogRecibido()
    {
        return $this->blogRecibido;
    }

    /**
     * @param mixed $blogRecibido
     */
    public function setBlogRecibido($blogRecibido)
    {
        $this->blogRecibido = $blogRecibido;
    }

    /**
     * @return mixed
     */
    public function getActivate()
    {
        return $this->activate;
    }

    /**
     * @param mixed $activate
     */
    public function setActivate($activate)
    {
        $this->activate = $activate;
    }

    /**
     * @return mixed
     */
    public function getSecretToken()
    {
        return $this->secretToken;
    }




}
