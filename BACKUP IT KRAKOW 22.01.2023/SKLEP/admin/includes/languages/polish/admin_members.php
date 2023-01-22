<?php
/*
  $Id: admin_members.php,v 1.13 2002/08/19 01:45:58 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

if ($HTTP_GET_VARS['gID']) {
  define('HEADING_TITLE', 'Grupy Administracyjne');
} elseif ($HTTP_GET_VARS['gPath']) {
  define('HEADING_TITLE', 'Definiowanie uprawnie� grup');
} else {
  define('HEADING_TITLE', 'Administratorzy');
}

define('TEXT_COUNT_GROUPS', 'Grupy: ');

define('TABLE_HEADING_NAME', 'Nazwa');
define('TABLE_HEADING_EMAIL', 'Adres E-mail');
define('TABLE_HEADING_PASSWORD', 'Has�o');
define('TABLE_HEADING_CONFIRM', 'Potwierdzenie Has�a');
define('TABLE_HEADING_GROUPS', 'Poziom uprawnie�');
define('TABLE_HEADING_CREATED', 'Utworzono');
define('TABLE_HEADING_MODIFIED', 'Zmodyfikowano');
define('TABLE_HEADING_LOGDATE', 'Ostatnie Logowanie');
define('TABLE_HEADING_LOGNUM', 'Liczba Logowa�');
define('TABLE_HEADING_LOG_NUM', 'Liczba Logowa�');
define('TABLE_HEADING_ACTION', 'Dzia�ania');

define('TABLE_HEADING_GROUPS_NAME', 'Nazwy Grup');
define('TABLE_HEADING_GROUPS_DEFINE', 'Wyb�r box�w i plik�w');
define('TABLE_HEADING_GROUPS_GROUP', 'Poziom');
define('TABLE_HEADING_GROUPS_CATEGORIES', 'Kategorie uprawnie�');


define('TEXT_INFO_HEADING_DEFAULT', 'Administrator ');
define('TEXT_INFO_HEADING_DELETE', 'Kasuj Uprawnienia ');
define('TEXT_INFO_HEADING_EDIT', 'Edycja Kategorii / ');
define('TEXT_INFO_HEADING_EDIT_GROUP', 'Edycja Nazwy Grupy ');
define('TEXT_INFO_EDIT_GROUP_INTRO', 'Edycja Nazwy Grupy ');
define('TEXT_INFO_HEADING_NEW', 'Nowy Administrator ');

define('TEXT_INFO_DEFAULT_INTRO', 'Grupa');
define('TEXT_INFO_DELETE_INTRO', 'Usun�� Cz�onka <nobr><b>%s</b></nobr> <nobr>?</nobr>');
define('TEXT_INFO_DELETE_INTRO_NOT', 'Nie mo�esz skasowa� grupy  <nobr>%s !</nobr>');
define('TEXT_INFO_EDIT_INTRO', 'Nadaj poziom uprawnie� tutaj: ');

define('TEXT_INFO_FULLNAME', 'Nazwa: ');
define('TEXT_INFO_FIRSTNAME', 'Imi�: ');
define('TEXT_INFO_LASTNAME', 'Nazwisko: ');
define('TEXT_INFO_EMAIL', 'Adres E-mail: ');
define('TEXT_INFO_PASSWORD', 'Has�o: ');
define('TEXT_INFO_CONFIRM', 'Potwierdzenie Has�a: ');
define('TEXT_INFO_CREATED', 'Utworzony: ');
define('TEXT_INFO_MODIFIED', 'Zmodyfikowany: ');
define('TEXT_INFO_LOGDATE', 'Ostanie Logowanie: ');
define('TEXT_INFO_LOGNUM', 'Liczba Logowa�: ');
define('TEXT_INFO_GROUP', 'Grupa: ');
define('TEXT_INFO_ERROR', '<font color="red">Podany adres jest ju� u�ywany! Spr�buj ponownie!.</font>');

define('JS_ALERT_FIRSTNAME', '- Wymagane: Imi� \n');
define('JS_ALERT_LASTNAME', '- Wymagane: Nazwisko \n');
define('JS_ALERT_EMAIL', '- Wymagane: Adres E-mail \n');
define('JS_ALERT_EMAIL_FORMAT', '- Format Adres E-mail jest niepoprawny! \n');
define('JS_ALERT_EMAIL_USED', '- Adres E-mail jest ju� u�ywany! \n');
define('JS_ALERT_LEVEL', '- Wymagane: Grupa \n');

define('ADMIN_EMAIL_SUBJECT', 'Nowy Administrator');
define('ADMIN_EMAIL_TEXT', 'Witaj %s,' . "\n\n" . 'Masz dost�p do panelu administracyjnego za pomoc� nast�puj�cych danych. Po pierwszym logowaniu zmie� swoje has�o!' . "\n\n" . 'Adres : %s' . "\n" . 'U�ytkownik: %s' . "\n" . 'has�o: %s' . "\n\n" . 'Dzi�kujemy!' . "\n" . '%s' . "\n\n" . 'Ten mail zosta� wygenerowany automatycznie. Prosimy nie odpowiada�!'); 

define('TEXT_INFO_HEADING_DEFAULT_GROUPS', 'Administracja Grup� ');
define('TEXT_INFO_HEADING_DELETE_GROUPS', 'Kasuj Grup� ');

define('TEXT_INFO_DEFAULT_GROUPS_INTRO', '<b>Uwagi:</b><li><b>Edytuj:</b> edycja Nazwy Grupy.</li><li><b>Usu�:</b> kasuj Grup�.</li><li><b>Zdefiniuj:</b> definiowanie uprawnie� Grupy.</li>');
define('TEXT_INFO_DELETE_GROUPS_INTRO', 'Wszyscy cz�onkowie tej Grupy zostan� skasowani. Czy jeste� pewny, �e chcesz skasowa� Grup�: <nobr><b>%s</b>?</nobr>');
define('TEXT_INFO_DELETE_GROUPS_INTRO_NOT', 'Nie mo�esz skasowa� tej grupy!');
define('TEXT_INFO_GROUPS_INTRO', 'Wprowad� nunikaln� nazw� grupy. Kliknij dalej!.');

define('TEXT_INFO_HEADING_GROUPS', 'Nowa grupa');
define('TEXT_INFO_GROUPS_NAME', ' <b>Nazwa Grupy:</b><br>Wprowad� unikaln� nazw� Grupy i kliknij dalej.<br>');
define('TEXT_INFO_GROUPS_NAME_FALSE', '<font color="red"><b>B��d:</b> Liczba znak�w w nazwie Grupy musi wynosi� co najmniej 5.</font>');
define('TEXT_INFO_GROUPS_NAME_USED', '<font color="red"><b>B��d:</b> Nazwa Grupy ju� istnieje!</font>');
define('TEXT_INFO_GROUPS_LEVEL', 'Poziom uprawnie�: ');
define('TEXT_INFO_GROUPS_BOXES', '<b>Boxes Permission:</b><br>Give access to selected boxes.');
define('TEXT_INFO_GROUPS_BOXES_INCLUDE', 'Include files stored in: ');

define('TEXT_INFO_HEADING_DEFINE', 'Definiowanie Uprawnie� Grupy');
if ($HTTP_GET_VARS['gPath'] == 1) {
  define('TEXT_INFO_DEFINE_INTRO', '<b>%s :</b><br>Nie mo�na zmienia� uprawnie� tej grupy.<br><br>');
} else {
  define('TEXT_INFO_DEFINE_INTRO', '<b>%s :</b><br>Zmian mo�na dokona� poprzez zaznaczenie b�d� odznaczenie box\'�w i plik�w. Aby zachowa� zmiany naci�nij <b>Zachowaj</b>.<br><br>');
}

define('ADMIN_EMAIL_EDIT_SUBJECT', 'Modyfikacja danych osobowych');
define('ADMIN_EMAIL_EDIT_TEXT', 'Witaj %s,' . "\n\n" . 'Twoje dane osobowe zosta�y zmodyfikowane przez administratora.' . "\n\n" . 'Adres : %s' . "\n" . 'U�ytkownik: %s' . "\n" . 'Has�o: %s' . "\n\n" . 'Dzi�kujemy!' . "\n" . '%s' . "\n\n" . 'Ten mail zosta� wygenerowany automatycznie. Prosimy nie odpowiada�!');
?>
