<?php
/*
  $Id: password_forgotten.php,v 1.8 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('NAVBAR_TITLE_1', 'Logowanie');
define('NAVBAR_TITLE_2', 'Zapomniane Has�o');
define('HEADING_TITLE', 'Zapomnia�em Swoje Has�o!');

define('TEXT_MAIN', 'Je�eli zapomnia�e� has�o podaj sw�j adres e-mail a my wy�lemy ci wiadomo�� z nowym has�em.');

define('TEXT_NO_EMAIL_ADDRESS_FOUND', 'B��d: Podany Adres E-Mail nie zosta� znaleziony w bazie naszych u�ytkownik�w. Spr�buj ponownie.');

define('EMAIL_PASSWORD_REMINDER_SUBJECT', STORE_NAME . ' - Nowe Has�o');
define('EMAIL_PASSWORD_REMINDER_BODY', 'Z adresu ' . $REMOTE_ADDR . ' zosta�o wys�ane ��danie nowego has�a.' . "\n\n" . 'Twoje nowe has�o w sklepie \'' . STORE_NAME . '\' to:' . "\n\n" . '   %s' . "\n\n");

define('SUCCESS_PASSWORD_SENT', 'Nowe Has�o Zosta�o Wys�ane Na Tw�j Adres E-Mail.');
?>
