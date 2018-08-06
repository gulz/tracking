<?php

/**
 * TrackingController
 *
 * Allows to register new users
 */
class TrackingController extends ControllerBase
{
    public function initialize()
    {

        $this->assets->addCss("assets/css/lib/bootstrap.min.css");
        $this->assets->addCss("assets/css/lib/font-awesome.min.css");
        $this->assets->addCss("assets/css/lib/owl.carousel.min.css");
        $this->assets->addCss("assets/css/lib/animations.min.css");
        $this->assets->addCss("assets/css/style.css");
        $this->assets->addCss("assets/css/light.css");
        $this->assets->addCss("assets/css/responsive.css");

        $this->tag->setTitle('Sign Up/mytest');
        $this->setLayoutName('tracking');
        $this->view->path= APP_PATH;
        parent::initialize();

    }

    /**
     *
     */
    public function indexAction()
    {
        $this->testauth();
        try {


            $user_work = UserWorkTimeCount::findFirst([
                            "user_id = :user_id: AND date = :date:",
                            'bind' => ['user_id' => $this->session->get('user_id'), 'date' => date("Y-m-d")]
                          ]);


            if ($user_work) {
                if ($user_work->end == null) {
                    $this->view->btn_name = "стоп";
                } else {
                    $this->view->btn_name = "вы отработали за сегодня";
                }
                $this->view->work_time = explode(":", $user_work->start);
            } else {
                $this->view->btn_name = "запуск";
                $get_time = StartWorkTime::findFirst();
                $this->view->date_elements = explode(":", $get_time->time);
                $now_time = explode(":", date('H:i:s'));
                $a = date('H') * 3600 + date('i') * 60 + date('s');
                $b = $this->view->date_elements[0] * 3600 + $this->view->date_elements[1] * 60 + $this->view->date_elements[2];

                if ($a > $b) {
                    $tardiness = array();

                    $tardiness[0] = $now_time[0] - $this->view->date_elements[0];
                    $tardiness[1] = $now_time[1] - $this->view->date_elements[1];
                    $tardiness[2] = $now_time[2] - $this->view->date_elements[2];
                    foreach ($tardiness as $key => $val){
                        if ($val < 0) {
                            $tardiness[$key] = $tardiness[$key] * (-1);
                        }
                    }

                    $this->view->t_status = true;
                    $this->view->tardiness = $tardiness;
                    // echo date("h:m:s", mktime(0, 0, 0, date('m'), date('d') - 3, date('Y')));

                } else {
                    $tardiness = array();
                    $c = $b - $a;

                    $tardiness[0] = $this->view->date_elements[0] - $now_time[0] - 1;
                    $tardiness[1] = $this->view->date_elements[1] - (59 - $now_time[1]);
                    $tardiness[2] = $this->view->date_elements[2] - (59 - $now_time[2]);
                    foreach ($tardiness as $key => $val) {
                        if ($val < 0) {
                            $tardiness[$key] = $tardiness[$key] * (-1);
                        }
                    }

                    $this->view->t_status = false;
                    $this->view->tardiness = $tardiness;
                }
            }
        }
        catch (Exception $e){
            echo $e->getMessage();
        }


        //echo (new \Phalcon\Debug\Dump())->variable($date_elements);

    }
    public function worktestAction()
    { $this->view->disable();
        try {
        if ($this->request->isPost())
        {
            $stat=$this->request->getPost('stat');
            if($stat=='start')
            {

                $userw = new UserWorkTimeCount();
                $userw->user_id = $this->session->get('user_id');
                $userw->date = date('Y-m-d');
                $userw->start = date('H:i:s');
                $userw->end = null;
                $userw->save();

                $ret_date= explode(":",date('H:i:s'));


                $this->response->setContent(json_encode($ret_date));
                //Return the response
                return $this->response;

            }
            else
            {


                    $userw =UserWorkTimeCount::query()
                        ->where("user_id = :user_id:")
                        ->andWhere("date = :date:")
                        ->bind(["user_id" => $this->session->get('user_id'),"date"=>date('Y-m-d')])
                        ->execute();
                    foreach ($userw as $value){
                        echo $value->date;
                        $value->end = date('H:i:s');
                        $value->update();
                        $this->response->setContent(json_encode($value->start));
                        //Return the response
                        return $this->response;
                    }


            }
        }
        }
        catch (Exception $e)
        {
            echo $e->getMessage();
            echo $e->getLine();
        }


    }
    public function loginAction()
    {
        if ($this->request->isPost())
        {

            $login = $this->request->getPost('login');
            $password = $this->request->getPost('password');
            $user = Myuser::findFirst(
                [
                "login = :login: AND password = :password: AND status = '1'",
                'bind' => [
                    'login' => $login,
                    'password' => $password,
                           ]
                ]
            );

            if ($user != false) {
                $this->session->set('email',$user->email);
                $this->session->set('user_id',$user->id);
                $this->session->set('login',$user->login);
               $this->session->set('name',$user->name);
                //$this->flash->success('Welcome ' . $user->name);

                return $this->response->redirect(
                  'tracking/index'
                );

            }
            else {

                $this->flash->error('Wrong login/password');
            }
        }

    }
    public function exitAction()
    {
        $this->session->remove('name');
        $this->session->remove('login');
        return $this->response->redirect('tracking/index');
        $this->view->disable();
    }

}