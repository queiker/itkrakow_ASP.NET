<?php
/*
  $Id: account_edit_process.php,v 1.2 2002/11/28 23:39:44 wilt Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CREATE_ORDER_PROCESS);
 // if ($HTTP_POST_VARS['action'] != 'process') {
  //  tep_redirect(tep_href_link(FILENAME_CREATE_ORDER, '', 'SSL'));
  //}
  $customer_id = tep_db_prepare_input($HTTP_POST_VARS['customers_id']);
  $gender = tep_db_prepare_input($HTTP_POST_VARS['gender']);
  $firstname = tep_db_prepare_input($HTTP_POST_VARS['firstname']);
  $lastname = tep_db_prepare_input($HTTP_POST_VARS['lastname']);
  $dob = tep_db_prepare_input($HTTP_POST_VARS['dob']);
  $email_address = tep_db_prepare_input($HTTP_POST_VARS['email_address']);
  $telephone = tep_db_prepare_input($HTTP_POST_VARS['telephone']);
  $fax = tep_db_prepare_input($HTTP_POST_VARS['fax']);
  $cell = tep_db_prepare_input($HTTP_POST_VARS['cell']);
  $newsletter = tep_db_prepare_input($HTTP_POST_VARS['newsletter']);
  $password = tep_db_prepare_input($HTTP_POST_VARS['password']);
  $confirmation = tep_db_prepare_input($HTTP_POST_VARS['confirmation']);
  $street_address = tep_db_prepare_input($HTTP_POST_VARS['street_address']);
  $street_address_dom = tep_db_prepare_input($HTTP_POST_VARS['street_address_dom']);
  $street_address_mieszkanie = tep_db_prepare_input($HTTP_POST_VARS['street_address_mieszkanie']);
  $company = tep_db_prepare_input($HTTP_POST_VARS['company']);
  $nip = tep_db_prepare_input($HTTP_POST_VARS['nip']);
  $suburb = tep_db_prepare_input($HTTP_POST_VARS['suburb']);
  $postcode = tep_db_prepare_input($HTTP_POST_VARS['postcode']);
  $city = tep_db_prepare_input($HTTP_POST_VARS['city']);
  $zone_id = tep_db_prepare_input($HTTP_POST_VARS['zone_id']);
  $state = tep_db_prepare_input($HTTP_POST_VARS['state']);
  $country = tep_db_prepare_input(tep_get_country_name($HTTP_POST_VARS['country']));

  $format_id = "1";
  $size = "1";
  $payment_method = DEFAULT_PAYMENT_METHOD;
  $new_value = "1";
  $error = false; // reset error flag
  $temp_amount = "0";
  $temp_amount = number_format($temp_amount, 2, '.', '');
  
  $currency_text = DEFAULT_CURRENCY . ", 1";
  if(IsSet($HTTP_POST_VARS['Currency']))
  {
  	$currency_text = tep_db_prepare_input($HTTP_POST_VARS['Currency']);
  }
  
  $currency_array = explode(",", $currency_text);
  
  $currency = $currency_array[0];
  $currency_value = $currency_array[1];

  $customer_service_id = tep_db_prepare_input($HTTP_POST_VARS['cust_service']);
?>
<?php
    $sql_data_array = array('customers_id' => $customer_id,
							'customers_name' => $firstname . ' ' . $lastname,
							'customers_company' => $company,
							'customers_nip' => $nip,
							'customers_street_address' => $street_address,
							'customers_street_address_dom' => $street_address_dom,
							'customers_street_address_mieszkanie' => $street_address_mieszkanie,
							'customers_suburb' => $suburb,
							'customers_city' => $city,
							'customers_postcode' => $postcode,
							'customers_state' => $state,
							'customers_country' => $country,
							'customers_telephone' => $telephone,
                            'customers_email_address' => $email_address,
							'customers_address_format_id' => $format_id,
							'delivery_name' => $firstname . ' ' . $lastname,
							'delivery_company' => $company,
							'delivery_nip' => $nip,
                            'delivery_street_address' => $street_address,
                            'delivery_street_address_dom' => $street_address_dom,
                            'delivery_street_address_mieszkanie' => $street_address_mieszkanie,
							'delivery_suburb' => $suburb,
							'delivery_city' => $city,
							'delivery_postcode' => $postcode,
							'delivery_state' => $state,
							'delivery_country' => $country,
							'delivery_address_format_id' => $format_id,
							'billing_name' => $firstname . ' ' . $lastname,
							'billing_company' => $company,
							'billing_nip' => $nip,
							'billing_street_address' => $street_address,
							'billing_street_address_dom' => $street_address_dom,
							'billing_street_address_mieszkanie' => $street_address_mieszkanie,
							'billing_suburb' => $suburb,
							'billing_city' => $city,
							'billing_postcode' => $postcode,
							'billing_state' => $state,
							'billing_country' => $country,
							'billing_address_format_id' => $format_id,
							'date_purchased' => 'now()', 
							'orders_status' => DEFAULT_ORDERS_STATUS_ID,
							'currency' => $currency,
							'currency_value' => $currency_value,

							'customer_service_id' => $customer_service_id,
							'payment_method' => $payment_method
							); 


							
      
 
  //old
  tep_db_perform(TABLE_ORDERS, $sql_data_array);
  $insert_id = tep_db_insert_id();
 
 
    $sql_data_array = array('orders_id' => $insert_id,
							'orders_status_id' => $new_value,
                            'date_added' => 'now()');
     tep_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);
  
  
    $sql_data_array = array('orders_id' => $insert_id,
                            'title' => TEXT_SUBTOTAL,
                            'text' => $temp_amount,
                            'value' => "0.00", 
                            'class' => "ot_subtotal", 
                            'sort_order' => "1");
    tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);


   $sql_data_array = array('orders_id' => $insert_id,
                            'title' => TEXT_DISCOUNT,
                            'text' => $temp_amount,
                            'value' => "0.00",
                            'class' => "ot_customer_discount",
                            'sort_order' => "2");
   tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
  
    $sql_data_array = array('orders_id' => $insert_id,
                            'title' => TEXT_DELIVERY,
                            'text' => $temp_amount,
                            'value' => "0.00", 
                            'class' => "ot_shipping", 
                            'sort_order' => "3");
    tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
	
    $sql_data_array = array('orders_id' => $insert_id,
                            'title' => TEXT_TAX,
                            'text' => $temp_amount,
                            'value' => "0.00", 
                            'class' => "ot_tax", 
                            'sort_order' => "4");
    tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
  
      $sql_data_array = array('orders_id' => $insert_id,
                            'title' => TEXT_TOTAL,
                            'text' => $temp_amount,
                            'value' => "0.00", 
                            'class' => "ot_total", 
                            'sort_order' => "5");
    tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
  

   tep_redirect(tep_href_link(FILENAME_ORDERS_EDIT, 'oID=' . $insert_id, 'SSL'));


  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>