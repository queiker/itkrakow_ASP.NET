<?php
/*
  $Id: wishlist.php,v 3.0  2005/04/20 Dennis Blake
  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_WISHLIST', 'Schowek');
define('HEADING_TITLE2', 'Produkty w schowku');
define('BOX_TEXT_PRICE', 'Cena');
define('BOX_TEXT_PRODUCT', 'Nazwa');
define('BOX_TEXT_IMAGE', 'Zdj�cie');
define('BOX_TEXT_SELECT', 'Wybierz');

define('BOX_TEXT_VIEW', 'Poka�');
define('BOX_TEXT_HELP', 'Pomoc');
define('BOX_WISHLIST_EMPTY', 'Aktualnie brak produkt�w');
//define('BOX_TEXT_NO_ITEMS', 'Aktualnie nie ma �adnych produkt�w na twojej li�cie. <br /><br /><b><a href="' . tep_href_link(FILENAME_WISHLIST_HELP) . '"><u>Zobacz</u></a> jak korzysta� z przechowalni.</b>');
define('BOX_TEXT_NO_ITEMS', '<br>Aktualnie nie ma �adnych produkt�w na twojej li�cie. <br>');
define('TEXT_NAME', 'Imi�: ');
define('TEXT_EMAIL', 'E-mail: ');
define('TEXT_YOUR_NAME', 'Twoje Imi�: ');
define('TEXT_YOUR_EMAIL', 'Tw�j E-mail: ');
define('TEXT_MESSAGE', 'Wiadomo��: ');
define('TEXT_ITEM_IN_CART', 'Produkt w koszyku');
define('TEXT_ITEM_NOT_AVAILABLE', 'Produkt jest ju� niedost�pny');
define('TEXT_DISPLAY_NUMBER_OF_WISHLIST', 'Wy�wietlono <b>%d</b> do <b>%d</b> (z <b>%d</b> produkt�w z schowku.)');

define('WISHLIST_EMAIL_TEXT', 'Mo�esz przes�a� produkty ze schowka do znajomych lub rodziny. Napisz kr�tk� wiadomo��, kt�ra zostanie przes�ana razem z list� produkt�w.');

define('WISHLIST_EMAIL_TEXT_GUEST', 'Mo�esz przes�a� produkty ze schowka do znajomych lub rodziny. Pami�taj aby poda� sw�j adres e-mail oraz imi�. Napisz kr�tk� wiadomo��, kt�ra zostanie przes�ana razem z list� produkt�w.');

define('WISHLIST_EMAIL_SUBJECT', ' przesy�a ci list� wybranych produkt�w ze sklepu ' . STORE_NAME);  //Customers name will be automatically added to the beginning of this.
define('WISHLIST_SENT', 'Produkty ze schowka zosta�y przes�ane.');
define('WISHLIST_EMAIL_LINK', '

$from_name, og�lnodost�pny schowek znajduje si� pod adresem:
$link

Dzi�kujemy,
' . STORE_NAME); //$from_name = Customers name  $link = public wishlist link

define('WISHLIST_EMAIL_GUEST', 'Dzi�kujemy,
' . STORE_NAME);

define('ERROR_YOUR_NAME' , 'Podaj Imi�.');
define('ERROR_YOUR_EMAIL' , 'Podaj adres e-mail.');
define('ERROR_VALID_EMAIL' , 'Podaj poprawny adres e-mail.');
define('ERROR_ONE_EMAIL' , 'Musisz poda� co najmniej jedno imi� i adres e-mail.');
define('ERROR_ENTER_EMAIL' , 'Podaj adres e-mail.');
define('ERROR_ENTER_NAME' , 'Podaj imi� adresata.');
define('ERROR_MESSAGE', 'Wpisz kr�tk� wiadomo��.');
?>