<?php

namespace Bootstrap\App\Contract;

interface RouteContract
{
    public function dispatch(string $requestMethod, string $requestUri);
}