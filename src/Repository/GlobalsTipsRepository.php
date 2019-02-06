<?php

namespace App\Repository;

use App\Entity\GlobalsTips;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method GlobalsTips|null find($id, $lockMode = null, $lockVersion = null)
 * @method GlobalsTips|null findOneBy(array $criteria, array $orderBy = null)
 * @method GlobalsTips[]    findAll()
 * @method GlobalsTips[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GlobalsTipsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, GlobalsTips::class);
    }

    public function getCountRegisters(){
        return $this->getEntityManager()
            ->createQuery('
            SELECT COUNT(tip.id)
            FROM App\Entity\GlobalsTips tip            
            ')
            ->getSingleScalarResult();
    }
}
