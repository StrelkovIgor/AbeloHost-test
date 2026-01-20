<?php
namespace App\Controllers\Traits;

use Smarty\Smarty;

trait ViewTrait
{

    public $smarty = null;

    public function getSmarty()
    {
        var_dump(__DIR__);
        exit;

        $this->smarty = new Smarty();
        $this->smarty->assign('test');
        var_dump($this->smarty);;
    }
}