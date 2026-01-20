<?php

namespace Bootstrap\App;

use Bootstrap\App\Contract\RouteContract;
use Bootstrap\Patterns\Singleton;

class Route extends Singleton implements RouteContract
{

    protected $routes = [];

    public function addRoute(string $method, string $path, array $handler)
    {
        $pattern = preg_replace('/\{([a-zA-Z0-9_]+)\}/', '(?P<$1>[^/]+)', $path);
        $pattern = "#^" . $pattern . "$#";

        $this->routes[] = [
            'method' => strtoupper($method),
            'pattern' => $pattern,
            'handler' => $handler
        ];
    }

    public function dispatch(string $requestMethod, string $requestUri)
    {
        $path = parse_url($requestUri, PHP_URL_PATH);

        foreach ($this->routes as $route) {
            if ($route['method'] === $requestMethod && preg_match($route['pattern'], $path, $matches)) {
                $params = array_filter($matches, 'is_string', ARRAY_FILTER_USE_KEY);
//                return $this->executeHandler($route['handler'], $params);
                return [$route['handler'], $params];
            }
        }

//        http_response_code(404);
//        echo "404 Not Found";
        return null;

    }

    protected function executeHandler($handler, $params = [])
    {
        if (is_array($handler)) {
            [$controllerName, $method] = $handler;
            if (class_exists($controllerName)) {
                $controller = new $controllerName();
                if (method_exists($controller, $method)) {
                    // Передаем параметры в метод контроллера
                    return call_user_func_array([$controller, $method], $params);
                }
            }
        }

        if (is_callable($handler)) {
            return call_user_func_array($handler, $params);
        }

        http_response_code(500);
        echo "500 Internal Server Error: Invalid Handler";
    }

}