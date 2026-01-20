<?php


namespace Bootstrap\App;


class Model
{
    protected $varible = [];

    public function __construct(
        protected $db
    ){

    }

    public function __set(string $name, $value): void
    {
        $this->varible[$name] = $value;
    }

    public function __get(string $name)
    {
        if(isset($this->varible[$name])) {
            return $this->varible[$name];
        }

        return $this->{$name};
    }

}