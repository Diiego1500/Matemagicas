<?php

namespace App\Controller;

use App\Entity\BlogArticle;
use App\Entity\BlogCategory;
use App\Entity\User;
use Doctrine\ORM\NoResultException;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class BlogController extends Controller
{
    /**
     * @Route("/blog/{Categoryname}/", name="blog")
     */
    public function index($Categoryname, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $Categories = $em->getRepository(BlogCategory::class)->SearchNameCategory();
        $paginator = $this->get('knp_paginator');
        if ($Categoryname == 'All') {
            $Articles = $em->getRepository(BlogArticle::class)->findAll();
//            $Articles = $em->getRepository(BlogArticle::class)->searchAllArticles();
        } else {
            $Category = $em->getRepository(BlogCategory::class)->searchCategoryByName($Categoryname);
            $Articles = $em->getRepository(BlogArticle::class)->findBy(['categoria' => $Category]);

//            $Articles = $em->getRepository(BlogArticle::class)->searchArticlesByCategory($Category);
        }
        $pagination = $paginator->paginate($Articles, $request->query->getInt('page', 1), 2);
        $pagination->setTemplate('bundles/KNPPaginatorBundle/Paginador.html.twig');

        return $this->render('blog/index.html.twig', array('pagination' => $pagination, "Categories" => $Categories,));
    }

    /**
     * @Route("/blog/search/{param}/", options={"expose"=true}, name="searchBlog")
     */
    public function search(Request $request, $param){
        $em = $this->getDoctrine()->getManager();
        $paginator = $this->get('knp_paginator');
        $Categories = $em->getRepository(BlogCategory::class)->SearchNameCategory();
        try{
            $Category = $em->getRepository(BlogCategory::class)->searchCategoryByName($param);
        }catch (NoResultException $ex){
            $Category = null;
        }
        if($Category){
            $Articles = $em->getRepository(BlogArticle::class)->findBy(['categoria' => $Category]);
        }else{
            $Articles = $em->getRepository(BlogArticle::class)->findBy(array("title"=>$param));
        }
        $pagination = $paginator->paginate($Articles, $request->query->getInt('page', 1), 2);
        $pagination->setTemplate('bundles/KNPPaginatorBundle/Paginador.html.twig');

        return $this->render('blog/index.html.twig', array('pagination' => $pagination, "Categories" => $Categories,));
    }

    /**
     * @Route("/blog/post/{Url}/", name="Article")
     */
    public function Article($Url, Request $request, \Swift_Mailer $mailer )
    {
        $em = $this->getDoctrine()->getManager();
        $Article = $em->getRepository(BlogArticle::class)->searchArticlesByUrl($Url);
        $Category = $em->getRepository(BlogCategory::class)->getNameOnly($Article['categoria']);
        $text = html_entity_decode($Article['Section']);
        $LikesThisArticle = json_decode($Article['Likes']);


        $defaultData = array('message' => 'Type your message here');
        $form = $this->createFormBuilder($defaultData)
            ->add('Nombre', TextType::class)
            ->add('Email', EmailType::class)
            ->add('Mensaje', TextareaType::class)
            ->add('Enviar', SubmitType::class)
            ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $message = (new \Swift_Message('Blog'))
                ->setFrom('info@foodies24-7.com')
                ->setTo('disenosolyluna@gmail.com')
                ->setBody($data['Nombre'].'-'.$data['Email'].'-'.$data["Mensaje"]);
            $mailer->send($message);
            $this->addFlash('notice','Tu mensaje se ha enviado');
            return $this->redirectToRoute('Article',['Url'=>$Url]);
        }

        return $this->render('blog/article.html.twig',
            array(
                "Article" => $Article,
                'Text' => $text,
                "CantLikesThisArticle"=>$LikesThisArticle,
                "Category"=>$Category,
                'form'=>$form->createView()
            )
        );
    }


    /**
     * @Route("/Like/", options={"expose"=true}, name="Like")
     */
    public function LikeArticle(Request $request)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new \Exception('This is not an ajax Call');
        }
        $em = $this->getDoctrine()->getManager();
        $PostId = $request->request->get('postId');
        $UserId = $request->request->get('userId');
        $Article = $em->getRepository(BlogArticle::class)->find($PostId);
        $Likes = json_decode($Article->getLikes());
        if(!(in_array($UserId,$Likes))){
            $Likes[]=$UserId;
            $Article->setLikes(json_encode($Likes));
            $em->flush();
        }
        return new JsonResponse(['success' => count($Likes) ]);
    }
}
