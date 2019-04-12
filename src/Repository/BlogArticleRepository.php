<?php

namespace App\Repository;

use App\Entity\BlogArticle;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method BlogArticle|null find($id, $lockMode = null, $lockVersion = null)
 * @method BlogArticle|null findOneBy(array $criteria, array $orderBy = null)
 * @method BlogArticle[]    findAll()
 * @method BlogArticle[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BlogArticleRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, BlogArticle::class);
    }

    public function searchAllArticles()
    {
        return $this->getEntityManager()
            ->createQuery('
            SELECT article
            FROM App\Entity\BlogArticle article
            ORDER BY article.createdAt DESC
            ');
    }

    public function ReturnsearchAllArticles()
    {
        return $this->getEntityManager()
            ->createQuery('
            SELECT article
            FROM App\Entity\BlogArticle article
            ORDER BY article.createdAt DESC
            ')
            ->getResult();
    }

    public function searchArticlesByCategory($CategoryId)
    {
        return $this->getEntityManager()
            ->createQuery('
            SELECT article
            FROM App\Entity\BlogArticle article
            WHERE article.categoria =:CategoryId
            ORDER BY article.createdAt DESC
            ')
            ->setParameter('CategoryId',$CategoryId);
    }


    public function searchArticlesByUrl($Url)
    {
        return $this->getEntityManager()
            ->createQuery('
            SELECT article.id, article.Img, article.title, article.Section, article.createdAt, IDENTITY(article.categoria) as categoria, article.Likes, article.url, article.metaDescription
            FROM App\Entity\BlogArticle article
            WHERE article.url =:Url
            ')
            ->setParameter('Url',$Url)
            ->getSingleResult();
    }
}
