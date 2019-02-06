<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 */
class User extends BaseUser
{
    const USERNAME_EXIST = 0;
    const EMAIL_EXIST = 1;
    const REGISTER_SUCCESS = 2;
    const SUCCESS_TEXT = '¡Felicitaciones! Ya haces parte de nuestra comunidad';
    const USERNAME_EXIST_TEXT = 'Lamentablemente el nombre de usuario ya existe. No te desanimes, prueba con otro';
    const EMAIL_EXIST_TEXT = 'Al parecer ya existe una cuenta creada con este correo electrónico.';
    const UPLOADPATH = '../public/Img/photos/';
    const PATH = '/Matemagicas/public/Img/photos/';


    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    protected $id;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\UserStatistics",cascade={"persist"})
     * @ORM\JoinColumn(name="statistics_id", referencedColumnName="id")
     */
    private $statistics;


    /**
     *  @ORM\Column(type="string", length=9000)
     */
    private $solvedExercises='[]';

    /**
     * @ORM\Column(type="string", length=1000)
     */
    private $AvailableThemes='[4]';


    /**
     * @ORM\Column(type="smallint")
     */
    private $starts=0;


    /**
     * @ORM\Column(type="string")
     */
    private $imgProfile='anonimo.jpg';

    /**
     * @ORM\Column(type="boolean")
     */
    //tipo de tablero (drag and drop - clickeable) escogido por el usuario
    private $BoardKind=true;

    /**
     * User constructor.
     */
    public function __construct()
    {
        parent::__construct();
        // your own logic
    }

    /**
     * @return mixed
     */
    public function getStatistics()
    {
        return $this->statistics;
    }

    /**
     * @param mixed $statistics
     */
    public function setStatistics($statistics)
    {
        $this->statistics = $statistics;
    }

    /**
     * @return mixed
     */
    public function getSolvedExercises()
    {
        return $this->solvedExercises;
    }

    /**
     * @param mixed $solvedExercises
     */
    public function setSolvedExercises($solvedExercises)
    {
        $this->solvedExercises = $solvedExercises;
    }

    /**
     * @return mixed
     */
    public function getStarts()
    {
        return $this->starts;
    }

    /**
     * @param mixed $starts
     */
    public function setStarts($starts)
    {
        $this->starts = $starts;
    }

    /**
     * @return mixed
     */
    public function getImgProfile()
    {
        return $this->imgProfile;
    }

    /**
     * @param mixed $imgProfile
     */
    public function setImgProfile($imgProfile)
    {
        $this->imgProfile = $imgProfile;
    }

    /**
     * @return mixed
     */
    public function getAvailableThemes()
    {
        return $this->AvailableThemes;
    }

    /**
     * @param mixed $AvailableThemes
     */
    public function setAvailableThemes($AvailableThemes)
    {
        $this->AvailableThemes = $AvailableThemes;
    }

    /**
     * @return mixed
     */
    public function getBoardKind()
    {
        return $this->BoardKind;
    }

    /**
     * @param mixed $BoardKind
     */
    public function setBoardKind($BoardKind)
    {
        $this->BoardKind = $BoardKind;
    }










}
