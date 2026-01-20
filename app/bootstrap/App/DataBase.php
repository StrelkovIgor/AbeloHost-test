<?php


namespace Bootstrap\App;


use Bootstrap\App\Contract\DataBaseContract;

class DataBase implements DataBaseContract
{

    protected $connect;

    protected $lastQuery;

    protected $fetch = \PDO::FETCH_OBJ;

    protected $model = 0;

    public function __construct($config)
    {
        extract($config);
        $this->connect = new \PDO("{$base}:host={$host};dbname={$dbname}", $user, $password);
    }

    public function query(string $query, ?array $data = null)
    {
        $this->lastQuery = $this->connect->prepare($query);
        $this->lastQuery->execute($data);
        return $this;
    }

    public function first($fetch = null)
    {
        return $this->getTypeFetchModel()
            ? $this->lastQuery?->fetch()
            : $this->lastQuery?->fetch($fetch ?? $this->fetch);
    }

    public function get($fetch = null)
    {
        return $this->getTypeFetchModel()
            ? $this->lastQuery?->fetchAll()
            : $this->lastQuery?->fetchAll($fetch ?? $this->fetch);
    }

    private function getTypeFetchModel()
    {
        $model = $this->model;
        $this->model = 0;
        return $model;
    }

    public function model(string $class)
    {
        $this->model = 1;
        $this->lastQuery->setFetchMode(\PDO::FETCH_CLASS, $class, [$this]);
        return $this;
    }
}