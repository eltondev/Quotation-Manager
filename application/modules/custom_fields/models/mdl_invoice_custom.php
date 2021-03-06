<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

 

class Mdl_Invoice_Custom extends MY_Model
{
    public $table = 'ip_invoice_custom';
    public $primary_key = 'ip_invoice_custom.invoice_custom_id';

    public function save_custom($invoice_id, $db_array)
    {
        $invoice_custom_id = NULL;

        $db_array['invoice_id'] = $invoice_id;

        $invoice_custom = $this->where('invoice_id', $invoice_id)->get();

        if ($invoice_custom->num_rows()) {
            $invoice_custom_id = $invoice_custom->row()->invoice_custom_id;
        }

        parent::save($invoice_custom_id, $db_array);
    }

}
