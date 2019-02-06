<?php

namespace App\Repository;

use App\Entity\Theme;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Theme|null find($id, $lockMode = null, $lockVersion = null)
 * @method Theme|null findOneBy(array $criteria, array $orderBy = null)
 * @method Theme[]    findAll()
 * @method Theme[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ThemeRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Theme::class);
    }

    public function searchThemeBySection($section){
        return $this->getEntityManager()
            ->createQuery('
            SELECT theme.name, theme.id, theme.description
            FROM App\Entity\Theme theme
            WHERE theme.section =:section
            ')
            ->setParameter('section',$section)
            ->getResult();
    }

    public function searchSourceById($Id){
        return $this->getEntityManager()
            ->createQuery('
             SELECT theme.source as source
             FROM App\Entity\Theme theme
             WHERE theme.id =:id
            ')
            ->setParameter('id', $Id)
            ->getSingleResult();
    }


    public function searchNameThemeById($id){
        return $this->getEntityManager()
            ->createQuery('
                SELECT theme.name as name
                FROM App\Entity\Theme theme
                WHERE theme.id =:id
            ')
            ->setParameter('id', $id)
            ->getSingleResult();
    }
}
