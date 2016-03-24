<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

 

function pdf_create($html, $filename, $stream = TRUE)
{
    require_once(APPPATH . 'helpers/mpdf/mpdf.php');

    $mpdf = new mPDF();

    $mpdf->SetAutoFont();

    if (strpos($filename, lang('invoice')) !== false) {
        $CI = &get_instance();
        $mpdf->setAutoBottomMargin = 'stretch';
        $mpdf->SetHTMLFooter('<div id="footer">' . $CI->mdl_settings->settings['pdf_invoice_footer'] . '</div>');
    }

    $mpdf->WriteHTML($html);

    if ($stream) {
        return $mpdf->Output($filename . '.pdf', 'I');
    } else {
        $mpdf->Output('./uploads/temp/' . $filename . '.pdf', 'F');
        return './uploads/temp/' . $filename . '.pdf';
    }
}
