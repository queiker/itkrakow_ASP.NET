<?php
/*
  $Id: login.php,v 1.14 2003/06/08 08:14:17 ramroz Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Publikowane na zasadach licencji GNU General Public License

  T�umaczenie: Rafa� Mr�z ramroz@optimus.pl
  http://www.portalik.com

*/

define('NAVBAR_TITLE', 'Logowanie');
define('HEADING_TITLE', 'Witaj, Zaloguj Si�');

define('HEADING_NEW_CUSTOMER', 'Nowy Klient');
define('TEXT_NEW_CUSTOMER', 'Jestem nowym klientem.');
define('TEXT_NEW_CUSTOMER_INTRODUCTION', 'Tworz�c konto w ' . STORE_NAME . ' b�dziesz m�g� szybciej robi� zakupy, �ledzi� status swoich zam�wie� i ogl�da� histori� swoich zakup�w.');

define('HEADING_RETURNING_CUSTOMER', 'Zarejestrowany Klient');
define('TEXT_RETURNING_CUSTOMER', 'Jestem zarejestrowanym klientem i mam ju� konto.');

define('TEXT_PASSWORD_FORGOTTEN', 'Zapomnia�e� has�o? Kliknij tutaj.');

//TotalB2B start
define('TEXT_LOGIN_ERROR', 'B��d: Adres E-Mail i/lub Has�o nie zgadzaj� si� i/lub konto nie zosta�o Aktywowane.');
//TotalB2B end

define('TEXT_VISITORS_CART', '<font color="#ff0000"><b>INFORMACJA:</b></font> Zawarto�� twojego &quot;Koszyka Go�cia&quot; zostanie dodana do twojego &quot;Koszyka Klienta&quot; w momencie zalogowania. <a href="javascript:session_win();">[Wi�cej informacji]</a>');

define('PWA_FAIL_ACCOUNT_EXISTS', 'Istnieje ju� konto dla adresu email: {EMAIL_ADDRESS}.  Musisz si� zalogowa� podaj�c has�o przed przej�ciem do finalizacji zam�wienia.');
define('HEADING_CHECKOUT', '<font size="2">Przejd� do finalizacji zam�wienia</font>');
define('TEXT_CHECKOUT_INTRODUCTION', 'Przejd� do kasy bez zak�adania konta. Wybieraj�c t� opcj� nie b�dziesz m�g� �ledzi� statusu zam�wienia ani przegl�da� historii swoich zakup�w.');
define('PROCEED_TO_CHECKOUT', 'Przejd� do Kasy');

?>
