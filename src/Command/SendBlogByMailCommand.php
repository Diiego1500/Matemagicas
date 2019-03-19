<?php

namespace App\Command;

use App\Entity\BlogArticle;
use App\Entity\BlogNotification;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Validator\Constraints\DateTime;

class SendBlogByMailCommand extends Command
{
    protected static $defaultName = 'app:enviar-mails';
    private $em ;
    public function __construct(EntityManagerInterface $em)
    {
        parent::__construct();
        $this->em= $em;
    }

    protected function configure()
    {
        $this
            ->setDescription('Envía Blogs a los Mails de BlogNotification');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $em = $this->em;
        $Post = $em->getRepository(BlogArticle::class)->findOneBy(['createdAt'=>new \DateTime()]);
        $io = new SymfonyStyle($input, $output);
        if($Post) {
            $transport = (new \Swift_SmtpTransport('smtp.hostinger.co', 587 ))
                ->setUsername('contacto@matemagicas.xyz')
                ->setPassword('Maatemagicas150');
            $mailer = new \Swift_Mailer($transport);
            $BlogNotifications = $em->getRepository(BlogNotification::class)->findAll();
            foreach($BlogNotifications as $blognotification){
                if($blognotification->getActivate()){
                    $this->SendPost($blognotification->getEmail(), $mailer, $Post);
                    $io->success('Enviando Post: ' . $blognotification->getEmail());
                }
            }
        }else{
            $io->success('No hay post El día de hoy');
        }
    }



    public function SendPost($Sendto, $mailer, $post)
    {
        $message = (new \Swift_Message('POST MATEMÁGICAS: '.$post->getTitle()))
            ->setFrom('contacto@matemagicas.xyz')
            ->setTo($Sendto)
            ->setBody('Matemágicas ha creado un nuevo Post, visitalo en: ',  'text/html');
        $mailer->send($message);
    }
}
