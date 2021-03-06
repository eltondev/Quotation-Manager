<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

 

class Mdl_Payment_Methods extends Response_Model
{
    public $table = 'ip_payment_methods';
    public $primary_key = 'ip_payment_methods.payment_method_id';

    public function default_select()
    {
        $this->db->select('SQL_CALC_FOUND_ROWS *', FALSE);
    }

    public function order_by()
    {
        $this->db->order_by('ip_payment_methods.payment_method_name');
    }

    public function validation_rules()
    {
        return array(
            'payment_method_name' => array(
                'field' => 'payment_method_name',
                'label' => lang('payment_method'),
                'rules' => 'required'
            )
        );
    }

}
