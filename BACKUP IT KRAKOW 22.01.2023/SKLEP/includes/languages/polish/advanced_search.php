<?php
/*
  $Id: advanced_search.php,v 1.15 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('NAVBAR_TITLE_1', 'Wyszukiwanie Zaawansowane');
define('NAVBAR_TITLE_2', 'Wyniki Wyszukiwania');

define('HEADING_TITLE_1', 'Wyszukiwanie Zaawansowane');
define('HEADING_TITLE_2', 'Produkty spe�niaj�ce kryteria wyszukiwania');

define('HEADING_SEARCH_CRITERIA', 'Kryteria Wyszukiwania');

define('TEXT_SEARCH_IN_DESCRIPTION', 'Szukaj w opisach produkt�w');
define('ENTRY_CATEGORIES', 'Kategorie:');
define('ENTRY_INCLUDE_SUBCATEGORIES', 'Szukaj w podkategoriach');
define('ENTRY_MANUFACTURERS', 'Producenci:');
define('ENTRY_PRICE_FROM', 'Cena Od:');
define('ENTRY_PRICE_TO', 'Do:');
define('ENTRY_PRICE_TO_FULL', 'Cena Do:');
define('ENTRY_DATE_FROM', 'Data Od:');
define('ENTRY_DATE_TO', 'Do:');

define('TEXT_SEARCH_HELP_LINK', '<u>Pomoc</u> [?]');

define('TEXT_ALL_CATEGORIES', 'Wszystkie Kategorie');
define('TEXT_ALL_MANUFACTURERS', 'Wszyscy Producenci');

define('HEADING_SEARCH_HELP', 'Pomoc');
define('TEXT_SEARCH_HELP', 'Aby lepiej okre�li� wyniki wyszukiwania mo�esz u�y� wyra�e� AND i/lub OR.<br><br>Na przyk�ad wyra�enie <u>Microsoft AND mysz</u> wy�wietli tylko produkty kt�re zawieraj� oba s�owa. Z kolei dla wyra�enia
<u>mysz OR klawiatura</u> wynikiem b�d� tylko wpisy z obydwoma lub kt�rymkolwiek ze s��w.<br><br>Dok�adne zapytania mo�esz uzyska� za pomoc� ujmowania wyra�enia w cudzys��w.<br><br>Na przyk�ad, <u>"komputer przeno�ny"</u>
poka�e te produkty kt�re b�d� zawiera�y dok�adnie takie wyra�enie.<br><br>Nawiasy umo�liwiaj� konstruowanie jeszcze bardziej zaawansowanych wyra�e�.<br><br>Na przyk�ad <u>Microsoft and (klawiatura or mysz or "visual basic")</u>.');
define('TEXT_CLOSE_WINDOW', '<u>Zamknij Okno</u> [x]');

define('TABLE_HEADING_IMAGE', '');
define('TABLE_HEADING_MODEL', 'Model');
define('TABLE_HEADING_PRODUCTS', 'Nazwa');
define('TABLE_HEADING_MANUFACTURER', 'Producent');
define('TABLE_HEADING_QUANTITY', 'Ilo��');
define('TABLE_HEADING_PRICE', 'Cena');
define('TABLE_HEADING_WEIGHT', 'Waga');
define('TABLE_HEADING_BUY_NOW', 'Do Koszyka');

define('TEXT_NO_PRODUCTS', 'Nie ma produkt�w spe�niaj�cych zadane kryteria wyszukiwania.');

define('ERROR_AT_LEAST_ONE_INPUT', 'Przynajmniej jedno z p�l w formularzu wyszukiwania musi by� podane.');
define('ERROR_INVALID_FROM_DATE', 'B��dna Data Od.');
define('ERROR_INVALID_TO_DATE', 'B��dna Data Do.');
define('ERROR_TO_DATE_LESS_THAN_FROM_DATE', 'Data Do musi by� wi�ksza lub r�wna Dacie Od.');
define('ERROR_PRICE_FROM_MUST_BE_NUM', 'Cena Od musi by� liczb�.');
define('ERROR_PRICE_TO_MUST_BE_NUM', 'Cena Do musi by� liczb�.');
define('ERROR_PRICE_TO_LESS_THAN_PRICE_FROM', 'Cena Od musi by� wi�ksza lub r�wna Cenie Do.');
define('ERROR_INVALID_KEYWORDS', 'B��dne Wyra�enie Wyszukiwania.');
?>
