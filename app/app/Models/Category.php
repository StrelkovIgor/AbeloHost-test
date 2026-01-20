<?php


namespace App\Models;


use Bootstrap\App\Model;

class Category extends Model
{
    public function test()
    {
        var_dump($this->db->query('select * from categories')->get());
    }
}