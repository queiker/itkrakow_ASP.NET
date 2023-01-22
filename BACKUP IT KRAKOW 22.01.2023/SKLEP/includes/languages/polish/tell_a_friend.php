<?php
/*
  $Id: tell_a_friend.php,v 1.7 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('NAVBAR_TITLE', 'Powiedz Znajomemu');
define('HEADING_TITLE', "Powiedz Znajomemu o '%s'");

define('FORM_TITLE_CUSTOMER_DETAILS', 'Twoje Dane');
define('FORM_TITLE_FRIEND_DETAILS', 'Dane Twojego Znajomego');
define('FORM_TITLE_FRIEND_MESSAGE', 'Twoja Wiadomo��');

define('FORM_FIELD_CUSTOMER_NAME', 'Imi� i Nazwisko:');
define('FORM_FIELD_CUSTOMER_EMAIL', 'Adres Email:');
define('FORM_FIELD_FRIEND_NAME', 'Imi� Znajomego:');
define('FORM_FIELD_FRIEND_EMAIL', 'Adres Email Znajomego:');

define('TEXT_EMAIL_SUCCESSFUL_SENT', 'Twoja wiadomo�� na temat produktu <b>%s</b> zosta�a wys�ana na adres <b>%s</b>.');

define('TEXT_EMAIL_SUBJECT', 'Tw�j znajomy - %s poleci� Ci doskona�y produkt ze sklepu %s');
define('TEXT_EMAIL_INTRO', 'Witaj %s!' . "\n\n" . 'Tw�j znajomy - %s pomy�la� �e mo�esz by� zainteresowany produktem %s ze sklepu %s.');
define('TEXT_EMAIL_LINK', 'Aby go obejrze� kliknij na poni�szy link albo skopiuj go do swojej przegl�darki internetowej:' . "\n\n" . '%s');
define('TEXT_EMAIL_SIGNATURE', 'Pozdrowienia,' . "\n\n" . '%s');

define('ERROR_TO_NAME', 'B��d: Imi� twojego znajomego musi by� podane.');
define('ERROR_TO_ADDRESS', 'B��d: Adres e-mail musi mie� poprawny format.');
define('ERROR_FROM_NAME', 'B��d: Twoje imi� nie mo�e by� puste.');
define('ERROR_FROM_ADDRESS', 'B��d: Tw�j adres e-mail musi by� aktualny i mie� poprawny format.');
?>
