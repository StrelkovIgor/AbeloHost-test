<?php
use Bootstrap\App\Route;
use App\Controllers;

$route = Route::getInstance();

$route->addRoute('GET', '/', [Controllers\BlogController::class, 'home']);
$route->addRoute('GET', '/category/{categoryId}', [Controllers\BlogController::class, 'category']);
$route->addRoute('GET', '/category/{categoryId}/blog/{blogId}', [Controllers\BlogController::class, 'blog']);