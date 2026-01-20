<?php

namespace Bootstrap\App;

use Bootstrap\Exceptions\NotFoundException;
use Bootstrap\Patterns\ServiceContainer;

class Application extends ServiceContainer
{
    protected \Exception|null $exception = null;
    protected mixed $inference = null;

    public function render()
    {
        try {
            $route = Route::getInstance();
            $routeDispatch = $route->dispatch($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);
            $this->inference = $this->executeHandler($routeDispatch);
        }catch (\Exception $e) {
            $this->exception = $e;
        }

        return $this;
    }

    public function executeHandler(?array $route) :mixed
    {
        if(is_array($route)) {
            list($handler, $params) = $route;
            list($controllerClass, $method) = $handler;
            $controller = new $controllerClass();

            $reflection = new \ReflectionMethod($controller, $method);
            $args = [];

            foreach ($reflection->getParameters() as $param) {

                if ($type = $param->getType()) {
                    $args[] = $this->make($type->getName());
                } else {
                    $args[] = isset($params[$param->name]) ? $params[$param->name] : null;
                }
            }

            return $reflection->invokeArgs($controller, $args);
        }

        throw new NotFoundException();
    }

    public function inference(?callable $exceptionValidate = null)
    {
        if ($this->exception && is_callable($exceptionValidate)) {
            $this->inference = $exceptionValidate($this->exception, $this);
        }

        echo $this->inference;
    }
}