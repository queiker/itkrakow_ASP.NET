<?php
/*
  $Id: create_account.php,v 1.11 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('NAVBAR_TITLE', 'Za�� Konto');
define('HEADING_TITLE', 'Informacje o Moim Koncie');
define('HEADING_TITLE_NO_ACCOUNT','Dane do zam�wienia');

define('TEXT_ORIGIN_LOGIN', '<span class="infoWarning">INFORMACJA:</span> Je�eli masz ju� konto w naszym sklepie, zaloguj si� na <a href="%s"><u>tej stronie</u></a>.');

define('EMAIL_SUBJECT', 'Witaj w sklepie ' . STORE_NAME);
define('EMAIL_GREET_MR', 'Szanowny Panie %s,' . "\n\n");
define('EMAIL_GREET_MS', 'Szanowna Pani %s,' . "\n\n");
define('EMAIL_GREET_NONE', 'Drogi %s' . "\n\n");
define('EMAIL_WELCOME', 'Witamy w sklepie <b>' . STORE_NAME . '</b>.' . "\n\n");
define('EMAIL_TEXT', 'Dzi�ki rejestracji masz mo�liwo�� skorzystania z <b>wielu us�ug</b> jakie oferujemy naszym u�ytkownikom. Niekt�re z nich to:' . "\n\n" . ' <li><b>Trwa�y Koszyk</b> - Ka�dy produkt dodany do koszyka pozostaje w nim do momentu zam�wienia lub usuni�cia.' . "\n" . '<li><b>Ksi��ka Adresowa</b> - Teraz mo�emy dostarczy� produkty kt�re zam�wisz pod wskazany przez ciebie adres! To dobry spos�b na wys�anie komu� prezentu urodzinowego.' . "\n" . '<li><b>Historia Zam�wie�</b> - Zobacz histori� zam�wie� kt�re u nas sk�ada�e�.' . "\n" . ' <li><b>Opiniowanie Produkt�w</b> - Podziel si� swoimi opiniami o produktach z innymi klientami.' . "\n\n");
define('EMAIL_CONTACT', 'W celu uzyskania pomocy skontaktuj si� droga elektroniczn� z w�a�cicielem sklepu: ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n\n");
define('EMAIL_WARNING', '<b>UWAGA:</b> Ten adres email otrzymali�my od jednego z naszych klient�w podczas jego rejestracji. Je�eli to nie Ty zak�ada�e� to konto wy�lij wiadomo�� na adres ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n");
//PWA start
define('PWA_HEADING_TITLE', 'Informacje do zam�wienia');
define('PWA_FAIL_ACCOUNT_EXISTS', 'Istnieje ju� konto utworzone dla adresu e-mail {EMAIL_ADDRESS}.  Musisz si� zalogowa� podaj�c w�a�ciwe has�o zanim b�dziesz m�g� kontynuowa� procedur� zamawiania.');
//PWA end
//TotalB2B start
define('EMAIL_VALIDATE_SUBJECT', 'Nowy Klient w '. STORE_NAME);
define('EMAIL_VALIDATE', 'Nowy Klient zarejestrowany w '. STORE_NAME);
define('EMAIL_VALIDATE_PROFILE', 'Aby zobaczy� profil Klienta kliknij:');
define('EMAIL_VALIDATE_ACTIVATE', 'Aby aktywowa� Klienta kliknij:');
//TotalB2B end
?>
