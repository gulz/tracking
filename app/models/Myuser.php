<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;

class Myuser extends Model
{
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'login',
            new UniquenessValidator([
                'message' => 'Sorry, That login is already taken'
            ]));
        $validator->add(
            'email',
            new EmailValidator([
                'message' => 'Invalid email given'
            ]));
        $validator->add(
            'email',
            new UniquenessValidator([
                'message' => 'Sorry, The email was registered by another user'
            ]));
        $validator->add(
            'username',
            new UniquenessValidator([
                'message' => 'Sorry, That username is already taken'
            ]));

        return $this->validate($validator);
    }
}
