<?php
/*
  $Id: orders.php,v 1.25 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('HEADING_TITLE', 'Zam�wienia');
define('HEADING_TITLE_SEARCH', 'ID Zam�wienia:');
define('HEADING_TITLE_STATUS', 'Status:');

define('TABLE_HEADING_COMMENTS', 'Komentarze');
define('TABLE_HEADING_CUSTOMERS', 'Klient');
define('TABLE_HEADING_ORDER_TOTAL', 'Warto�� Zam�wienia');
define('TABLE_HEADING_DATE_PURCHASED', 'Data Zakupu');
define('TABLE_HEADING_STATUS', 'Status');
define('TABLE_HEADING_ACTION', 'Dzia�anie');
define('TABLE_HEADING_QUANTITY', 'Ilo��');
define('TABLE_HEADING_PRODUCTS_MODEL', 'Model');
define('TABLE_HEADING_PRODUCTS', 'Produkt');
define('TABLE_HEADING_TAX', 'Podatek');
define('TABLE_HEADING_TOTAL', 'Suma');
define('TABLE_HEADING_PRICE_EXCLUDING_TAX', 'Cena (netto)');
define('TABLE_HEADING_PRICE_INCLUDING_TAX', 'Cena (brutto)');
define('TABLE_HEADING_TOTAL_EXCLUDING_TAX', 'Warto�� (netto)');
define('TABLE_HEADING_TOTAL_INCLUDING_TAX', 'Warto�� (brutto)');

define('TABLE_HEADING_CUSTOMER_NOTIFIED', 'Klient Poinformowany');
define('TABLE_HEADING_ACCOUNT', 'Konto');
define('TABLE_HEADING_DATE_ADDED', 'Data Dodania');

define('ENTRY_CUSTOMER', 'Klient:');
define('ENTRY_SOLD_TO', 'P�ATNIK:');
define('ENTRY_DELIVERY_TO', 'Dostarczy� Do:');
define('ENTRY_SHIP_TO', 'ODBIORCA:');
define('ENTRY_SHIPPING_ADDRESS', 'Adres Dostawy:');
define('ENTRY_BILLING_ADDRESS', 'Adres P�atnika:');
define('ENTRY_PAYMENT_METHOD', 'Spos�b Zap�aty:');
define('ENTRY_CREDIT_CARD_TYPE', 'Rodzaj Karty Kredytowej:');
define('ENTRY_CREDIT_CARD_OWNER', 'W�a�ciciel Karty:');
define('ENTRY_CREDIT_CARD_NUMBER', 'Numer Karty:');
define('ENTRY_CREDIT_CARD_EXPIRES', 'Data Wa�no�ci Karty:');
define('ENTRY_SUB_TOTAL', 'Podsuma:');
define('ENTRY_TAX', 'Podatek:');
define('ENTRY_SHIPPING', 'Wysy�ka:');
define('ENTRY_TOTAL', 'Suma:');
define('ENTRY_DATE_PURCHASED', 'Data Zakupu:');
define('ENTRY_STATUS', 'Status:');
define('ENTRY_DATE_LAST_UPDATED', 'Data Ostatniej Zmiany:');
define('ENTRY_NOTIFY_CUSTOMER', 'Poinformuj Klienta:');
define('ENTRY_NOTIFY_COMMENTS', 'Do��cz Komentarze:');
define('ENTRY_PRINTABLE', 'Wydrukuj Faktur�');

define('TEXT_INFO_HEADING_DELETE_ORDER', 'Usu� Zam�wienie');
define('TEXT_INFO_DELETE_INTRO', 'Czy jeste� pewien �e chcesz usun�� to zam�wienie?');
define('TEXT_INFO_RESTOCK_PRODUCT_QUANTITY', 'Uzupe�nij zapas dla tego produktu');
define('TEXT_DATE_ORDER_CREATED', 'Date Utworzenia:');
define('TEXT_DATE_ORDER_LAST_MODIFIED', 'Ostatnia Zmiana:');
define('TEXT_INFO_PAYMENT_METHOD', 'Spos�b Zap�aty:');

define('TEXT_ALL_ORDERS', 'Wszystkie Zam�wienia');
define('TEXT_NO_ORDER_HISTORY', 'Historia Zam�wienia Niedost�pna');

define('EMAIL_SEPARATOR', '------------------------------------------------------');
define('EMAIL_TEXT_SUBJECT', 'Aktualizacja Zam�wienia');
define('EMAIL_TEXT_ORDER_NUMBER', 'Nr Zam�wienia:');
define('EMAIL_TEXT_INVOICE_URL', 'Szczeg�owa Faktura:');
define('EMAIL_TEXT_DATE_ORDERED', 'Data Zam�wienia:');
define('EMAIL_TEXT_STATUS_UPDATE', 'Zosta� zmieniony status twojego zam�wienia.' . "\n\n" . 'Nowy status: %s' . "\n\n" . 'Je�eli masz jakiekolwiek pytania odpowiedz na ten email.' . "\n");
define('EMAIL_TEXT_COMMENTS_UPDATE', 'Komentarze do twojego zam�wienia: ' . "\n\n%s\n\n");

define('ERROR_ORDER_DOES_NOT_EXIST', 'B��d: Zam�wienie nie istnieje.');
define('SUCCESS_ORDER_UPDATED', 'Powiod�o si�: Zam�wienie zosta�o zaktualizowane.');
define('WARNING_ORDER_NOT_UPDATED', 'Uwaga: Nie ma czego zmienia�. Zam�wienie nie zosta�o zaktualizowane.');

?>
