<?php
/*
  $Id: categories.php,v 1.26 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('HEADING_TITLE', 'Kategorie / Produkty');
define('HEADING_TITLE_SEARCH', 'Szukaj:');
define('HEADING_TITLE_GOTO', 'Skocz Do:');

define('TABLE_HEADING_ID', 'ID');
define('TABLE_HEADING_CATEGORIES_PRODUCTS', 'Kategoria / Produkt');
define('TABLE_HEADING_ACTION', 'Dzia�anie');
define('TABLE_HEADING_STATUS', 'Status');

define('TEXT_NEW_PRODUCT', 'Nowy Produkt w Kategorii &quot;%s&quot;');
define('TEXT_CATEGORIES', 'Kategorie:');
define('TEXT_SUBCATEGORIES', 'Podkategorie:');
define('TEXT_PRODUCTS', 'Produkty:');
define('TEXT_PRODUCTS_PRICE_INFO', 'Cena:');
define('TEXT_PRODUCTS_TAX_CLASS', 'Klasa Podatku:');
define('TEXT_PRODUCTS_AVERAGE_RATING', '�rednia Ocena:');
define('TEXT_PRODUCTS_QUANTITY_INFO', 'Ilo��:');
define('TEXT_DATE_ADDED', 'Data Dodania:');
define('TEXT_DATE_AVAILABLE', 'Dost�pny Od Dnia:');
define('TEXT_LAST_MODIFIED', 'Ostatnia Zmiana:');
define('TEXT_IMAGE_NONEXISTENT', 'OBRAZEK NIE ISTNIEJE');
define('TEXT_NO_CHILD_CATEGORIES_OR_PRODUCTS', 'Dodaj now� kategori� lub produkt w tej kategorii.');
define('TEXT_PRODUCT_MORE_INFORMATION', 'Wi�cej informacji o tym produkcie znajdziesz na jego <a href="http://%s" target="blank"><u>stronie internetowej</u></a>.');
define('TEXT_PRODUCT_DATE_ADDED', 'Data dodania produktu do sklepu %s.');
define('TEXT_PRODUCT_DATE_AVAILABLE', 'Ten produkt b�dzie dost�pny od dnia: %s.');

define('TEXT_EDIT_INTRO', 'Wprowad� niezb�dne zmiany');
define('TEXT_EDIT_CATEGORIES_ID', 'ID Kategorii:');
define('TEXT_EDIT_CATEGORIES_NAME', 'Nazwa Kategorii:');
define('TEXT_EDIT_CATEGORIES_IMAGE', 'Obrazek Kategorii:');
define('TEXT_EDIT_SORT_ORDER', 'Porz�dek Sortowania:');

define('TEXT_INFO_COPY_TO_INTRO', 'Wybierz now� kategori� do kt�rej chcia�by� skopiowa� ten produkt');
define('TEXT_INFO_CURRENT_CATEGORIES', 'Obecna Kategoria:');

define('TEXT_INFO_HEADING_NEW_CATEGORY', 'Nowa Kategoria');
define('TEXT_INFO_HEADING_EDIT_CATEGORY', 'Edytuj Kategori�');
define('TEXT_INFO_HEADING_DELETE_CATEGORY', 'Usu� Kategori�');
define('TEXT_INFO_HEADING_MOVE_CATEGORY', 'Przenie� Kategori�');
define('TEXT_INFO_HEADING_DELETE_PRODUCT', 'Usu� Produkt');
define('TEXT_INFO_HEADING_MOVE_PRODUCT', 'Przenie� Produkt');
define('TEXT_INFO_HEADING_COPY_TO', 'Skopiuj Do');

define('TEXT_DELETE_CATEGORY_INTRO', 'Czy na pewno chces usun�� t� kategori�?');
define('TEXT_DELETE_PRODUCT_INTRO', 'Czy na pewno chcesz ca�kowicie usun�� ten produkt?');

define('TEXT_DELETE_WARNING_CHILDS', '<b>UWAGA:</b> Istnieje %s (pod-)kategorii wci�� powi�zanych z t� kategori�!');
define('TEXT_DELETE_WARNING_PRODUCTS', '<b>UWAGA:</b> Istnieje %s produkt�w wci�� powi�zanych z t� kategori�!');

define('TEXT_MOVE_PRODUCTS_INTRO', 'Wybierz kategori� w kt�rej produkt <b>%s</b> ma si� znajdowa�');
define('TEXT_MOVE_CATEGORIES_INTRO', 'Wybierz kategori� w kt�rej kategoria <b>%s</b> ma si� znajdowa�');
define('TEXT_MOVE', 'Przenie� <b>%s</b> do:');

define('TEXT_NEW_CATEGORY_INTRO', 'Podaj nast�puj�ce informacje dla nowej kategorii');
define('TEXT_CATEGORIES_NAME', 'Nazwa Kategorii:');
define('TEXT_CATEGORIES_IMAGE', 'Obrazek Kategorii:');
define('TEXT_SORT_ORDER', 'Porz�dek Sortowania:');

define('TEXT_PRODUCTS_STATUS', 'Status Produktu:');
define('TEXT_PRODUCTS_DATE_AVAILABLE', 'Dost�pny Od Dnia:');
define('TEXT_PRODUCT_AVAILABLE', 'Na Sk�adzie');
define('TEXT_PRODUCT_NOT_AVAILABLE', 'Wyprzedany');
define('TEXT_PRODUCTS_MANUFACTURER', 'Producent:');
define('TEXT_PRODUCTS_NAME', 'Nazwa Produktu:');
define('TEXT_PRODUCTS_DESCRIPTION', 'Opis:');
define('TEXT_PRODUCTS_QUANTITY', 'Ilo��:');
define('TEXT_PRODUCTS_MODEL', 'Model:');
define('TEXT_PRODUCTS_IMAGE', 'Zdj�cie Produktu:');
define('TEXT_PRODUCTS_URL', 'URL:');
define('TEXT_PRODUCTS_URL_WITHOUT_HTTP', '<small>(bez http://)</small>');
define('TEXT_PRODUCTS_PRICE_NET', 'Cena produktu (Netto):');
define('TEXT_PRODUCTS_PRICE_GROSS', 'Cena Produktu (Brutto):');
define('TEXT_PRODUCTS_WEIGHT', 'Waga Produktu:');

define('EMPTY_CATEGORY', 'Pusta Kategoria');

define('TEXT_HOW_TO_COPY', 'Spos�b kopiowania:');
define('TEXT_COPY_AS_LINK', 'Powi��');
define('TEXT_COPY_AS_DUPLICATE', 'Duplikuj produkt');

define('ERROR_CANNOT_LINK_TO_SAME_CATEGORY', 'B��d: Nie mog� powi�za� produkt�w w tej samej kategorii.');
define('ERROR_CATALOG_IMAGE_DIRECTORY_NOT_WRITEABLE', 'B��d: W katalogu ze zdj�ciami/obrazkami nie mo�na zapisywa�: ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CATALOG_IMAGE_DIRECTORY_DOES_NOT_EXIST', 'B��d: Katalog na zdj�cia/obrazki nie istnieje: ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT', 'B��d: Kategoria nie mo�e by� przesuni�ta do podkategorii.');
define('ENTRY_PRODUCTS_PRICE', 'Cena Produktu #');
define('ENTRY_PRODUCTS_PRICE_DISABLED', 'Wy��czone');

define('TABLE_HEADING_MODEL','model');
define('TABLE_HEADING_PRICE','netto');
define('TABLE_HEADING_VAT','vat');
define('TABLE_HEADING_DISCOUNT','%');
define('TABLE_HEADING_QUANTITY','szt');
define('TABLE_HEADING_WEIGHT','kg');
define('TEXT_UPDATE_PRICES','Uaktualnij Ceny');
define('TEXT_EDIT_CATEGORIES_HEADING_TITLE','Nag��wek kategorii');
define('TEXT_EDIT_CATEGORIES_DESCRIPTION','Opis kategorii');
define('TEXT_PRODUCTS_AVAILABILITY', 'Dost�pno�� Towaru:');

define('TEXT_INFO_HEADING_NEW_IMAGES', 'Dodatkowe Obrazki');
define('TEXT_NEW_IMAGES_INTRO', 'Dodatkowe obrazki dla tego produktu. Je�li w popupie ma by� ten sam obrazek, jak dodawany zostaw puste.');
define('TEXT_DEL_IMAGES_INTRO', 'Usu� dodatkowy obrqazek dla tego produktu');
define('TEXT_PRODUCTS_IMAGES_NEW', 'Nowy Obrazek');
define('TEXT_PRODUCTS_IMAGES_NEWPOP', 'Du�y Obrazek');
define('TEXT_PRODUCTS_IMAGES_DESC', 'Opis obrazka');
define('ERROR_ADDITIONAL_IMAGE_IS_EMPTY', 'B��D: Pole dodatkowych obrazk�w jest puste');
define('ERROR_DEL_IMG_XTRA','B��D: Nie mo�na usun�� obrazka ');
define('SUCCESS_DEL_IMG_XTRA','Obrazek zosta� pomy�lnie usuni�ty: ');
//SECTION:    REAL MAIN POPUP IMAGE
define('TEXT_PRODUCTS_IMAGE_POP', 'Obrazek w PopUp:');
//SECTION:    DELETE POPUP IMAGE
define('ERROR_DEL_IMG_XTRA','ERROR: Can not delete image ');
define('SUCCESS_DEL_IMG_XTRA','The image was deleted correctly: ');
//TotalB2B start
define('ENTRY_PRODUCTS_PRICE', 'Cena Produktu #');
define('ENTRY_PRODUCTS_PRICE_DISABLED', 'wy��czone');
//TotalB2b end
?>