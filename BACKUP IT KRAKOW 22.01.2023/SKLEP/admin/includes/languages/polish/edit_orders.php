<?php
/*
  $Id: edit_orders.php,v 2.5 2006/04/28 10:42:44 ams Exp $
  polish
  
  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce
  
  T�umaczenie: Mariusz Gawdzi�ski
  http://www.gawdzinski.pl
  
  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Edytuj Zam�wienie');
define('HEADING_TITLE_NUMBER', 'Nr');
define('HEADING_TITLE_DATE', 'z');
define('HEADING_SUBTITLE', 'Wykonaj zmiany w zam�wieniu i naci�nij znajduj�cy si� poni�ej przycisk Aktualizuj.');
define('HEADING_TITLE_STATUS', 'Status');
define('ADDING_TITLE', 'Dodaj produkt do tego zam�wienia');

define('HINT_UPDATE_TO_CC', 'Ustaw metod� p�atno�ci na ');
//ENTRY_CREDIT_CARD should be whatever is saved in your db as the payment method
//when your customer pays by Credit Card
define('ENTRY_CREDIT_CARD', 'Karta Kredytowa');
define('HINT_UPDATE_TO_CC2', ' a automatycznie poka�� si� dodatkowe pola. Pola Karty Kredytowej sa ukryte je�eli inna metoda p�atno�ci jest wybrana.');
define('HINT_PRODUCTS_PRICES', 'Kalkulacja wagi i ceny wykonywana jest w locie, ale musisz wcisn�� przycisk aktualizuj w celu zapisania zmian.');
define('HINT_SHIPPING_ADDRESS', 'Je�eli adres dostawy zostanie zmieniony, zaktualizowana mo�e zosta� r�wnie� strefa podatkowa. Musisz w takim przypadku ponownie wcisn�c przycik aktualizuj w celu poprawnej aktualizacji stawek podatk�w.');
define('HINT_TOTALS', 'Mo�esz nadawa� rabaty wpisuj�c ujemne warto�ci. Ka�de pole z wpisan� warto�ci� r�wn� 0 jest kasowane przy aktualizacji (wyj�tkiem jest dostawa).  Waga, podsuma, podatek, i warto�ci ko�cowe nie s� edytowalne. Po aktualizacji mo�liwe niewielkie r�nice w warto�ciach, wynikaj�ce gl�wnie z zaokr�glania.');
define('HINT_PRESS_UPDATE', 'Przycisk "Aktualizuj" zachowa wykonane zmiany.');
define('HINT_BASE_PRICE', 'Cena (bazowa) to cena produktu przed dodaniem cech (np. cena katalogowa produktu)');
define('HINT_PRICE_EXCL', 'Cena (netto) to Cena z uwzgl�dnieniem przypisaneych do danego towaru cech');
define('HINT_PRICE_INCL', 'Cena (brutto) to Cena (netto) razy podatek');
define('HINT_TOTAL_EXCL', 'Warto�� (netto) to Cena (netto) razy ilo��');
define('HINT_TOTAL_INCL', 'Warto�� (brutto) to Cena (netto) razy podatek i ilo��');

define('TABLE_HEADING_COMMENTS', 'Komentarz');
define('TABLE_HEADING_STATUS', 'Nowy Status');
define('TABLE_HEADING_QUANTITY', 'Ilo��');
define('TABLE_HEADING_PRODUCTS_MODEL', 'Model');
define('TABLE_HEADING_PRODUCTS_WEIGHT', 'Waga');
define('TABLE_HEADING_PRODUCTS', 'Produkt');
define('TABLE_HEADING_TAX', 'Podatek %');
define('TABLE_HEADING_BASE_PRICE', 'Cena (base)');
define('TABLE_HEADING_UNIT_PRICE', 'Cena (netto)');
define('TABLE_HEADING_UNIT_PRICE_TAXED', 'Cena (brutto)');
define('TABLE_HEADING_TOTAL_PRICE', 'Warto�� (netto)');
define('TABLE_HEADING_TOTAL_PRICE_TAXED', 'Warto�� (brutto)');
define('TABLE_HEADING_TOTAL_MODULE', 'Ca�kowity Koszt');
define('TABLE_HEADING_TOTAL_AMOUNT', 'Koszt');
define('TABLE_HEADING_TOTAL_WEIGHT', 'Sumaryczna Waga: ');
define('TABLE_HEADING_DELETE', 'Usun��?');
define('TABLE_HEADING_SHIPPING_TAX', 'Shipping tax: ');

define('TABLE_HEADING_CUSTOMER_NOTIFIED', 'Stan Powiadomienia');
define('TABLE_HEADING_DATE_ADDED', 'Data Powiadomienia');

define('ENTRY_CUSTOMER_NAME', 'Imi� i Nazwisko');
define('ENTRY_CUSTOMER_COMPANY', 'Firma');
define('ENTRY_CUSTOMER_ADDRESS', 'Adres Klienta');
define('ENTRY_CUSTOMER_SUBURB', 'Suburb');
define('ENTRY_CUSTOMER_CITY', 'Miasto');
define('ENTRY_CUSTOMER_STATE', 'Wojew�dztwo');
define('ENTRY_CUSTOMER_POSTCODE', 'Kod Pocztowy');
define('ENTRY_CUSTOMER_COUNTRY', 'Kraj');
define('ENTRY_CUSTOMER_PHONE', 'Telefon');
define('ENTRY_CUSTOMER_EMAIL', 'E-Mail');
define('ENTRY_ADDRESS', 'Adres');

define('ENTRY_SHIPPING_ADDRESS', 'Adres Dostawy');
define('ENTRY_BILLING_ADDRESS', 'Adres P�atnika');
define('ENTRY_PAYMENT_METHOD', 'Metoda P�atno�ci:');
define('ENTRY_CREDIT_CARD_TYPE', 'Typ Karty:');
define('ENTRY_CREDIT_CARD_OWNER', 'W�a�ciciel Karty:');
define('ENTRY_CREDIT_CARD_NUMBER', 'Numer Karty:');
define('ENTRY_CREDIT_CARD_EXPIRES', 'Data Wa�no�ci:');
define('ENTRY_SUB_TOTAL', 'Podsuma:');

//do not put a colon (" : ") in the definition of ENTRY_TAX
//ie entry should be 'Tax' NOT 'Tax:'
define('ENTRY_TAX', 'Podatek');

define('ENTRY_TOTAL', 'Razem:');
define('ENTRY_STATUS', 'Status Zam�wienia:');
define('ENTRY_NOTIFY_CUSTOMER', 'Powiadomi� Klienta:');
define('ENTRY_NOTIFY_COMMENTS', 'Wys�a� Komentarz:');

define('TEXT_NO_ORDER_HISTORY', 'Brak Zam�wie�');

define('EMAIL_SEPARATOR', '------------------------------------------------------');
define('EMAIL_TEXT_SUBJECT', 'Zestawienie zam�wienia w sklepie '.STORE_NAME);
define('EMAIL_TEXT_ORDER_NUMBER', 'Numer Zam�wienia:');
define('EMAIL_TEXT_INVOICE_URL', 'Szczeg�y Zam�wienia pod adresem URL:');
define('EMAIL_TEXT_DATE_ORDERED', 'Data Zam�wienia:');
define('EMAIL_TEXT_STATUS_UPDATE', 'Dzi�kujemy bardzo za zakupy w naszym sklepie!' . "\n\n" . 'Status Twojego zam�wienia zosta� zaktualizowany' . "\n\n" . 'Nowy status: %s' . "\n\n");
define('EMAIL_TEXT_STATUS_UPDATE2', 'W razie jakichkolwiek pyta�, w�tpliwo�ci prosimy o kontakt z nami. Mo�esz to zrobi� odpowiadaj�c na ten e-mail lub dzwoni�c bezpo�rednio do naszego sklepu.' . "\n\n" . 'Pozdrawiamy i Zapraszamy Ponownie<br> ' . STORE_NAME . "\n");
define('EMAIL_TEXT_COMMENTS_UPDATE', 'Poni�ej znajduje si� komentarz do z�o�onego zam�wienia:' . "\n\n%s\n\n");

define('ERROR_ORDER_DOES_NOT_EXIST', 'B��D: Brak zam�wienia');
define('SUCCESS_ORDER_UPDATED', 'Wykonano: zam�wienie zosta�o zaktualizowane.');

define('ADDPRODUCT_TEXT_CATEGORY_CONFIRM', 'OK');
define('ADDPRODUCT_TEXT_SELECT_PRODUCT', 'Wybierz produkt');
define('ADDPRODUCT_TEXT_PRODUCT_CONFIRM', 'OK');
define('ADDPRODUCT_TEXT_SELECT_OPTIONS', 'Wybierz cech�');
define('ADDPRODUCT_TEXT_OPTIONS_CONFIRM', 'OK');
define('ADDPRODUCT_TEXT_OPTIONS_NOTEXIST', 'Produkt nie posiada dodatkowych cech, pomijamy ...');
define('ADDPRODUCT_TEXT_CONFIRM_QUANTITY', 'sztuk tego produktu');
define('ADDPRODUCT_TEXT_CONFIRM_ADDNOW', 'Dodaj');
define('ADDPRODUCT_TEXT_STEP', 'Krok');
define('ADDPRODUCT_TEXT_STEP1', ' &laquo; Wybierz Katalog. ');
define('ADDPRODUCT_TEXT_STEP2', ' &laquo; Wybierz Produkt. ');
define('ADDPRODUCT_TEXT_STEP3', ' &laquo; Wybierz Cech�. ');

define('MENUE_TITLE_CUSTOMER', '1. Dane Klienta');
define('MENUE_TITLE_PAYMENT', '2. Metoda P�atno�ci');
define('MENUE_TITLE_ORDER', '3. Zam�wione Produkty');
define('MENUE_TITLE_TOTAL', '4. Zni�ki, Wysy�ka , Razem');
define('MENUE_TITLE_STATUS', '5. Status i Powiadomienia');
define('MENUE_TITLE_UPDATE', '6. Aktualizacja Danych');

define('ENTRY_NOTIFY', 'Powiadomienia:');
define('ENTRY_NOTIFY_CUSTOMER', 'Powiadom Klienta o zmianach statusu');
define('ENTRY_NOTIFY_CUSTOMER_HEADING', 'Zmiany statusu przesy�ane mailem');
define('ENTRY_NOTIFY_CUSTOMER_INFO', 'Klient otrzyma skr�con� informacj� zawieraj�c� informacje o: <br /> - numerze zam�wienia, kt�rego zmiany dotycz�<br /> - statusie po zmianie<br /> - link do zam�wienia, kt�re zosta�o zmienione');
define('ENTRY_NOTIFY_ZAMOWIENIE', 'Prze�lij Klientowi zestawienie zam�wienia');
define('ENTRY_NOTIFY_ZAMOWIENIE_HEADING', 'Zestawienie zam�wienia przesy�ane mailem');
define('ENTRY_NOTIFY_ZAMOWIENIE_INFO', 'Klient otrzyma pe�ne dane zam�wienia, informacje o p�atno�ci i formie dostawy.<br /> B�d� to dane zaktualizowane i zawiera�y b�d� m.in.:<br /> - informacje o produktach [cena, ilo��, nazwa]<br /> - informacje o formie i kosztach dostawy<br /> - informacje o wybranej formie p�atno�ci, w tym ew. dane do przelewu [zaznacz poni�ej]<br /> - adres dostawy');
define('ENTRY_NOTIFY_NOTHING', 'Nie wysy�aj do Klienta �adnych powiadomie�');
define('ENTRY_NOTIFY_COMMENTS', 'Dodaj komentarze');
define('ENTRY_NOTIFY_BANK', 'Do��cz dane do przelewu');
define('TEXT_EMAIL_BANKTRANSFER', 'Dane do przelewu');

define('ENTRY_NAME', 'Imi� i nazwisko:');
define('ENTRY_CITY_STATE', 'Miasto, wojew�dztwo:');
define('ENTRY_CURRENCY_TYPE', 'Waluta');
define('ENTRY_CURRENCY_VALUE', 'Kurs');
define('HINT_UPDATE_CURRENCY', 'Ustaw walut� zam�wienia na');
define('TABLE_HEADING_OT_TOTALS', 'Modu� podsumy zam�wienia');
define('TABLE_HEADING_OT_VALUES', 'Koszt');
define('TABLE_HEADING_SHIPPING_QUOTES', 'Spos�b wysy�ki');
define('TEXT_PACKAGE_WEIGHT_COUNT', '');
define('TABLE_HEADING_NEW_STATUS', 'Status zam�wienia');
define('ENTRY_CUSTOMER', 'Dane klienta');
define('AJAX_SUBMIT_COMMENT', 'Dodaj komentarz do zam�wienia');
define('AJAX_CONFIRM_COMMENT_DELETE', 'Usun�� komentarz?');
define('AJAX_MESSAGE_STACK_SUCCESS', 'Dane zosta�y poprawnie zaktualizowane.');
define('TEXT_STEP_1', 'Krok 1');
define('TEXT_PRODUCT_SEARCH', 'Wyszukaj produkt');
define('TEXT_CLOSE_POPUP', 'Zamknij okienko');
define('TEXT_SELECT_CATEGORY', 'Wybierz kategori�');
define('TEXT_STEP_2', 'Krok 2');
define('TEXT_SELECT_PRODUCT', 'Wybierz produkt');
define('TEXT_STEP_3', 'Krok 3');
define('TEXT_SKIP_NO_OPTIONS', 'Pomini�ty - brak opcji produktu');
define('TEXT_STEP_4', 'Krok 4');
define('TEXT_QUANTITY', 'Ilo�� zamawianego produktu');
define('TEXT_BUTTON_ADD_PRODUCT', 'Dodaj produkt');
define('TEXT_ALL_CATEGORIES', 'Wszystkie kategorie');
define('TEXT_BUTTON_SELECT_OPTIONS', 'Wybierz opcj�');
define('TEXT_NO_ORDER_PRODUCTS', 'Nie dodano �adnego produktu do zam�wienia!');

define('AJAX_NEW_ORDER_EMAIL', 'Czy wys�a� do Klienta powiadomienie z pe�nym zestawieniem zam�wionych towar�w/us�ug ?');
define('AJAX_SUCCESS_EMAIL_SENT', 'Powiadomienie wys�ane');

define('EMAIL_TEXT_DATE_MODIFIED', 'Data utworzenia');
define('EMAIL_TEXT_PRODUCTS', 'Zamawiane produkty');
define('EMAIL_TEXT_DELIVERY_ADDRESS', 'Adres dostawy');
define('EMAIL_TEXT_BILLING_ADDRESS', 'Adres p�atnika');
define('EMAIL_TEXT_PAYMENT_METHOD', 'Spos�b p�atno�ci');
define('EMAIL_TEXT_FOOTER', '');
define('IMAGE_ADD_NEW_OT', 'dodaj poni�ej nowy wpis sumy zam�wienia');
define('IMAGE_REMOVE_NEW_OT', 'usu� ten wpis sumy zam�wienia');

define('AJAX_LOADING', '�adowanie...');
define('ENTRY_SEND_NEW_ORDER_CONFIRMATION','Wys�a� pe�ne zestawienie:');
define('IMAGE_NEW_ORDER_EMAIL','Kliknij aby wys�a� pe�ne zestawienie do klienta');
?>