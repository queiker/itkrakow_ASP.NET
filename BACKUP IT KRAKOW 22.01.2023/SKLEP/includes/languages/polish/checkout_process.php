<?php
/*
  $Id: checkout_process.php,v 1.26 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('EMAIL_TEXT_SUBJECT', 'Przyj�to Zam�wienie');
define('EMAIL_TEXT_ORDER_NUMBER', 'Zam�wienie Nr:');
define('EMAIL_TEXT_INVOICE_URL', 'Szczeg�owa Faktura:');
define('EMAIL_TEXT_DATE_ORDERED', 'Data Zam�wienia:');
define('EMAIL_TEXT_PRODUCTS', 'Produkty');
define('EMAIL_TEXT_SUBTOTAL', 'Podsuma:');
define('EMAIL_TEXT_TAX', 'Podatek:        ');
define('EMAIL_TEXT_SHIPPING', 'Dostawa: ');
define('EMAIL_TEXT_TOTAL', 'Suma:    ');
define('EMAIL_TEXT_DELIVERY_ADDRESS', 'Adres Dostawy');
define('EMAIL_TEXT_BILLING_ADDRESS', 'Adres P�atnika');
define('EMAIL_TEXT_PAYMENT_METHOD', 'Spos�b Zap�aty');

define('EMAIL_SEPARATOR', '------------------------------------------------------');
define('TEXT_EMAIL_VIA', 'via');

define('MBANK_EMAIL_INFO', 'Je�eli nie dokonali Pa�stwo jeszcze p�atno�ci dla tego zam�wienia mo�na to zrobi� wchodz�c przez podany ni�ej adres.');
define('DOOR2DOOR_EMAIL_INFO', 'Prosimy o odbi�r towaru od pn-pt, w siedzibie firmy w godz. od 10:00 do 16:00' . "\n" . 'Przy odbiorze prosimy podac numer zamowienia: ');
define('CONFIRM_YOUR_ORDER', 'W�a�nie dokona�e� zakupu, zapraszamy do kasy mBanku');
define('COMMENTS_EMAIL_INFO', 'Podsumowanie ');
define('NAME_EMAIL_INFO', 'Imi� Nazwisko: ');
define('FIRM_EMAIL_INFO', 'Firma: ');
define('NIP_ORDER_EMAIL_INFO', 'NIP dla zam�wienia: ');
define('NIP_MAIN_EMAIL_INFO', 'NIP g��wny: ');
define('EMAIL_EMAIL_INFO', 'Adres e-mail: ');
define('PHONE_EMAIL_INFO', 'Telefon: ');
define('FAX_GSM_EMAIL_INFO', 'Fax|GSM: ');

?>
