<?php

namespace App\Repository;

use App\Entity\PracticalExercise;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method PracticalExercise|null find($id, $lockMode = null, $lockVersion = null)
 * @method PracticalExercise|null findOneBy(array $criteria, array $orderBy = null)
 * @method PracticalExercise[]    findAll()
 * @method PracticalExercise[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PracticalExerciseRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, PracticalExercise::class);
    }


    public function searchExercisesByThemeId($id)
    {
        return $this->getEntityManager()
            ->createQuery('
                SELECT exercise.id, exercise.level, exercise.problemPath
                FROM App\Entity\PracticalExercise exercise
                WHERE exercise.theme =:id
                ORDER BY exercise.level ASC
            ')
            ->setParameter('id', $id)
            ->getResult();
    }

    public function searchExerciseById($id)
    {
        return $this->getEntityManager()
            ->createQuery('
                SELECT exercise.problemPath, exercise.id, exercise.level, exercise.nextExercise, exercise.boardType, IDENTITY(exercise.theme) as idTheme, exercise.Seeanswer
                FROM App\Entity\PracticalExercise exercise
                 WHERE exercise.id =:id
            ')
            ->setParameter('id', $id)
        ->getSingleResult();
    }

    public function getCountExercisesRegisters(){
        return $this->getEntityManager()
            ->createQuery('
            SELECT (COUNT(exercise))
            FROM App\Entity\PracticalExercise exercise            
            ')
            ->getSingleScalarResult();
    }

}
