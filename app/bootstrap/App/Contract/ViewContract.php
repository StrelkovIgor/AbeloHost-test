<?php


namespace Bootstrap\App\Contract;


interface ViewContract
{
    public function render(string $template, ?array $value = null) :void;
    public function setVariables(string|array $name, mixed $value = null);
    public function fetch(string $template) :string;
}