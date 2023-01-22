<?php
/*
  $Id: login.php,v 1.11 2002/06/03 13:19:42 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

if ($HTTP_GET_VARS['origin'] == FILENAME_CHECKOUT_PAYMENT) {
  define('NAVBAR_TITLE', 'Order');
  define('HEADING_TITLE', 'Ordering online is easy.');
  define('TEXT_STEP_BY_STEP', 'We\'ll walk you through the process, step by step.');
} else {
  define('NAVBAR_TITLE', 'Logowanie');
  define('HEADING_TITLE', 'Welcome, Please Sign In');
  define('TEXT_STEP_BY_STEP', ''); // should be empty
}

define('HEADING_RETURNING_ADMIN', 'Logowanie');
define('HEADING_PASSWORD_FORGOTTEN', 'Zapomniane has�o');
define('TEXT_RETURNING_ADMIN', 'Staff only!');
define('ENTRY_EMAIL_ADDRESS', 'E-Mail Address:');
define('ENTRY_PASSWORD', 'Has�o:');
define('ENTRY_FIRSTNAME', 'Imi�:');
define('IMAGE_BUTTON_LOGIN', 'Wy�lij');

define('TEXT_PASSWORD_FORGOTTEN', 'Zapomnia�e� has�o?');

define('TEXT_LOGIN_ERROR', '<font color="#ff0000"><b>B��d:</b></font> Niepoprawne has�o lub adres !');
define('TEXT_FORGOTTEN_ERROR', '<font color="#ff0000"><b>B��d:</b></font> podane imi� lub has�o jest niepoprawne !');
define('TEXT_FORGOTTEN_FAIL', 'You have try over 3 times. For security reason, please contact your Web Administrator to get new password.<br>&nbsp;<br>&nbsp;');
define('TEXT_FORGOTTEN_SUCCESS', 'Nowe has�o zosta�o wys�ane e-mailem. Sprawd�s woj� poczt� i naci�nij wr��.<br>&nbsp;<br>&nbsp;');

define('ADMIN_EMAIL_SUBJECT', 'Nowe has�o'); 
define('ADMIN_EMAIL_TEXT', 'Witaj %s,' . "\n\n" . 'Masz dost�p do panelu administracyjnego za pomoc� nast�puj�cych danych. Po pierwszym logowaniu zmie� swoje has�o!' . "\n\n" . 'Adres : %s' . "\n" . 'U�ytkownik: %s' . "\n" . 'Has�o: %s' . "\n\n" . 'Dzi�kujemy!' . "\n" . '%s' . "\n\n" . 'Ten mail zosta� wygenerowany automatycznie. Prosimy nie odpowiada�!'); 
?>
