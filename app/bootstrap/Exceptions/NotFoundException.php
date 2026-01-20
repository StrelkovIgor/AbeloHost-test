<?php
namespace Bootstrap\Exceptions;

class NotFoundException extends \Exception
{
    protected $message = "Not found";
    protected $code = 404;
}