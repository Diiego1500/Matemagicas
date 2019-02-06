<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\BlogArticleRepository")
 */
class BlogArticle
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
    private $title;

    /**
     * @ORM\Column(type="string")
     */
    private $Img='[]';

    /**
     * @ORM\Column(type="string", length=100000)
     */
    private $Section;



    /**
     * @ORM\Column(type="string")
     */
    private $url;


    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\BlogCategory", inversedBy="article")
     */
    private $categoria;

    /**
     * @ORM\Column(type="date")
     */
    private $createdAt;


    /**
     * @ORM\Column(type="string", length=100000)
     */
    private $Likes='[]';

    /**
     * BlogArticle constructor.
     * @param $title
     * @param string $Img
     * @param $Section
     */
    public function __construct($title, string $Img = '[]', $Section)
    {
        $this->title = $title;
        $this->Img = $Img;
        $this->Section = $Section;
        $this->createdAt = new \DateTime();
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
    public function getImg()
    {
        return $this->Img;
    }

    /**
     * @param mixed $Img
     */
    public function setImg($Img)
    {
        $this->Img = $Img;
    }

    /**
     * @return mixed
     */
    public function getSection()
    {
        return $this->Section;
    }

    /**
     * @param mixed $Section
     */
    public function setSection($Section)
    {
        $this->Section = $Section;
    }

    /**
     * @return mixed
     */
    public function getCategoria()
    {
        return $this->categoria;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @return mixed
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * @return mixed
     */
    public function getLikes()
    {
        return $this->Likes;
    }

    /**
     * @param mixed $Likes
     */
    public function setLikes($Likes)
    {
        $this->Likes = $Likes;
    }




}
