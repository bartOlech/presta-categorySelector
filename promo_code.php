<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class promo_code extends Module
{
    public function __construct()
    {
        $this->name = 'promo_code';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Bart ol';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.7',
            'max' => _PS_VERSION_
        ];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Promo code module');
        $this->description = $this->l('Display promotion block');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
    }

    public function install()
    {
        if (!parent::install()
            || !$this->registerHook('displayHome')
        ) {
            return false;
        }
        return true;
    } 
   
    public function uninstall()
    {
        return parent::uninstall();
    }
    public function hookDisplayHome($params)
    {
        return '<a href="https://prestapros.com/">PrestaPros.com</a>';
    }
}