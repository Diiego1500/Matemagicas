<?php

namespace App\Repository;

use App\Entity\BlogNotification;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method BlogNotification|null find($id, $lockMode = null, $lockVersion = null)
 * @method BlogNotification|null findOneBy(array $criteria, array $orderBy = null)
 * @method BlogNotification[]    findAll()
 * @method BlogNotification[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BlogNotificationRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, BlogNotification::class);
    }

    /*
    public function findBySomething($value)
    {
        return $this->createQueryBuilder('b')
            ->where('b.something = :value')->setParameter('value', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */
}
