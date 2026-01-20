<?php


namespace App\Controllers\Traits;


trait PaginateTrait
{
    protected $limit = 6;

    public function getPaginate($count, $view)
    {
        $get = $_GET;
        $page = (int) ($get['page'] ?? 0);
        $page = $page - 1 < 0 ? 0 : $page - 1;
        unset($get['page']);

        $pageTemplate = $view->setVariables(['paginate' => [
            'page' => $page,
            'pages' => ceil($count / $this->limit),
            'get' => $get
        ]])
            ->fetch('block/paginate.tpl');
        $view->setVariables('paginateTemplate', $pageTemplate);

        return [$page * $this->limit, $this->limit];
    }
}