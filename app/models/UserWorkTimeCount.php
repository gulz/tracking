<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;

class UserWorkTimeCount extends Model
{
    public function validation()
    {
        $validator = new Validation();


    }
}

