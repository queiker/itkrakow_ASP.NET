<?php
/*
  $Id: create_account_process.php,v 1.0 2003/03/25 10:30:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com
  modyfikacje "odkalkowuj�ce" : devein@acmosis.eu.org
  
*/

define('NAVBAR_TITLE_1', 'Za�� konto');
define('NAVBAR_TITLE_2', 'Uzupe�nianie danych');
define('HEADING_TITLE', 'Informacje o moim koncie');

define('EMAIL_SUBJECT', 'Witaj w sklepie ' . STORE_NAME);
define('EMAIL_GREET_MR', 'Szanowny Panie ' . stripslashes($HTTP_POST_VARS['lastname']) . ',' . "\n\n");
define('EMAIL_GREET_MS', 'Szanowna Pani ' . stripslashes($HTTP_POST_VARS['lastname']) . ',' . "\n\n");
define('EMAIL_GREET_NONE', 'Drogi ' . stripslashes($HTTP_POST_VARS['firstname']) . ',' . "\n\n");
define('EMAIL_WELCOME', 'Witamy w sklepie <b>' . STORE_NAME . '</b>.' . "\n\n");
define('EMAIL_TEXT', 'Dzi�ki rejestracji masz mo�liwo�� skorzystania z <b>wielu us�ug</b> jakie oferujemy naszym u�ytkownikom. Niekt�re z nich to:' . "\n\n" . '
<li><b>Trwa�y Koszyk</b> - Ka�dy produkt dodany do koszyka pozostaje w nim do momentu zam�wienia lub usuni�cia.' . "\n" . '<li><b>Ksi��ka Adresowa</b> - Teraz mo�emy dostarczy� produkty kt�re zam�wisz pod wskazany przez ciebie adres!
To dobry spos�b na wys�anie komu� prezentu urodzinowego.' . "\n" . '<li><b>Historia Zam�wie�</b> - Zobacz histori� zam�wie� kt�re u nas sk�ada�e�.' . "\n" . '<li><b>Opiniowanie Produkt�w</b> - Podziel si� swoimi opiniami o produktach z innymi klientami.' . "\n\n");
define('EMAIL_CONTACT', 'W celu uzyskania pomocy skontaktuj si� droga elektroniczn� z w�a�cicielem sklepu: ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n\n");
define('EMAIL_WARNING', '<b>UWAGA:</b> Ten adres email otrzymali�my od jednego z naszych klient�w podczas jego rejestracji. Je�eli to nie Ty zak�ada�e� to konto wy�lij wiadomo�� na adres ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n");
?>
