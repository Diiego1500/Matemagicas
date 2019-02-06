<?php

namespace App\Repository;

use App\Entity\BlogCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method BlogCategory|null find($id, $lockMode = null, $lockVersion = null)
 * @method BlogCategory|null findOneBy(array $criteria, array $orderBy = null)
 * @method BlogCategory[]    findAll()
 * @method BlogCategory[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BlogCategoryRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, BlogCategory::class);
    }

    public function searchCategoryByName($Name)
    {
        return $this->getEntityManager()
            ->createQuery('
            SELECT category.id
            FROM App\Entity\BlogCategory category
            WHERE category.Name =:name
            ')
            ->setParameter('name',$Name)
            ->getSingleResult(Query::HYDRATE_SINGLE_SCALAR);
    }

    public function SearchNameCategory(){
        return $this->getEntityManager()
        ->createQuery('
            SELECT category.Name
            FROM App\Entity\BlogCategory category
            ')
            ->getResult();
    }

    public function getNameOnly($id){
        return $this->getEntityManager()
            ->createQuery('
            SELECT category.Name
            FROM App\Entity\BlogCategory category
            WHERE category.id =:id
            ')
            ->setParameter('id',$id)
            ->getSingleResult(Query::HYDRATE_SINGLE_SCALAR);
    }
}
