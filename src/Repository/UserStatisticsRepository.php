<?php

namespace App\Repository;

use App\Entity\UserStatistics;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method UserStatistics|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserStatistics|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserStatistics[]    findAll()
 * @method UserStatistics[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserStatisticsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, UserStatistics::class);
    }

    /*
    public function findBySomething($value)
    {
        return $this->createQueryBuilder('u')
            ->where('u.something = :value')->setParameter('value', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */
}
