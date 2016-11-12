<?php
/**
* One click checkout module
* @author qooaen@gmail.com
* @version 1.2
*/

require_once(DIR_SYSTEM.'library/ecc12.php');

class ControllerModuleOccm extends ECController12 {

	private $error = array();

	protected $_config = array(
		'occm_image_size_x' => array(
			'defaultValue' => 200,
			'normalize' => 'intval',
			),
		'occm_image_size_y' => array(
			'defaultValue' => 200,
			'normalize' => 'intval',
			),
		);

	public function index() {

		$this->language->load('module/occm');
		$this->document->setTitle($this->l('heading_title'));
		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			foreach ($this->_config as $key => $value) {
				if (empty($this->request->post[$key]) ||
					!($this->request->post[$key] = $this->_config[$key]['normalize']($this->request->post[$key]))
					) {
					$this->request->post[$key] = $this->_config[$key]['defaultValue'];
				}
			}
			$this->model_setting_setting->editSetting('occm',$this->request->post);

			$this->session->data['success'] = $this->l('text_success');
			$this->redirect($this->url->link('extension/module','token='.$this->session->data['token'],'SSL'));
		}
		$this->data['heading_title']       = $this->l('heading_title');
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs']   = array();
		$this->data['breadcrumbs'][] = array('text' => $this->l('text_home'),'href' => $this->url->link('common/home','token='.$this->session->data['token'],'SSL'),'separator' => false);
		$this->data['breadcrumbs'][] = array('text' => $this->l('text_module'),'href' => $this->url->link('extension/module','token='.$this->session->data['token'],'SSL'),'separator' => ' :: ');
		$this->data['breadcrumbs'][] = array('text' => $this->l('heading_title'),'href' => $this->url->link('module/occm','token='.$this->session->data['token'],'SSL'),'separator' => ' :: ');

		foreach (array('occm_status','occm_name_field','occm_phone_field','occm_mail_field', 'occm_comment_field', 'occm_order_status_id', 'occm_image_size_x', 'occm_image_size_y') as $value) {
			if (isset($this->request->post[$value])) {
				$this->data[$value] = $this->request->post[$value];
			} else {
				$this->data[$value] = $this->c($value);
			}
		}

		$this->template = 'module/occm.tpl';
		$this->children = array('common/header','common/footer');
		if (defined('VERSION') && '2.' == substr(VERSION, 0, 2)) {
			$this->children[] = 'common/column_left';
			$this->template = 'module/occm.tpl';
		} else {
			$this->template = 'module/occm1.tpl';
		}

		$this->response->setOutput($this->render());
	}

	protected function validate() {

		if (!$this->user->hasPermission('modify','module/occm')) {
			$this->error['warning'] = $this->l('error_permission');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>