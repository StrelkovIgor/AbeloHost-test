<?php
namespace App\Controllers;

use Bootstrap\App\Contract\DataBaseContract;
use Bootstrap\App\Contract\ViewContract;

class TestController extends Controller
{

    public function index()
    {
        var_dump('123');
    }

    public function index2(DataBaseContract $db)
    {
//        var_dump($db);
    }

}