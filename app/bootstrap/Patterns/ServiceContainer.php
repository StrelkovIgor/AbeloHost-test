<?php


namespace Bootstrap\Patterns;


class ServiceContainer
{
    protected array $bindings = [];

    public function bind(string $abstract, callable $factory)
    {
        $this->bindings[$abstract] = $factory;
        return $this;
    }

    public function make(string $abstract)
    {
        // Если есть биндинг — используем его
        if (isset($this->bindings[$abstract])) {
            return ($this->bindings[$abstract])($this);
        }

        // Иначе пробуем создать класс автоматически
        return $this->build($abstract);
    }

    protected function build(string $class)
    {
        if (!class_exists($class)) {
            throw new \Exception("Class {$class} not found");
        }

        $reflection = new \ReflectionClass($class);

        if (!$reflection->isInstantiable()) {
            throw new \Exception("Class {$class} is not instantiable");
        }

        $constructor = $reflection->getConstructor();

        if (is_null($constructor)) {
            return new $class;
        }

        $dependencies = [];

        foreach ($constructor->getParameters() as $param) {
            $type = $param->getType();

            if (!$type) {
                throw new \Exception("Cannot resolve parameter {$param->getName()}");
            }

            $dependencies[] = $this->make($type->getName());
        }

        return $reflection->newInstanceArgs($dependencies);
    }
}