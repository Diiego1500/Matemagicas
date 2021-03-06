<?php

namespace App\Controller;

use App\Entity\BlogNotification;
use App\Entity\ComunityAnswer;
use App\Entity\ComunityQuestion;
use App\Entity\PracticalExercise;
use App\Entity\User;
use App\Entity\UserData;
use App\Entity\UserStatistics;
use App\Form\UserDataType;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Component\Security\Core\Security;


class IndexController extends Controller
{
    private $tokenManager;

    public function __construct(CsrfTokenManagerInterface $tokenManager = null)
    {
        $this->tokenManager = $tokenManager;
    }

    /**
     * @Route("/", name="index")
     */
    public function index(Request $request, \Swift_Mailer $mailer)
    {
        $user = $this->getUser();
        if ($user) {
            $em = $this->getDoctrine()->getManager();
            $solvedExercises = json_decode($user->getSolvedExercises());
            $lengthSolvedExercises = count($solvedExercises);
            $lengthExercises = $em->getRepository(PracticalExercise::class)->getCountExercisesRegisters();
            if ($lengthExercises > 100 and $lengthSolvedExercises < 250) {
                $user->setStarts(1);
            } elseif ($lengthExercises >= 250 and $lengthSolvedExercises < 450) {
                $user->setStarts(2);
            } elseif ($lengthSolvedExercises >= 450 and $lengthSolvedExercises < 700) {
                $user->setStarts(3);
            }
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
                $message = (new \Swift_Message('FeedBack'))
                    ->setFrom('info@matemagicas.xyz')
                    ->setTo('disenosolyluna@gmail.com')
                    ->setBody($data['Nombre'] . '-' . $data['Email'] . '-' . $data["Mensaje"]);
                $mailer->send($message);
                $this->addFlash('notice', 'Tu mensaje se ha enviado');
                return $this->redirectToRoute('index');
            } else {
                return $this->render('index/index.html.twig', array(
                    'solvedExercises' => $solvedExercises,
                    'lengthExercises' => $lengthExercises,
                    'form' => $form->createView(),
                    'isBlog' => false
                ));
            }
        } else {
            return $this->loginAction(new Request());
        }
    }


    /**
     * @Route("/login", name="fos_user_security_login")
     */
    public function loginAction(Request $request)
    {
        /** @var $session Session */
        $session = $request->getSession();

        $authErrorKey = Security::AUTHENTICATION_ERROR;
        $lastUsernameKey = Security::LAST_USERNAME;

        // get the error if any (works with forward and redirect -- see below)
        if ($request->attributes->has($authErrorKey)) {
            $error = $request->attributes->get($authErrorKey);
        } elseif (null !== $session && $session->has($authErrorKey)) {
            $error = $session->get($authErrorKey);
            $session->remove($authErrorKey);
        } else {
            $error = null;
        }

        if (!$error instanceof AuthenticationException) {
            $error = null; // The value does not come from the security component.
        }

        // last username entered by the user
        $lastUsername = (null === $session) ? '' : $session->get($lastUsernameKey);

        $csrfToken = $this->tokenManager
            ? $this->tokenManager->getToken('authenticate')->getValue()
            : null;

        $userData = new UserData();
        $RegisterForm = $this->createForm(UserDataType::class, $userData);

        return $this->renderLogin(array(
            'last_username' => $lastUsername,
            'error' => $error,
            'csrf_token' => $csrfToken,
            'registerForm' => $RegisterForm->createView()
        ));
    }

    protected function renderLogin(array $data)
    {
        return $this->render('@FOSUser/Security/login.html.twig', $data);
    }


    /**
     * @Route("/RegisterMyUser/", options={"expose"=true} ,name="RegisterMyUser")
     */
    public function RegisterUser(Request $request)
    {
        $em=$this->getDoctrine()->getManager();
        if (!$request->isXmlHttpRequest()) {
            throw new Exception("this is not an ajax Call");
        }
        $email = $request->request->get('email');
        $username = $request->request->get('username');
        $password = $request->request->get('password');
        $RegisterStatus = $this->CreateAndRegisterUser($email, $username, $password);
        $blogNotification = $em->getRepository(BlogNotification::class)->findOneBy(['email'=>$email]);
        if(!$blogNotification){
            $em->persist(new BlogNotification($email));
            $em->flush();
        }
        $array = array();
        switch ($RegisterStatus) {
            case User::EMAIL_EXIST:
                $array = array('Validation' => false, "Message" => User::EMAIL_EXIST_TEXT);
                break;
            case User::USERNAME_EXIST:
                $array = array('Validation' => false, "Message" => User::USERNAME_EXIST_TEXT);
                break;
            case User::REGISTER_SUCCESS:
                $em = $this->getDoctrine()->getManager();
                $userData = new UserData($email, $username, $password);
                $em->persist($userData);
                $em->flush();
                $array = array('Validation' => true, "Message" => User::SUCCESS_TEXT);
                break;
        }
        $response = new JsonResponse($array);
        return $response;
    }

    /**
     * @Route("/DatatoEmail/", options={"expose"=true}, name="EmailData")
     */
    public function sendDataToEmail(Request $request, \Swift_Mailer $mailer)
    {
        if (!$request->isXmlHttpRequest()) {
            throw new \Exception('Not an ajax call');
        }
        $em = $this->getDoctrine()->getManager();
        $email = $request->request->get('email');
        $user = $em->getRepository(User::class)->findOneBy(['email' => $email]);
        $host= $this->getParameter('getHost');
        if ($user) {
            $message = (new \Swift_Message('Matemágicas | Recupera tu contraseña'))
                ->setFrom('info@matemagicas.xyz')
                ->setTo($email)
                ->setBody('Recientemente has solicitado recuperar tu cuenta de Matemágicas, para hacerlo, haz click a en el siguiente: <br> '
//                    . '<a href="www.matemagicas.xyz/recover/' .$user->getUrlChangePass(). '">Enlace</a> <br>
                    .'<a href="'.$host.$user->getUrlChangePass().'">enlace</a>','text/html'
                    );
            $mailer->send($message);
            return new JsonResponse(['Validation' => true]);
        } else {
            return new JsonResponse(['Validation' => false]);
        }
    }


    /**
     * @Route("/definicion/", name="definicion")
     */
    public function Matemagicas()
    {
        return $this->render('standard/matemagicas.html.twig');
    }

    /**
     * @Route("/Acerca-de/", name="AcercaDe")
     */
    public function Acercade()
    {
        return $this->render('standard/acercade.html.twig');
    }


    /**
     * @Route("/MyQuestions/", name="UserQuestions")
     */
    public function UserQuestions(Request $request)
    {
        $userId = $this->getUser()->getId();
        $em = $this->getDoctrine()->getManager();
        $query = $em->getRepository(ComunityQuestion::class)->SearchUserQuestion($userId);


        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            10/*limit per page*/
        );

        return $this->render('standard/UserQuestions.html.twig', array('pagination' => $pagination));
    }

    /**
     * @Route("/recover/{UniqUrl}", name="ChangePassword")
     */
    public function ChangePassword(Request $request, $UniqUrl){
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository(User::class)->findOneBy(['UrlChangePass'=>$UniqUrl]);
        $form = $this->createFormBuilder()
            ->add('email',EmailType::class)
            ->add('Pass' , PasswordType::class)
            ->add('Enviar',SubmitType::class)
            ->getForm();
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $data = $form->getData();

            ///////////////////////////////////
            if($user->getEmail() == $data['email']){
                $user->setPlainPassword($data['Pass']);
                $user->setPassword($data['Pass']);
                $em->flush();
            }else{
                $this->addFlash('warning', 'El correo electrónico es incorrecto');

                return $this->redirectToRoute('ChangePassword',['UniqUrl'=>$UniqUrl]);
            }
            ///////////////////////////////////
            return $this->redirectToRoute('PasswordChanged');
        }
        return $this->render('standard/changePassword.html.twig', array(
            'userName'=>$user->getUsername(),
            'form'=>$form->createView()
        ));
    }

    /**
     * @Route("/PasswordChanged/", name="PasswordChanged")
     */
    public function PasswordChanged(){
        return $this->render('standard/PasswordChanged.html.twig');
    }


    private function CreateAndRegisterUser($email, $username, $password)
    {
        $statistics = new UserStatistics(0, 0, 0);
        $userManager = $this->get('fos_user.user_manager');
        $email_exist = $userManager->findUserByEmail($email);
        $user_exist = $userManager->findUserByUsername($username);
        if ($email_exist) {
            return User::EMAIL_EXIST;
        } elseif ($user_exist) {
            return User::USERNAME_EXIST;
        }
        $user = $userManager->createUser();
        $user->setUsername($username);
        $user->setEmail($email);
        $user->setEmailCanonical($email);
        $user->setEnabled(true);
        $user->setPlainPassword($password);
        $user->addRole('ROLE_USER');
        $user->setStatistics($statistics);
        $user->setUrlChangePass($this->generateUniqueUrl().$user->getId());
        $userManager->updateUser($user);
        return User::REGISTER_SUCCESS;
    }


    private function generateUniqueUrl()
    {
        // md5() reduces the similarity of the file names generated by
        // uniqid(), which is based on timestamps
        return md5(uniqid());
    }





}
