<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class row_product_list extends Module
{
    public function __construct()
    {
        $this->name = 'row_product_list';
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

        $this->displayName = $this->l('Row product list');
        $this->description = $this->l('Display categories');

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
        $category = new Category(16);
        $products = $category->getProducts($this->context->language->id, 1, 3, 'name', 'ASC');

        // foreach ($products as $product) {
        //     print_r($product['name']);
        //     echo('-------------------');
        // }

        // product info
        $id_product = 2;
        $product = new Product((int)$id_product, false, $module->context->language->id);

        // $image = Product::getCover((int)$product->id);
        // $current_price = round(Product::getPriceStatic((int)$product->id), 2, PHP_ROUND_HALF_UP);

        $images = Product::getCover($id_product);
        $image_url = $this->context->link->getImageLink($product->link_rewrite, $images['id_image'], ImageType::getFormatedName('home'));

        $this->context->smarty->assign('image', $image_url);

        $this->context->smarty->assign('products', $products);

        return $this->display(__FILE__, 'row_product_list.tpl');
    }
}
