<?php


namespace Bootstrap\App;


use Bootstrap\App\Contract\ViewContract;
use Smarty\Smarty;

class View implements ViewContract
{
    protected $smarty;

    public function __construct(array $config)
    {
        extract($config);
        $this->smarty = new Smarty();
        $this->smarty->setTemplateDir($templateDir);
        $this->smarty->setCompileDir($compileDir);
        $this->smarty->setConfigDir($configDir);
        $this->smarty->setCacheDir($cacheDir);

        $this->smarty->registerPlugin('modifier', 'http_build_query', 'http_build_query');

    }

    public function render(string $template, ?array $value = null) :void
    {
        if($value) {
            $this->setVariables($value);
        }
        $this->smarty->display($template);
    }

    public function setVariables(array|string $name, mixed $value = null)
    {
        $this->smarty->assign($name, $value);
        return $this;
    }

    public function fetch(string $template) :string
    {
        return $this->smarty->fetch($template);
    }

    public function cache(string $template, string $idCache, callable $callable, $time = 600)
    {
        $this->smarty->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $this->smarty->setCacheLifetime($time);
        if(!$this->smarty->isCached($template, $idCache)) {
            $callable($this);
        }
        $this->smarty->display($template, $idCache);
    }
}