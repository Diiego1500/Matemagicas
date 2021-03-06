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
     * @ORM\Column(type="string")
     */
    private $imageAuthor;

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
     * @ORM\Column(type="string", length=250)
     */
    private $metaDescription;


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
    public function getId()
    {
        return $this->id;
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

    /**
     * @return mixed
     */
    public function getMetaDescription()
    {
        return $this->metaDescription;
    }

    /**
     * @param mixed $metaDescription
     */
    public function setMetaDescription($metaDescription)
    {
        $this->metaDescription = $metaDescription;
    }

    /**
     * @return mixed
     */
    public function getImageAuthor()
    {
        return $this->imageAuthor;
    }

    /**
     * @param mixed $imageAuthor
     */
    public function setImageAuthor($imageAuthor)
    {
        $this->imageAuthor = $imageAuthor;
    }






}
