<?php


namespace Bootstrap\App\Contract;


interface DataBaseContract
{
    public function query(string $query, ?array $data = null);
}