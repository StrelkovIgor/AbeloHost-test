<?php

function path($path)
{
    $dir = explode('/',__DIR__);
    array_pop($dir);
    return implode('/', $dir) . '/' . $path;
}