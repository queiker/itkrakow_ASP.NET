<?php
/*
  $Id: english.php,v 1.106 2003/08/18 12:18:31 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/


// zobacz w katalogu $PATH_LOCALE/locale dost�pne lokalizacje..
// w RedHacie powinno by� 'pl_PL'
// we FreeBSD sprawd� 'pl_PL.ISO_8859-2'
// w Windows spr�buj 'pl', lub 'Polski'



setlocale(LC_TIME, 'pl_PL.ISO_8859-2');
define('DATE_FORMAT_SHORT', '%d %m %Y');  // u�ywane przy strftime()
define('DATE_FORMAT_LONG', '%A, %d %B %Y'); // u�ywane przy strftime()
define('DATE_FORMAT', 'd/m/Y'); // u�ywane przy date()
define('PHP_DATE_TIME_FORMAT', 'd/m/Y H:i:s'); // u�ywane przy date()
define('DATE_TIME_FORMAT', DATE_FORMAT_SHORT . ' %H:%M:%S');


////
// Zwraca sformatowan� dat� jako raw format
// $date powinna mie� format dd/mm/yyyy
// format raw date ma posta� YYYYMMDD, lub DDMMYYYY
function tep_date_raw($date, $reverse = false) {
  if ($reverse) {
    return substr($date, 0, 2) . substr($date, 3, 2) . substr($date, 6, 4);
  } else {
    return substr($date, 6, 4) . substr($date, 3, 2) . substr($date, 0, 2);
  }
}


// Global entries for the <html> tag
define('HTML_PARAMS','dir="ltr" lang="pl"');

// charset for web pages and emails
define('CHARSET', 'iso-8859-2');

// page title
define('TITLE', STORE_NAME);

// header text in includes/header.php
define('HEADER_TITLE_TOP', 'Administracja');
define('HEADER_TITLE_SUPPORT_SITE', 'Strona Wsparcia');
define('HEADER_TITLE_ONLINE_CATALOG', 'Sklep');
define('HEADER_TITLE_ADMINISTRATION', 'Administracja');

// text for gender
define('MALE', 'M�czyzna');
define('FEMALE', 'Kobieta');

// text for date of birth example
define('DOB_FORMAT_STRING', 'dd/mm/rrrr');

// configuration box text in includes/boxes/configuration.php
define('BOX_HEADING_CONFIGURATION', 'Konfiguracja');
define('BOX_CONFIGURATION_MYSTORE', 'M�j Sklep');
define('BOX_CONFIGURATION_LOGGING', 'Logowanie');
define('BOX_CONFIGURATION_CACHE', 'Cache');

// modules box text in includes/boxes/modules.php
define('BOX_HEADING_MODULES', 'Modu�y');
define('BOX_MODULES_PAYMENT', 'P�atno��');
define('BOX_MODULES_SHIPPING', 'Wysy�ka');
define('BOX_MODULES_ORDER_TOTAL', 'Suma Zam�wienia');

// categories box text in includes/boxes/catalog.php
define('BOX_HEADING_CATALOG', 'Sklep');
define('BOX_CATALOG_CATEGORIES_PRODUCTS', 'Kategorie/Produkty');
define('BOX_CATALOG_CATEGORIES_PRODUCTS_ATTRIBUTES', 'Cechy Produkt�w');
define('BOX_CATALOG_MANUFACTURERS', 'Producenci');
define('BOX_CATALOG_REVIEWS', 'Recenzje');
define('BOX_CATALOG_SPECIALS', 'Promocje');
define('BOX_CATALOG_PRODUCTS_EXPECTED', 'Produkty Oczekiwane');
define('BOX_CATALOG_QUICK_UPDATES', 'Szybka aktualizacja');

// customers box text in includes/boxes/customers.php
define('BOX_HEADING_CUSTOMERS', 'Klienci');
define('BOX_CUSTOMERS_CUSTOMERS', 'Klienci');
define('BOX_CUSTOMERS_ADVANCED', 'Klienci - zarz�dzanie');
define('BOX_CUSTOMERS_ORDERS', 'Zam�wienia');

// taxes box text in includes/boxes/taxes.php
define('BOX_HEADING_LOCATION_AND_TAXES', 'Miejscowo�ci / Podatki');
define('BOX_TAXES_COUNTRIES', 'Kraje');
define('BOX_TAXES_ZONES', 'Strefy');
define('BOX_TAXES_GEO_ZONES', 'Strefy Podatkowe');
define('BOX_TAXES_TAX_CLASSES', 'Klasy Podatk�w');
define('BOX_TAXES_TAX_RATES', 'Stawki Podatk�w');

// reports box text in includes/boxes/reports.php
define('BOX_HEADING_REPORTS', 'Raporty');
define('BOX_REPORTS_PRODUCTS_VIEWED', 'Najcz�ciej Wy�wietlane');
define('BOX_REPORTS_PRODUCTS_PURCHASED', 'Najcz�ciej Kupowane');
define('BOX_REPORTS_ORDERS_TOTAL', 'Najlepsi Klienci');

// tools text in includes/boxes/tools.php
define('BOX_HEADING_TOOLS', 'Narz�dzia');
define('BOX_TOOLS_BACKUP', 'Archiwizacja Bazy Danych');
define('BOX_TOOLS_BANNER_MANAGER', 'Zadz�dzanie Banerami');
define('BOX_TOOLS_CACHE', 'Kontrola Cache');
define('BOX_TOOLS_DEFINE_LANGUAGE', 'Definiowanie J�zyk�w');
define('BOX_TOOLS_FILE_MANAGER', 'Eksplorator Plik�w');
define('BOX_TOOLS_MAIL', 'Mailing');
define('BOX_TOOLS_NEWSLETTER_MANAGER', 'Zadz�dzanie Newsletterem');
define('BOX_TOOLS_SERVER_INFO', 'Informacje o Serwerze');
define('BOX_TOOLS_WHOS_ONLINE', 'Kto Jest w Sklepie');

// localizaion box text in includes/boxes/localization.php
define('BOX_HEADING_LOCALIZATION', 'Lokalizacja');
define('BOX_LOCALIZATION_CURRENCIES', 'Waluty');
define('BOX_LOCALIZATION_LANGUAGES', 'J�zyki');
define('BOX_LOCALIZATION_ORDERS_STATUS', 'Statusy Zam�wienia');

// javascript messages
define('JS_ERROR', 'Podczas przetwarzania formularza wyst�pi�y b��dy!\nProsz� poprawi� nast�puj�ce dane:\n\n');

define('JS_OPTIONS_VALUE_PRICE', '* Nowa cecha produktu musi mie� warto��\n');
define('JS_OPTIONS_VALUE_PRICE_PREFIX', '* Cena dla nowej cechy produktu musi mie� prefiks\n');

define('JS_PRODUCTS_NAME', '* Nowy produkt musi mie� podan� nazw�\n');
define('JS_PRODUCTS_DESCRIPTION', '* Nowy produkt musi miec podany opis\n');
define('JS_PRODUCTS_PRICE', '* Nowy produkt musi mie� podan� cen�\n');
define('JS_PRODUCTS_WEIGHT', '* Nowy produkt musi mie� podan� wag�\n');
define('JS_PRODUCTS_QUANTITY', '* Nowy produkt musi mie� podan� ilo�� sztuk\n');
define('JS_PRODUCTS_MODEL', '* Nowy produkt musi mie� podany model\n');
define('JS_PRODUCTS_IMAGE', '* Nowy produkt musi mie� obrazek\n');

define('JS_SPECIALS_PRODUCTS_PRICE', '* Dla tego produktu musi by� ustalona nowa cena\n');

define('JS_GENDER', '* Musisz wybra� p�e�.\n');
define('JS_FIRST_NAME', '* Imi� musi mie� przynajmniej ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' znak�w.\n');
define('JS_LAST_NAME', '* Nazwisko musi mie� przynajmniej ' . ENTRY_LAST_NAME_MIN_LENGTH . ' znak�w.\n');
define('JS_DOB', '* Data urodzenia  musi mie� format: xx/xx/xxxx (dzie�/miesi�c/rok).\n');
define('JS_EMAIL_ADDRESS', '* Adres email  musi mie� przynajmniej ' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' znak�w.\n');
define('JS_ADDRESS', '* Ulica  musi mie� przynajmniej ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' znak�w.\n');
define('JS_POST_CODE', '* Kod pocztowy  musi mie� ' . ENTRY_POSTCODE_MIN_LENGTH . ' znak�w.\n');
define('JS_CITY', '* Miasto  musi mie� przynajmniej ' . ENTRY_CITY_MIN_LENGTH . ' znak�w.\n');
define('JS_STATE', '* Musisz wybra� wojew�dztwo.\n');
define('JS_STATE_SELECT', '-- Wybierz --');
define('JS_ZONE', '* Dla tego kraju musisz wybra� \'Wojew�dztwo\' z rozwijanej listy.');
define('JS_COUNTRY', '* Musisz wybra� \'Kraj\'.\n');
define('JS_TELEPHONE', '* Nr telefonu  musi mie� przynajmniej ' . ENTRY_TELEPHONE_MIN_LENGTH . ' znak�w.\n');
define('JS_PASSWORD', '* Has�o i Potwierdzenie Has�a musi by� identyczne i musi mie� przynajmniej ' . ENTRY_PASSWORD_MIN_LENGTH . ' znak�w.\n');

define('JS_ORDER_DOES_NOT_EXIST', 'Zam�wienie nr %s nie istnieje!');

define('CATEGORY_COMPANY', 'Dane Firmy');
define('CATEGORY_PERSONAL', 'Dane Osobowe');
define('CATEGORY_ADDRESS', 'Dane Teleadresowe');
define('CATEGORY_CONTACT', 'Dane Kontaktowe');
define('CATEGORY_OPTIONS', 'Opcje');

define('ENTRY_GENDER', 'P�e�:');
define('ENTRY_GENDER_ERROR', '&nbsp;<span class="errorText">wymagane</span>');
define('ENTRY_FIRST_NAME', 'Imi�:');
define('ENTRY_FIRST_NAME_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' zn.</span>');
define('ENTRY_LAST_NAME', 'Nazwisko:');
define('ENTRY_LAST_NAME_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_LAST_NAME_MIN_LENGTH . ' zn.</span>');
define('ENTRY_DATE_OF_BIRTH', 'Data Urodzenia:');
define('ENTRY_DATE_OF_BIRTH_ERROR', '&nbsp;<span class="errorText">(np. 21/05/1970)</span>');
define('ENTRY_EMAIL_ADDRESS', 'Adres E-Mail:');
define('ENTRY_EMAIL_ADDRESS_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' zn.</span>');
define('ENTRY_EMAIL_ADDRESS_CHECK_ERROR', '&nbsp;<span class="errorText">Ten adres email nie jest poprawny!</span>');
define('ENTRY_EMAIL_ADDRESS_ERROR_EXISTS', '&nbsp;<span class="errorText">Taki adres email ju� istnieje w naszej bazie!</span>');
define('ENTRY_COMPANY', 'Nazwa Firmy:');
define('ENTRY_COMPANY_ERROR', '');
define('ENTRY_NIP', 'Numer NIP:');
define('ENTRY_NIP_ERROR', '');
define('ENTRY_STREET_ADDRESS', 'Ulica:');
define('ENTRY_STREET_ADDRESS_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' zn.</span>');
define('ENTRY_SUBURB', 'Dzielnica:');
define('ENTRY_SUBURB_ERROR', '');
define('ENTRY_POST_CODE', 'Kod Pocztowy:');
define('ENTRY_POST_CODE_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_POSTCODE_MIN_LENGTH . ' zn.</span>');
define('ENTRY_CITY', 'Miasto:');
define('ENTRY_CITY_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_CITY_MIN_LENGTH . ' zn.</span>');
define('ENTRY_STATE', 'Wojew�dztwo:');
define('ENTRY_STATE_ERROR', '&nbsp;<span class="errorText">wymagane</span>');
define('ENTRY_COUNTRY', 'Kraj:');
define('ENTRY_COUNTRY_ERROR', '');
define('ENTRY_TELEPHONE_NUMBER', 'Nr Telefonu:');
define('ENTRY_TELEPHONE_NUMBER_ERROR', '&nbsp;<span class="errorText">min ' . ENTRY_TELEPHONE_MIN_LENGTH . ' zn.</span>');
define('ENTRY_FAX_NUMBER', 'Nr Faksu:');
define('ENTRY_FAX_NUMBER_ERROR', '');
define('ENTRY_NEWSLETTER', 'Newsletter:');
define('ENTRY_NEWSLETTER_YES', 'Zapisany');
define('ENTRY_NEWSLETTER_NO', 'Wypisany');
define('ENTRY_NEWSLETTER_ERROR', '');

// images
define('IMAGE_ANI_SEND_EMAIL', 'Wys�anie Emaila');
define('IMAGE_BACK', 'Wr��');
define('IMAGE_BACKUP', 'Archiwizacja');
define('IMAGE_CANCEL', 'Anuluj');
define('IMAGE_CONFIRM', 'Zatwierd�');
define('IMAGE_COPY', 'Kopiuj');
define('IMAGE_COPY_TO', 'Kopiuj Do');
define('IMAGE_DEFINE', 'Definiuj');
define('IMAGE_DELETE', 'Usu�');
define('IMAGE_EDIT', 'Edytuj');
define('IMAGE_EMAIL', 'Email');
define('IMAGE_FILE_MANAGER', 'Eksplorator Plik�w');
define('IMAGE_ICON_STATUS_GREEN', 'W��czone');
define('IMAGE_ICON_STATUS_GREEN_LIGHT', 'W��cz');
define('IMAGE_ICON_STATUS_RED', 'Wy��czone');
define('IMAGE_ICON_STATUS_RED_LIGHT', 'Wy��cz');
define('IMAGE_ICON_INFO', 'Informacje');
define('IMAGE_INSERT', 'Wstaw');
define('IMAGE_LOCK', 'Zablokuj');
define('IMAGE_MODULE_INSTALL', 'Zainstaluj Modu�');
define('IMAGE_MODULE_REMOVE', 'Odinstaluj Modu�');
define('IMAGE_MOVE', 'Przenie�');
define('IMAGE_NEW_BANNER', 'Nowy Baner');
define('IMAGE_NEW_CATEGORY', 'Nowa Kategoria');
define('IMAGE_NEW_COUNTRY', 'Nowy Kraj');
define('IMAGE_NEW_CURRENCY', 'Nowa Waluta');
define('IMAGE_NEW_FILE', 'Nowy Plik');
define('IMAGE_NEW_FOLDER', 'Nowy Katalog');
define('IMAGE_NEW_LANGUAGE', 'Nowy J�zyk');
define('IMAGE_NEW_NEWSLETTER', 'Nowy Newsletter');
define('IMAGE_NEW_PRODUCT', 'Nowy Produkt');
define('IMAGE_NEW_TAX_CLASS', 'Nowa Klasa Podatku');
define('IMAGE_NEW_TAX_RATE', 'Nowa Stawka Podatku');
define('IMAGE_NEW_TAX_ZONE', 'Nowa Strefa Podatkowa');
define('IMAGE_NEW_ZONE', 'Nowa Strefa');
define('IMAGE_ORDERS', 'Zam�wienia');
define('IMAGE_ORDERS_INVOICE', 'Faktura');
define('IMAGE_ORDERS_PACKINGSLIP', 'List Przewozowy');
define('IMAGE_PREVIEW', 'Podgl�d');
define('IMAGE_RESTORE', 'Przywr��');
define('IMAGE_RESET', 'Resetuj');
define('IMAGE_SAVE', 'Zapisz');
define('IMAGE_SEARCH', 'Szukaj');
define('IMAGE_SELECT', 'Wybierz');
define('IMAGE_SEND', 'Wy�lij');
define('IMAGE_SEND_EMAIL', 'Wy�lij Email');
define('IMAGE_UNLOCK', 'Odblokuj');
define('IMAGE_UPDATE', 'Aktualizuj');
define('IMAGE_UPDATE_CURRENCIES', 'Aktualizuj Kurs Wymiany');
define('IMAGE_UPLOAD', 'Upload');

define('ICON_CROSS', 'Fa�sz');
define('ICON_CURRENT_FOLDER', 'Bie��cy Katalog');
define('ICON_DELETE', 'Usu�');
define('ICON_ERROR', 'B��d');
define('ICON_FILE', 'Plik');
define('ICON_FILE_DOWNLOAD', 'Download');
define('ICON_FOLDER', 'Katalog');
define('ICON_LOCKED', 'Zablokowany');
define('ICON_PREVIOUS_LEVEL', 'Poprzedni Poziom');
define('ICON_PREVIEW', 'Podgl�d');
define('ICON_STATISTICS', 'Statystyki');
define('ICON_SUCCESS', 'Powiod�o Si�');
define('ICON_TICK', 'Prawda');
define('ICON_UNLOCKED', 'Odblokowany');
define('ICON_WARNING', 'Ostrze�enie');

// constants for use in tep_prev_next_display function
define('TEXT_RESULT_PAGE', 'Strona %s z %d');
define('TEXT_DISPLAY_NUMBER_OF_BANNERS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> baner�w)');
define('TEXT_DISPLAY_NUMBER_OF_COUNTRIES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> kraj�w)');
define('TEXT_DISPLAY_NUMBER_OF_CUSTOMERS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> klient�w)');
define('TEXT_DISPLAY_NUMBER_OF_CURRENCIES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> walut)');
define('TEXT_DISPLAY_NUMBER_OF_LANGUAGES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> j�zyk�w)');
define('TEXT_DISPLAY_NUMBER_OF_MANUFACTURERS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> producent�w)');
define('TEXT_DISPLAY_NUMBER_OF_NEWSLETTERS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> newsletter�w)');
define('TEXT_DISPLAY_NUMBER_OF_ORDERS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> zam�wie�)');
define('TEXT_DISPLAY_NUMBER_OF_ORDERS_STATUS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> status�w zam�wienia)');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> produkt�w)');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS_EXPECTED', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> produkt�w oczekiwanych)');
define('TEXT_DISPLAY_NUMBER_OF_REVIEWS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> recenzji produkt�w)');
define('TEXT_DISPLAY_NUMBER_OF_SPECIALS', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> produkt�w w promocji)');
define('TEXT_DISPLAY_NUMBER_OF_TAX_CLASSES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> klas podatku)');
define('TEXT_DISPLAY_NUMBER_OF_TAX_ZONES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> stref podatkowych)');
define('TEXT_DISPLAY_NUMBER_OF_TAX_RATES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> stawek podatku)');
define('TEXT_DISPLAY_NUMBER_OF_ZONES', 'Wy�wietlono od <b>%d</b> do <b>%d</b> (z <b>%d</b> stref)');

define('PREVNEXT_BUTTON_PREV', '&lt;&lt;');
define('PREVNEXT_BUTTON_NEXT', '&gt;&gt;');

define('TEXT_DEFAULT', 'domy�lny');
define('TEXT_SET_DEFAULT', 'Ustaw jako domy�lne');
define('TEXT_FIELD_REQUIRED', '&nbsp;<span class="fieldRequired">* Wymagane</span>');

define('ERROR_NO_DEFAULT_CURRENCY_DEFINED', 'B��d: Obecnie nie ma ustawionej domy�lnej waluty. Prosz� jak�� wybra�: Panel Administracyjny->Lokalizacja->Waluty');

define('TEXT_CACHE_CATEGORIES', 'Kategorie');
define('TEXT_CACHE_MANUFACTURERS', 'Producenci');
define('TEXT_CACHE_ALSO_PURCHASED', 'Modu� Zakupiono R�wnie�');

define('TEXT_NONE', '--brak--');
define('TEXT_TOP', 'Top');

define('ERROR_DESTINATION_DOES_NOT_EXIST', 'B��d: Obiekt docelowy  nie istnieje.');
define('ERROR_DESTINATION_NOT_WRITEABLE', 'B��d: Od obiektu docelowego nie mo�na zapisywa�.');
define('ERROR_FILE_NOT_SAVED', 'B��d: Wgrywany plik nie zosta� zapisany.');
define('ERROR_FILETYPE_NOT_ALLOWED', 'B��d: Wgrywanie tego rodzaju plik�w jest zabronione.');
define('SUCCESS_FILE_SAVED_SUCCESSFULLY', 'Powiod�o si�: Wgrywany plik zosta� zapisany.');
define('WARNING_NO_FILE_UPLOADED', 'Uwaga: Nie wgrano pliku.');
define('WARNING_FILE_UPLOADS_DISABLED', 'Uwaga: Wgrywanie plik�w na serwer jest zablokowane w pliku konfiguracyjnym PHP php.ini.');

define('TEXT_DISPLAY_NUMBER_OF_ARTICLES', 'Wyswietlanie <b>%d</b> to <b>%d</b> (z <b>%d</b> artyku��w)');
define('BOX_CATALOG_DEFINE_MAINPAGE', 'Edycja strony g��wnej');


// header text in includes/header.php
define('HEADER_TITLE_ACCOUNT', 'Moje konto');
define('HEADER_TITLE_LOGOFF', 'Wyloguj');

// Admin Account
define('BOX_HEADING_MY_ACCOUNT', 'Moje konto');

// configuration box text in includes/boxes/administrator.php
define('BOX_HEADING_ADMINISTRATOR', 'Administracja');
define('BOX_ADMINISTRATOR_MEMBERS', 'Grupy Cz�onkowskie');
define('BOX_ADMINISTRATOR_MEMBER', 'Osoby uprawnione');
define('BOX_ADMINISTRATOR_BOXES', 'Dost�p do plik�w');

// images
define('IMAGE_FILE_PERMISSION', 'Uprawnienia do plik�w');
define('IMAGE_GROUPS', 'Lista Grup');
define('IMAGE_INSERT_FILE', 'Dodaj plik');
define('IMAGE_MEMBERS', 'Lista Cz�onk�w');
define('IMAGE_NEW_GROUP', 'Nowa Grupa');
define('IMAGE_NEW_MEMBER', 'Nowy Cz�onek');
define('IMAGE_NEXT', 'Dalej');

// constants for use in tep_prev_next_display function
define('TEXT_DISPLAY_NUMBER_OF_FILENAMES', 'Wy�wietlanie <b>%d</b> do <b>%d</b> (z <b>%d</b> plik�w)');
define('TEXT_DISPLAY_NUMBER_OF_MEMBERS', 'Wy�wietlanie <b>%d</b> do <b>%d</b> (z <b>%d</b> Cz�onk�w)');

define('ERROR_FILE_NOT_WRITEABLE', 'Nie mo�na zapisa� zmian w pliku');
  define('BOX_HEADING_INFORMATION', 'Informacje');
  define('BOX_INFORMATION_MANAGER', 'Zarz�dzanie');
  
define('ENTRY_STREET_ADDRESS_MIESZKANIE', 'Numer Mieszkania');
define('ENTRY_STREET_ADDRESS_MIESZKANIE_TEXT', '');
define('ENTRY_STREET_ADDRESS_DOM', 'Numer Domu');
define('ENTRY_STREET_ADDRESS_DOM_TEXT', '*');

define('ENTRY_GMINA', 'Gmina');
define('ENTRY_GMINA_TEXT', '');
define('ENTRY_POWIAT', 'Powiat');
define('ENTRY_POWIAT_TEXT', '*');
define('BOX_CATALOG_EASYPOPULATE', 'Import/export CSV');
define('BOX_CATALOG_FEATURED', 'Produkty Polecane');
define('BOX_CATALOG_PRODUCTS_UPDATE', 'Ceny/wagi/magazyn');
define('BOX_REPORTS_STOCK_LEVEL', 'Braki Magazynowe');
define('BOX_REPORTS_CUSTOMER_STATS', 'Nowi Klienci');
define('BOX_TOOLS_BATCH_CENTER', 'Centrum Druku');
define('BOX_REPORTS_ORDERS_TRACKING', '�ledzenie Zam�wie�');
define('BOX_REPORTS_ORDERS_TRACKING_ZONES', 'Zam�wienia wg Strefy');
define('BOX_REPORTS_CUSTOMER_STATS', 'Nowi Klienci');
define('BOX_CATALOG_IMAGES_PRODUCTS', 'Dodatkowe Obrazki');
define('IMAGE_ADDITIONAL_NEW', 'Dodaj Obrazki');    
define('IMAGE_ADDITIONAL_DEL', 'Usu� Obrazki');
//TotalB2B start
define('BOX_CUSTOMERS_GROUPS', 'Grupy Rabatowe');
define('BOX_MANUDISCOUNT', 'Zni�ki producenckie');
//TotalB2B end
define('BOX_TOOLS_ADMIN_NOTES', 'Notatki Admina');
// promocje grupowe
define('BOX_CATALOG_SPECIALSBYCAT','Promocje Grupowe');
// dodatkowe pola produktu
define('BOX_CATALOG_PRODUCTS_EXTRA_FIELDS', 'Dodatkowe Pola Produktu');
// naprawa produkt�w
define('BOX_TOOLS_NAPRAW_PRODUKTY', 'Naprawa Produkt�w');
define('TEXT_IMAGE_NONEXISTENT', 'OBRAZEK NIE ISTNIEJE');
// platnosc a wysylka
define('BOX_MODULES_SHIP2PAY', 'P�atno�� a Wysy�ka');
define('TEXT_DISPLAY_NUMBER_OF_PAYMENTS', 'Wy�wietlanie <b>%d</b> do <b>%d</b> (z <b>%d</b> powi�zanych modu��w)');
// produkty powiazane
define('DIR_FS_CACHE_XSELL', '../cache/');
define('BOX_CATALOG_XSELL_PRODUCTS', 'Produkty powi�zane');
// schowek
define('BOX_REPORTS_WISHLISTS', 'Podgl�d schowk�w Klient�w');

define('BOX_HEADING_WSPARCIE','Wsparcie');

// newsy
define('BOX_HEADING_NEWSDESK', 'System news�w');
define('BOX_NEWSDESK', 'Zarz�dzanie artyku�ami');
define('BOX_NEWSDESK_REVIEWS', 'Zarz�dzanie komentarzami');
define('NEWSDESK_ARTICLES', 'Artyku�y');
define('NEWSDESK_REVIEWS', 'Komentarze');
define('TABLE_HEADING_NEWSDESK', 'Nowo�ci i Informacje');
define('TEXT_NO_NEWSDESK_NEWS', 'Nie znaleziono wybranego newsa');
define('TEXT_NEWSDESK_READMORE', 'Wi�cej');
define('TEXT_NEWSDESK_VIEWED', 'Ogl�dano:');
define('BOX_HEADING_NEWSDESK_CATEGORIES', 'Grupy News�w');
define('BOX_HEADING_NEWSDESK_LATEST', 'Ostatnie Newsy');
define('TEXT_DISPLAY_NUMBER_OF_ARTICLES', 'Wy�wietlanie <b>%d</b> to <b>%d</b> (z <b>%d</b> artyku��w)');
//  define('DIR_WS_RSS', DIR_WS_INCLUDES . 'modules/newsdesk/rss/');
?>