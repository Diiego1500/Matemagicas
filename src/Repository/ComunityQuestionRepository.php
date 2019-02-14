<?php

namespace App\Repository;

use App\Entity\ComunityQuestion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method ComunityQuestion|null find($id, $lockMode = null, $lockVersion = null)
 * @method ComunityQuestion|null findOneBy(array $criteria, array $orderBy = null)
 * @method ComunityQuestion[]    findAll()
 * @method ComunityQuestion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ComunityQuestionRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, ComunityQuestion::class);
    }

    public function SearchQuestions(){
        return $this->getEntityManager()
            ->createQuery('
                SELECT pregunta.title, pregunta.question, pregunta.url, pregunta.date, pregunta.solved
                FROM App\Entity\ComunityQuestion pregunta
                ORDER BY pregunta.id DESC
            ');
    }

    public function SearchUserQuestion($idUser){
        return $this->getEntityManager()
            ->createQuery('
                SELECT pregunta.title, pregunta.url, pregunta.date
                FROM App\Entity\ComunityQuestion pregunta
                WHERE pregunta.usuario=:idUser
                ORDER BY pregunta.id DESC
            ')
            ->setParameter('idUser',$idUser);
    }
}
