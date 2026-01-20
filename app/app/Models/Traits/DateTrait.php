<?php
namespace App\Models\Traits;

trait DateTrait
{

    public function getDate(string $name,?string $format = null) :string|\DateTime
    {
        $date = new \DateTime($this->{$name});
        if($format) {
            return $date->format($format);
        }
        return $date;
    }

}