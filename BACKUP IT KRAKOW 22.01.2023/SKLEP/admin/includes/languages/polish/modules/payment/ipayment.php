<?php
/*
  $Id: ipayment.php,v 1.0 2003/03/25 10:30:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

  define('MODULE_PAYMENT_IPAYMENT_TEXT_TITLE', 'iPayment');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_DESCRIPTION', 'Dane Testowe Karty:<br><br>Nr: 4111111111111111<br>Data Wa�no�ci: Dowolna');
  define('IPAYMENT_ERROR_HEADING', 'Wyst�pi� b��d w trakcie przetwarzania danych twojej karty');
  define('IPAYMENT_ERROR_MESSAGE', 'Prosz� sprawdzi� szczeg�y swojej karty!');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_CREDIT_CARD_OWNER', 'W�a�ciciel Karty:');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_CREDIT_CARD_NUMBER', 'Numer Karty:');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_CREDIT_CARD_EXPIRES', 'Data Wa�no�ci Karty:');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_CREDIT_CARD_CHECKNUMBER', 'Numer Kontrolny Karty:');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_CREDIT_CARD_CHECKNUMBER_LOCATION', '(umiejscowiony z ty�u karty)');

  define('MODULE_PAYMENT_IPAYMENT_TEXT_JS_CC_OWNER', '* Imi� i Nazwisko w�a�ciciela karty musi mie� przynajmniej ' . CC_OWNER_MIN_LENGTH . ' zn.\n');
  define('MODULE_PAYMENT_IPAYMENT_TEXT_JS_CC_NUMBER', '* Numer karty musi mie� przynajmniej ' . CC_NUMBER_MIN_LENGTH . ' zn.\n');
?>
