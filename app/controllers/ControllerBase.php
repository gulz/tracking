<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    private $layoutname="main";
    protected function initialize()
    {
        $this->tag->prependTitle('INVO | ');
        $this->view->setTemplateAfter($this->layoutname);
    }
    protected function setLayoutName($layout)
    {
        $this->layoutname=$layout;
    }
    protected function testauth()
    {
        if(!$this->session->has('login'))
        {
            $this->response->redirect('tracking/login');


        }

    }
}
