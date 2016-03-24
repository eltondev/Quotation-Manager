<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

 

/**
 * returns an array list of cldr => country, translated in the language $cldr.
 */
function get_country_list($cldr)
{
    return (include APPPATH . 'helpers/country-list/' . $cldr . '/country.php');
}