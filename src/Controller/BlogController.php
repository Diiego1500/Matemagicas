<?php

namespace App\Controller;

use App\Entity\BlogArticle;
use App\Entity\BlogCategory;
use App\Entity\BlogNotification;
use App\Form\BlogNotificationType;
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
//            $Articles = $em->getRepository(BlogArticle::class)->findAll();
            $Articles = $em->getRepository(BlogArticle::class)->searchAllArticles();
        } else {
            $Category = $em->getRepository(BlogCategory::class)->searchCategoryByName($Categoryname);
//            $Articles = $em->getRepository(BlogArticle::class)->findBy(['categoria' => $Category],['createdAt'=>'DESC']);
            $Articles = $em->getRepository(BlogArticle::class)->searchArticlesByCategory($Category);
        }
        $pagination = $paginator->paginate($Articles, $request->query->getInt('page', 1), 9);
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
        $blogNotificacion = new BlogNotification();
        $Article = $em->getRepository(BlogArticle::class)->searchArticlesByUrl($Url);
        $Category = $em->getRepository(BlogCategory::class)->getNameOnly($Article['categoria']);
        $text = html_entity_decode($Article['Section']);
        $LikesThisArticle = json_decode($Article['Likes']);
        $defaultData = array('message' => 'Type your message here');
        $formularioNotificacion = $this->createForm(BlogNotificationType::class, $blogNotificacion);
        $form = $this->createFormBuilder($defaultData)
            ->add('Nombre', TextType::class)
            ->add('Email', EmailType::class)
            ->add('Mensaje', TextareaType::class)
            ->add('Enviar', SubmitType::class)
            ->getForm();
        $form->handleRequest($request);
        $formularioNotificacion->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $message = (new \Swift_Message('Blog'))
                ->setFrom('info@matemagicas.xyz')
                ->setTo('disenosolyluna@gmail.com')
                ->setBody($data['Nombre'].'-'.$data['Email'].'-'.$data["Mensaje"]);
            $mailer->send($message);
            $this->addFlash('notice','Tu mensaje se ha enviado');
            return $this->redirectToRoute('Article',['Url'=>$Url]);
        }
        if($formularioNotificacion->isSubmitted() && $formularioNotificacion->isValid()){
            $blogNotificacion= $formularioNotificacion->getData();

            if($this->EmailExist($blogNotificacion->getEmail())){
                $this->addFlash('success','Ya se encuentra registrado en nuestro sistema');
            }else{
                $em->persist($blogNotificacion);
                $em->flush();
                $this->addFlash('success','Ahora recibirás nuestros contenidos c:');
            }

            return $this->redirectToRoute('Article',['Url'=>$Url]);
        }

        return $this->render('blog/article.html.twig',
            array(
                "Article" => $Article,
                'Text' => $text,
                "CantLikesThisArticle"=>$LikesThisArticle,
                "Category"=>$Category,
                'form'=>$form->createView(),
                'formEmail'=>$formularioNotificacion->createView()
            )
        );
    }

    private function EmailExist($email){
        $em = $this->getDoctrine()->getManager();
        $exist = $em->getRepository(BlogNotification::class)->findBy(['email'=>$email]);
        if($exist){
            return true;
        }
        return false;
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

    /**
     * @Route("/unsubscribe/{secretToken}/", name="unsubscribe")
     */
    public function unsubscribe($secretToken){
        $em = $this->getDoctrine()->getManager();
        $blogNotification = $em->getRepository(BlogNotification::class)->findOneBy(['secretToken'=>$secretToken]);
        if($blogNotification){
            $this->addFlash('mensaje','Ya no recibirás nuestras notificaciones');
            $em->remove($blogNotification);
            $em->flush();
        }
        else{
            $this->addFlash('mensaje','No estás en nuestra lista de notificaciones');
        }
        return $this->render('standard/unsubscribed.html.twig');
    }



    /**
     * @Route("/sendEmailtoSubscribers/71sa7e68c6fd4r0d56b4ed921ctc723tokenbb2/", name="sendEmailtoSubscribers")
     */
    public function sendEmailtoSubscribers(\Swift_Mailer $mailer){
        $em = $this->getDoctrine()->getManager();
        $BlogNotifications = $em->getRepository(BlogNotification::class)->findAll();
        $Post = $em->getRepository(BlogArticle::class)->findOneBy(['createdAt'=>new \DateTime()]);
        foreach($BlogNotifications as $blognotification){
            if($blognotification->getActivate()){
                $this->SendPost($blognotification->getEmail(), $mailer, $Post, $blognotification);
                $recibidos = json_decode($blognotification->getBlogRecibido());
                $recibidos[]=$Post->getId();
                $blognotification->setBlogRecibido(json_encode($recibidos));
                $em->flush();
            }
        }
        return new JsonResponse(["success"=>true]);
    }


    public function SendPost($Sendto, $mailer, $post,$blognotification)
    {
        $message = (new \Swift_Message('NUEVO POST MATEMÁGICAS: '.$post->getTitle()))
            ->setFrom('info@matemagicas.xyz')
            ->setTo($Sendto)
            ->setBody('Matemágicas ha creado un nuevo Post, visitalo en este  <a href="localhost/MatemagicasDev/public/index.php/blog/post/'.$post->getUrl().'/">enlace</a> <br><br>
                    Si no deseas recibir más notificaciones, haz click: <a href="localhost/MatemagicasDev/public/index.php/unsubscribe/'.$blognotification->getSecretToken().'/">aquí</a>'
                ,  'text/html');
        $mailer->send($message);
    }
}
