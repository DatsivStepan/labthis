<?php 

class ControllerDQuickcheckoutConfirm extends Controller {

	public function index($config){

        $this->load->model('d_quickcheckout/method');
        $this->load->model('module/d_quickcheckout');
        $this->model_module_d_quickcheckout->logWrite('Controller:: confirm/index');

        if(!$config['general']['compress']){
            $this->document->addScript('catalog/view/javascript/d_quickcheckout/model/confirm.js');
            $this->document->addScript('catalog/view/javascript/d_quickcheckout/view/confirm.js');
        }
        
        $data['button_confirm'] = $this->language->get('button_confirm');
        $data['button_continue'] = $this->language->get('button_continue');

        $data['col'] = $config['account']['guest']['confirm']['column'];
        $data['row'] = $config['account']['guest']['confirm']['row'];
		
        $json['account'] = $this->session->data['account'];
        $json['confirm'] = $this->session->data['confirm'];

        $this->load->model('d_quickcheckout/order');
        $json['show_confirm'] = $this->model_d_quickcheckout_order->showConfirm();
        $json['payment_popup'] =  $this->model_d_quickcheckout_method->getPaymentPopup($this->session->data['payment_method']['code']);
        
        
        $data['json'] = json_encode($json);
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/d_quickcheckout/confirm.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/d_quickcheckout/confirm.tpl', $data);
		} else {
			return $this->load->view('default/template/d_quickcheckout/confirm.tpl', $data);
		}
	}

	public function updateField(){
        $json['confirm'] = $this->session->data['confirm'] = array_merge($this->session->data['confirm'], $this->request->post['confirm']);
        $this->session->data['comment'] = $this->session->data['confirm']['comment'];

        //statistic
        $this->load->model('module/d_quickcheckout');
        $statistic = array(
            'update' => array(
                'confirm' => 1
            )
        );
        $this->model_module_d_quickcheckout->updateStatistic($statistic);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function recreateOrder(){
        $this->load->model('d_quickcheckout/order');
        $this->model_d_quickcheckout_order->recreateOrder();
        return true;
    }

    public function update(){
        $json = array();
        $this->load->model('account/address');
        $this->load->model('module/d_quickcheckout');
        $this->load->model('d_quickcheckout/address');
        $this->load->model('d_quickcheckout/order');

        if($this->customer->isLogged()){

            if (empty($this->session->data['payment_address']['address_id'])) {
                $json['addresses'] = $this->model_d_quickcheckout_address->getAddresses();
                $json['payment_address']['address_id'] = $this->customer->getAddressId();
                $json['shipping_address']['address_id'] = $this->customer->getAddressId();
            }

            if($this->session->data['payment_address']['address_id'] == 'new'){
                $json['payment_address']['address_id'] = $this->session->data['payment_address']['address_id'] = $this->model_account_address->addAddress($this->session->data['payment_address']);
            }
            if($this->model_d_quickcheckout_address->showShippingAddress()){
                if($this->session->data['shipping_address']['address_id'] == 'new'){
                    $json['shipping_address']['address_id'] = $this->session->data['shipping_address']['address_id'] = $this->model_account_address->addAddress($this->session->data['shipping_address']);
                }
            }
            
        }else{
            if($this->session->data['account'] == 'register'){

                $this->load->model('account/customer');
                $this->model_account_customer->addCustomer($this->session->data['payment_address']);

                if($this->customer->login($this->session->data['payment_address']['email'], $this->session->data['payment_address']['password'])){
                    $json['account'] = $this->session->data['account'] = 'logged';

                    $json['addresses'] = $this->model_d_quickcheckout_address->getAddresses();
                    if (empty($this->session->data['payment_address']['address_id'])) {
                        $json['payment_address']['address_id'] = $this->customer->getAddressId();
                        $json['shipping_address']['address_id'] = $this->customer->getAddressId();
                    }
                }

                //2.1.0.1 fix
                $this->model_d_quickcheckout_order->updateCartForNewCustomerId();
            }
        }
        $this->load->model('d_quickcheckout/method');
        if($this->model_d_quickcheckout_method->getPaymentPopup($this->session->data['payment_method']['code'])){
            $json['cofirm_order'] = true;
            $json = $this->load->controller('d_quickcheckout/payment/prepare', $json);
        }

        $json['order_id'] = $this->session->data['order_id'] = $this->updateOrder();

        //statistic
        $statistic = array(
            'click' => array(
                'confirm' => 1
            )
        );
        $this->model_module_d_quickcheckout->updateStatistic($statistic);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function updateOrder(){

        $order_data = array();

        $this->load->model('d_quickcheckout/order');
        $this->model_d_quickcheckout_order->getTotals($order_data['totals'], $total, $taxes);


        $this->load->language('checkout/checkout');

        $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $order_data['store_id'] = $this->config->get('config_store_id');
        $order_data['store_name'] = $this->config->get('config_name');

        if ($order_data['store_id']) {
            $order_data['store_url'] = $this->config->get('config_url');
        } else {
            $order_data['store_url'] = HTTP_SERVER;
        }

        if ($this->customer->isLogged()) {
            $this->load->model('account/customer');

            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

            $order_data['customer_id'] = $this->customer->getId();
            $order_data['customer_group_id'] = $customer_info['customer_group_id'];
            $order_data['firstname'] = $customer_info['firstname'];
            $order_data['lastname'] = $customer_info['lastname'];
            $order_data['email'] = $customer_info['email'];
            $order_data['telephone'] = $customer_info['telephone'];
            $order_data['fax'] = $customer_info['fax'];
            $order_data['custom_field'] = unserialize($customer_info['custom_field']);
        } elseif (isset($this->session->data['guest'])) {
            $order_data['customer_id'] = 0;
            $order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
            $order_data['firstname'] = $this->session->data['guest']['firstname'];
            $order_data['lastname'] = $this->session->data['guest']['lastname'];
            $order_data['email'] = $this->session->data['guest']['email'];
            $order_data['telephone'] = $this->session->data['guest']['telephone'];
            $order_data['fax'] = $this->session->data['guest']['fax'];
            $order_data['custom_field'] = (isset($this->session->data['guest']['custom_field']['account'])) ? $this->session->data['guest']['custom_field']['account'] : array();
        }

        $order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
        $order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
        $order_data['payment_company'] = $this->session->data['payment_address']['company'];
        $order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
        $order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
        $order_data['payment_city'] = $this->session->data['payment_address']['city'];
        $order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
        $order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
        $order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
        $order_data['payment_country'] = $this->session->data['payment_address']['country'];
        $order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
        $order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
        $order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']['address']) ? $this->session->data['payment_address']['custom_field']['address'] : array());

        if (isset($this->session->data['payment_method']['title'])) {
            $order_data['payment_method'] = $this->session->data['payment_method']['title'];
        } else {
            $order_data['payment_method'] = '';
        }

        if (isset($this->session->data['payment_method']['code'])) {
            $order_data['payment_code'] = $this->session->data['payment_method']['code'];
        } else {
            $order_data['payment_code'] = '';
        }

        if ($this->cart->hasShipping()) {
            $order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
            $order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
            $order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
            $order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
            $order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
            $order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
            $order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
            $order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
            $order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
            $order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
            $order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
            $order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
            $order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']['address']) ? $this->session->data['shipping_address']['custom_field']['address'] : array());

            if (isset($this->session->data['shipping_method']['title'])) {
                $order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
            } else {
                $order_data['shipping_method'] = '';
            }

            if (isset($this->session->data['shipping_method']['code'])) {
                $order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
            } else {
                $order_data['shipping_code'] = '';
            }
        } else {
            $order_data['shipping_firstname'] = '';
            $order_data['shipping_lastname'] = '';
            $order_data['shipping_company'] = '';
            $order_data['shipping_address_1'] = '';
            $order_data['shipping_address_2'] = '';
            $order_data['shipping_city'] = '';
            $order_data['shipping_postcode'] = '';
            $order_data['shipping_zone'] = '';
            $order_data['shipping_zone_id'] = '';
            $order_data['shipping_country'] = '';
            $order_data['shipping_country_id'] = '';
            $order_data['shipping_address_format'] = '';
            $order_data['shipping_custom_field'] = array();
            $order_data['shipping_method'] = '';
            $order_data['shipping_code'] = '';
        }

        $order_data['products'] = array();

        foreach ($this->cart->getProducts() as $product) {
            $option_data = array();

            foreach ($product['option'] as $option) {
                $option_data[] = array(
                    'product_option_id'       => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'option_id'               => $option['option_id'],
                    'option_value_id'         => $option['option_value_id'],
                    'name'                    => $option['name'],
                    'value'                   => $option['value'],
                    'type'                    => $option['type']
                );
            }

            $order_data['products'][] = array(
                'product_id' => $product['product_id'],
                'name'       => $product['name'],
                'model'      => $product['model'],
                'option'     => $option_data,
                'download'   => $product['download'],
                'quantity'   => $product['quantity'],
                'subtract'   => $product['subtract'],
                'price'      => $product['price'],
                'total'      => $product['total'],
                'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                'reward'     => $product['reward']
            );
        }

        // Gift Voucher
        $order_data['vouchers'] = array();

        if (!empty($this->session->data['vouchers'])) {
            foreach ($this->session->data['vouchers'] as $voucher) {
                $order_data['vouchers'][] = array(
                    'description'      => $voucher['description'],
                    'code'             => substr(md5(mt_rand()), 0, 10),
                    'to_name'          => $voucher['to_name'],
                    'to_email'         => $voucher['to_email'],
                    'from_name'        => $voucher['from_name'],
                    'from_email'       => $voucher['from_email'],
                    'voucher_theme_id' => $voucher['voucher_theme_id'],
                    'message'          => $voucher['message'],
                    'amount'           => $voucher['amount']
                );
            }
        }



        $order_data['comment'] = $this->session->data['comment'];
        $order_data['total'] = $total;

        if (isset($this->request->cookie['tracking'])) {
            $order_data['tracking'] = $this->request->cookie['tracking'];

            $subtotal = $this->cart->getSubTotal();

            // Affiliate
            $this->load->model('affiliate/affiliate');

            $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

            if ($affiliate_info) {
                $order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
                $order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
            } else {
                $order_data['affiliate_id'] = 0;
                $order_data['commission'] = 0;
            }

            // Marketing
            $this->load->model('checkout/marketing');

            $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

            if ($marketing_info) {
                $order_data['marketing_id'] = $marketing_info['marketing_id'];
            } else {
                $order_data['marketing_id'] = 0;
            }
        } else {
            $order_data['affiliate_id'] = 0;
            $order_data['commission'] = 0;
            $order_data['marketing_id'] = 0;
            $order_data['tracking'] = '';
        }

        $order_data['language_id'] = $this->config->get('config_language_id');
        $order_data['currency_id'] = $this->currency->getId();
        $order_data['currency_code'] = $this->currency->getCode();
        $order_data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $order_data['ip'] = $this->request->server['REMOTE_ADDR'];

        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
            $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
            $order_data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
            $order_data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
            $order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
            $order_data['accept_language'] = '';
        }
        $this->load->model('d_quickcheckout/order');
        $this->model_module_d_quickcheckout->logWrite('Controller:: confirm/updateOrder for order ='.$this->session->data['order_id'].' with $order_data =' .json_encode($order_data));
        return $this->model_d_quickcheckout_order->updateOrder($this->session->data['order_id'], $order_data);
    }
    
    public function updateOrderAll(){
        
        $order_data = array();

        $this->load->model('d_quickcheckout/order');
        $this->model_d_quickcheckout_order->getTotals($order_data['totals'], $total, $taxes);


        $this->load->language('checkout/checkout');

        $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $order_data['store_id'] = $this->config->get('config_store_id');
        $order_data['store_name'] = $this->config->get('config_name');

        if ($order_data['store_id']) {
            $order_data['store_url'] = $this->config->get('config_url');
        } else {
            $order_data['store_url'] = HTTP_SERVER;
        }

        if ($this->customer->isLogged()) {
            $this->load->model('account/customer');

            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

            $order_data['customer_id'] = $this->customer->getId();
            $order_data['customer_group_id'] = $customer_info['customer_group_id'];
            $order_data['firstname'] = $customer_info['firstname'];
            $order_data['lastname'] = $customer_info['lastname'];
            $order_data['email'] = $customer_info['email'];
            $order_data['telephone'] = $customer_info['telephone'];
            $order_data['fax'] = $customer_info['fax'];
            $order_data['custom_field'] = unserialize($customer_info['custom_field']);
        } elseif (isset($this->session->data['guest'])) {
            $order_data['customer_id'] = 0;
            $order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
            $order_data['firstname'] = $this->session->data['guest']['firstname'];
            $order_data['lastname'] = $this->session->data['guest']['lastname'];
            $order_data['email'] = $this->session->data['guest']['email'];
            $order_data['telephone'] = $this->session->data['guest']['telephone'];
            $order_data['fax'] = $this->session->data['guest']['fax'];
            $order_data['custom_field'] = (isset($this->session->data['guest']['custom_field']['account'])) ? $this->session->data['guest']['custom_field']['account'] : array();
        }

        $order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
        $order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
        $order_data['payment_company'] = $this->session->data['payment_address']['company'];
        $order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
        $order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
        $order_data['payment_city'] = $this->session->data['payment_address']['city'];
        $order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
        $order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
        $order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
        $order_data['payment_country'] = $this->session->data['payment_address']['country'];
        $order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
        $order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
        $order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']['address']) ? $this->session->data['payment_address']['custom_field']['address'] : array());

        if (isset($this->session->data['payment_method']['title'])) {
            $order_data['payment_method'] = $this->session->data['payment_method']['title'];
        } else {
            $order_data['payment_method'] = '';
        }

        if (isset($this->session->data['payment_method']['code'])) {
            $order_data['payment_code'] = $this->session->data['payment_method']['code'];
        } else {
            $order_data['payment_code'] = '';
        }

        if ($this->cart->hasShipping()) {
            $order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
            $order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
            $order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
            $order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
            $order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
            $order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
            $order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
            $order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
            $order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
            $order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
            $order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
            $order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
            $order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']['address']) ? $this->session->data['shipping_address']['custom_field']['address'] : array());

            if (isset($this->session->data['shipping_method']['title'])) {
                $order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
            } else {
                $order_data['shipping_method'] = '';
            }

            if (isset($this->session->data['shipping_method']['code'])) {
                $order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
            } else {
                $order_data['shipping_code'] = '';
            }
        } else {
            $order_data['shipping_firstname'] = '';
            $order_data['shipping_lastname'] = '';
            $order_data['shipping_company'] = '';
            $order_data['shipping_address_1'] = '';
            $order_data['shipping_address_2'] = '';
            $order_data['shipping_city'] = '';
            $order_data['shipping_postcode'] = '';
            $order_data['shipping_zone'] = '';
            $order_data['shipping_zone_id'] = '';
            $order_data['shipping_country'] = '';
            $order_data['shipping_country_id'] = '';
            $order_data['shipping_address_format'] = '';
            $order_data['shipping_custom_field'] = array();
            $order_data['shipping_method'] = '';
            $order_data['shipping_code'] = '';
        }
        if($this->request->post['contactname']){
         $order_data['shipping_contactname'] = $this->request->post['contactname'];
         $order_data['shipping_zakx2'] = $this->request->post['zakx2'];
         $order_data['shipping_email'] = $this->request->post['email'];
         $order_data['shipping_phone'] = $this->request->post['phone'];
         $order_data['shipping_phone2'] = $this->request->post['phone2'];
         $order_data['shipping_com'] = $this->request->post['com'];
         $order_data['shipping_rekviz'] = $this->request->post['rekviz'];
         $order_data['shipping_rekvizup'] = $this->request->post['rekvizup'];
         $order_data['shipping_sposdost'] = $this->request->post['sposdost'];
         $order_data['shipping_gorod'] = $this->request->post['gorod'];
         $order_data['shipping_ylica'] = $this->request->post['ylica'];
         $order_data['shipping_dom'] = $this->request->post['dom'];
         $order_data['shipping_kvar'] = $this->request->post['kvar'];
}
        $order_data['products'] = array();

        foreach ($this->cart->getProducts() as $product) {
            $option_data = array();

            foreach ($product['option'] as $option) {
                $option_data[] = array(
                    'product_option_id'       => $option['product_option_id'],
                    'product_option_value_id' => $option['product_option_value_id'],
                    'option_id'               => $option['option_id'],
                    'option_value_id'         => $option['option_value_id'],
                    'name'                    => $option['name'],
                    'value'                   => $option['value'],
                    'type'                    => $option['type']
                );
            }

            $order_data['products'][] = array(
                'product_id' => $product['product_id'],
                'name'       => $product['name'],
                'model'      => $product['model'],
                'option'     => $option_data,
                'download'   => $product['download'],
                'quantity'   => $product['quantity'],
                'subtract'   => $product['subtract'],
                'price'      => $product['price'],
                'total'      => $product['total'],
                'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                'reward'     => $product['reward']
            );
        }

        // Gift Voucher
        $order_data['vouchers'] = array();

        if (!empty($this->session->data['vouchers'])) {
            foreach ($this->session->data['vouchers'] as $voucher) {
                $order_data['vouchers'][] = array(
                    'description'      => $voucher['description'],
                    'code'             => substr(md5(mt_rand()), 0, 10),
                    'to_name'          => $voucher['to_name'],
                    'to_email'         => $voucher['to_email'],
                    'from_name'        => $voucher['from_name'],
                    'from_email'       => $voucher['from_email'],
                    'voucher_theme_id' => $voucher['voucher_theme_id'],
                    'message'          => $voucher['message'],
                    'amount'           => $voucher['amount']
                );
            }
        }



        $order_data['comment'] = $this->session->data['comment'];
        
        if (array_key_exists("totalall", $this->session->data)) {
        $order_data['total'] = $this->session->data['totalall'];}else{
        $order_data['total'] = $total;
        }

        if (isset($this->request->cookie['tracking'])) {
            $order_data['tracking'] = $this->request->cookie['tracking'];

            $subtotal = $this->cart->getSubTotal();

            // Affiliate
            $this->load->model('affiliate/affiliate');

            $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

            if ($affiliate_info) {
                $order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
                $order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
            } else {
                $order_data['affiliate_id'] = 0;
                $order_data['commission'] = 0;
            }

            // Marketing
            $this->load->model('checkout/marketing');

            $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

            if ($marketing_info) {
                $order_data['marketing_id'] = $marketing_info['marketing_id'];
            } else {
                $order_data['marketing_id'] = 0;
            }
        } else {
            $order_data['affiliate_id'] = 0;
            $order_data['commission'] = 0;
            $order_data['marketing_id'] = 0;
            $order_data['tracking'] = '';
        }

        $order_data['language_id'] = $this->config->get('config_language_id');
        $order_data['currency_id'] = $this->currency->getId();
        $order_data['currency_code'] = $this->currency->getCode();
        $order_data['currency_value'] = $this->currency->getValue($this->currency->getCode());
        $order_data['ip'] = $this->request->server['REMOTE_ADDR'];

        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
            $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
            $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
            $order_data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
            $order_data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
            $order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
            $order_data['accept_language'] = '';
        }
        
       $this->load->model('d_quickcheckout/order');
       /*$this->model_module_d_quickcheckout->logWrite('Controller:: confirm/updateOrder for order ='.$this->session->data['order_id'].' with $order_data =' .json_encode($order_data));*/
       $status = $this->model_d_quickcheckout_order->updateOrder($this->session->data['order_id'], $order_data);
        $order_status_id= $status;
        if($status){
            $status = true;
        }else{
            $status = false;
        }
       
        /* mail send */

        		$language = new Language('russian');
				$language->load('default');
				$language->load('mail/order');

				$subject = sprintf($language->get('text_update_subject'), html_entity_decode($order_data['store_name'], ENT_QUOTES, 'UTF-8'), $this->session->data['order_id']);

				$message  = $language->get('text_update_order') . ' ' . $this->session->data['order_id'] . "\n";
				$message .= $language->get('text_update_date_added') . ' ' . date($language->get('date_format_short'), strtotime(date("d . F . Y "))) . "\n\n";

				$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_data['language_id'] . "'");

				if ($order_status_query->num_rows) {
					$message .= $language->get('text_update_order_status') . "\n\n";
					$message .= $order_status_query->row['name'] . "\n\n";
				}

				if ($order_data['customer_id']) {
					$message .= $language->get('text_update_link') . "\n";
					$message .= $order_data['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id . "\n\n";
				}
        
                $message .= " <table border='1'><caption>Товари</caption><tr><th>Название</th><th>Категория</th><th>Количество</th>   <th>Цена</th><th>Общая стоимость</th></tr>";  
                foreach ($order_data['products'] as $productss) {
                 $message .= "<tr><td>".$productss['name']."</td><td>".$productss['model']."</td><td>".$productss['quantity']."</td>   <td>".$productss['price']."</td><td>".$productss['total']."</td></tr>";
                 }
                $message .=   "</table>";
                $message .= "Товаров на: ".$order_data['totals']['0']['text']." \n\n";
                $message .= "Контактное лицо: ".$this->request->post['contactname']." \n\n";
                $message .= "E-mail: ".$this->request->post['email']." \n\n";
                $message .= "Телефон: ".$this->request->post['phone']." \n\n";
                if ($this->request->post['phone2']) {
                            $message .= "Доп. телефон: ".$this->request->post['phone2']." \n\n";
                        } 
                if ($this->request->post['sposdost']) {
                    $message .= "Способ доставки: ".$this->request->post['sposdost']." \n\n";
                } 
                if ($this->request->post['gorod']) {
                    $message .= "Город: ".$this->request->post['gorod']." \n\n";
                } 
                if ($this->request->post['ylica']) {
                    $message .= "Улица: ".$this->request->post['ylica']." \n\n";
                } if ($this->request->post['dom']) {
                    $message .= "Дом: ".$this->request->post['dom']." \n\n";
                } if ($this->request->post['kvar']) {
                    $message .= "Квартира: ".$this->request->post['kvar']." \n\n";
                }
                if ($this->request->post['com']) {
					$message .= $language->get('text_update_comment') . "\n\n";
					$message .= strip_tags($this->request->post['com']) . "\n\n";
				}
				$message .= $language->get('text_update_footer');

				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($order_data['store_name']);
				$mail->setSubject($subject);
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();

        	// Admin Alert Mail
				
        	$language = new Language('russian');
				$language->load('default');
				$language->load('mail/order');

				$subject = sprintf($language->get('text_update_subject'), html_entity_decode($order_data['store_name'], ENT_QUOTES, 'UTF-8'), $this->session->data['order_id']);

				$message  = $language->get('text_update_order') . ' ' . $this->session->data['order_id'] . "\n";
				$message .= $language->get('text_update_date_added') . ' ' . date($language->get('date_format_short'), strtotime(date("d . F . Y "))) . "\n\n";

				$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_data['language_id'] . "'");

				if ($order_status_query->num_rows) {
					$message .= $language->get('text_update_order_status') . "\n\n";
					$message .= $order_status_query->row['name'] . "\n\n";
				}

				if ($order_data['customer_id']) {
					$message .= $language->get('text_update_link') . "\n";
					$message .= $order_data['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id . "\n\n";
				}
        
                $message .= " <table border='1'><caption>Товари</caption><tr><th>Название</th><th>Категория</th><th>Количество</th>   <th>Цена</th><th>Общая стоимость</th></tr>";  
                foreach ($order_data['products'] as $productss) {
                 $message .= "<tr><td>".$productss['name']."</td><td>".$productss['model']."</td><td>".$productss['quantity']."</td>   <td>".$productss['price']."</td><td>".$productss['total']."</td></tr>";
                 }
                $message .=   "</table>";
                $message .= "Товаров на: ".$order_data['totals']['0']['text']." \n\n";
                $message .= "Контактное лицо: ".$this->request->post['contactname']." \n\n";
                $message .= "E-mail: ".$this->request->post['email']." \n\n";
                $message .= "Телефон: ".$this->request->post['phone']." \n\n";
                if ($this->request->post['phone2']) {
                            $message .= "Доп. телефон: ".$this->request->post['phone2']." \n\n";
                        } 
                if ($this->request->post['sposdost']) {
                    $message .= "Способ доставки: ".$this->request->post['sposdost']." \n\n";
                } 
                if ($this->request->post['gorod']) {
                    $message .= "Город: ".$this->request->post['gorod']." \n\n";
                } 
                if ($this->request->post['ylica']) {
                    $message .= "Улица: ".$this->request->post['ylica']." \n\n";
                } if ($this->request->post['dom']) {
                    $message .= "Дом: ".$this->request->post['dom']." \n\n";
                } if ($this->request->post['kvar']) {
                    $message .= "Квартира: ".$this->request->post['kvar']." \n\n";
                }
                if ($this->request->post['com']) {
					$message .= $language->get('text_update_comment') . "\n\n";
					$message .= strip_tags($this->request->post['com']) . "\n\n";
				}
				

				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->config->get('config_email'));
				$mail->setSender($order_data['store_name']);
				$mail->setSubject($subject);
				$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
				$mail->send();
       
			
        
        
        
        
        
        
        /* end mail */
        
        
        
        
        
        
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($status));     
     
       

       
    }
    
    public function xtooprice(){
        if($this->request->post['status']=='1'){
            $this->session->data['totalall']=$this->request->post['summ'];
            $this->session->data['totalsx2']=1;
        }
        elseif($this->request->post['status']=='0'){
            $this->session->data['totalall']=$this->session->data['totals']['2']['value'];
            $this->session->data['totalsx2']=0;
        }
      
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($this->session->data['totalall']));    
    }
    
    public function deleteprod(){ 
    
     if($this->request->post['id']){
          $this->load->model('module/d_quickcheckout');
        $statistic = array(
            'update' => array(
                'confirm' => 1
            )
        );
        $this->model_module_d_quickcheckout->updateStatistic($statistic);
          $this->load->model('d_quickcheckout/order');
             $status = $this->model_d_quickcheckout_order->deletetProd($this->session->data['order_id'], $this->request->post['id']);
        if($status){
            echo '1';
        }else{
             echo $status;
        }
        }
        else{
             echo '00';
        }
    
    }
}