<?php

namespace App\Repository;

use App\Entity\ComunityAnswer;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method ComunityAnswer|null find($id, $lockMode = null, $lockVersion = null)
 * @method ComunityAnswer|null findOneBy(array $criteria, array $orderBy = null)
 * @method ComunityAnswer[]    findAll()
 * @method ComunityAnswer[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ComunityAnswerRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, ComunityAnswer::class);
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
