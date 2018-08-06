<?php

error_reporting(E_ALL);

use Phalcon\Mvc\Application;
use Phalcon\Config\Adapter\Ini as ConfigIni;

try {
    define('APP_PATH', realpath('..') . '/');

    /**
     * Read the configuration
     */
    $config = new ConfigIni(APP_PATH . 'app/config/config.ini');
    if (is_readable(APP_PATH . 'app/config/config.ini.dev')) {
        $override = new ConfigIni(APP_PATH . 'app/config/config.ini.dev');
        $config->merge($override);
    }


    /**
     * Auto-loader configuration
     */
    require APP_PATH . 'app/config/loader.php';

    $application = new Application(new Services($config));

    // NGINX - PHP-FPM already set PATH_INFO variable to handle route
    echo $application->handle(!empty($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : null)->getContent();

    $di = new Phalcon\DI\FactoryDefault();

    $di->set('session', function() {
        $session = new Phalcon\Session\Adapter\Files();
        if (session_status() == PHP_SESSION_NONE) {
            $session->start();
        }
        return $session;
    });
} catch (Exception $e){
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
