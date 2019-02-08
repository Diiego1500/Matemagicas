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

    /*
    public function findBySomething($value)
    {
        return $this->createQueryBuilder('c')
            ->where('c.something = :value')->setParameter('value', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */
}
