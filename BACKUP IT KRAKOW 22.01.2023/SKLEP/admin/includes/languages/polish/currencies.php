<?php
/*
  $Id: currencies.php,v 1.12 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('HEADING_TITLE', 'Waluty');

define('TABLE_HEADING_CURRENCY_NAME', 'Waluta');
define('TABLE_HEADING_CURRENCY_CODES', 'Kod');
define('TABLE_HEADING_CURRENCY_VALUE', 'Warto��');
define('TABLE_HEADING_ACTION', 'Dzia�anie');

define('TEXT_INFO_EDIT_INTRO', 'Wprowad� niezb�dne zmiany');
define('TEXT_INFO_CURRENCY_TITLE', 'Nazwa:');
define('TEXT_INFO_CURRENCY_CODE', 'Kod:');
define('TEXT_INFO_CURRENCY_SYMBOL_LEFT', 'Symbol z Lewej:');
define('TEXT_INFO_CURRENCY_SYMBOL_RIGHT', 'Symbol z Prawej:');
define('TEXT_INFO_CURRENCY_DECIMAL_POINT', 'Separator Decymalny:');
define('TEXT_INFO_CURRENCY_THOUSANDS_POINT', 'Separator Tysi�cy:');
define('TEXT_INFO_CURRENCY_DECIMAL_PLACES', 'Ilo�� Miejsc Po Przecinku:');
define('TEXT_INFO_CURRENCY_LAST_UPDATED', 'Ostatnia Aktalizacja:');
define('TEXT_INFO_CURRENCY_VALUE', 'Warto��:');
define('TEXT_INFO_CURRENCY_EXAMPLE', 'Przyk�ad:');
define('TEXT_INFO_INSERT_INTRO', 'Wprowad� now� walut� i jej niezb�dne dane');
define('TEXT_INFO_DELETE_INTRO', 'Czy na pewno chcesz usun�� t� walut�?');
define('TEXT_INFO_HEADING_NEW_CURRENCY', 'Nowa Waluta');
define('TEXT_INFO_HEADING_EDIT_CURRENCY', 'Edytuj Walut�');
define('TEXT_INFO_HEADING_DELETE_CURRENCY', 'Usu� Walut�');
define('TEXT_INFO_SET_AS_DEFAULT', TEXT_SET_DEFAULT . ' (wymaga r�cznej aktualizacji kursu waluty)');
define('TEXT_INFO_CURRENCY_UPDATED', 'Kurs wymiany dla %s (%s) zosta� pomy�lnie zaktualizowany poprzez serwer %s.');

define('ERROR_REMOVE_DEFAULT_CURRENCY', 'B��d: Domy�lna waluta nie mo�e by� usuni�ta. Wybierz inn� walut� jako domy�ln� i spr�buj ponownie.');
define('ERROR_CURRENCY_INVALID', 'B��d: Kur wymiany dla %s (%s) nie zosta� zaktualizowany poprzez serwer %s. Czy taki symbol waluty istnieje?');
define('WARNING_PRIMARY_SERVER_FAILED', 'Uwaga: Podstawowy serwer aktualizacji kurs�w wymiany (%s) nie odpowiedzia� na akutualizacj� waluty %s (%s) - pr�buj� na drugim zapasowym serwerze.');
?>
