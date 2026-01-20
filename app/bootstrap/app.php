<?php
use Bootstrap\App;

require path('routes/web.php');


(new App\Application())
    /**
     * Организация шаблонов
     */
    ->bind(App\Contract\ViewContract::class, function(){
        $config = require path('config/smarty.php');
        return new App\View($config);
    })
    /**
     * Организация работы с базой
     */
    ->bind(App\Contract\DataBaseContract::class, function(){
        $config = require path('config/database.php');
        return new App\DataBase($config);
    })
    /**
     * Обработка роутов и контроллеров
     */
    ->render()
    /**
     * Вывод результатов / Обработка ошибок
     */
    ->inference(function($exception, $app){
        var_dump($exception);
        exit;
    });
