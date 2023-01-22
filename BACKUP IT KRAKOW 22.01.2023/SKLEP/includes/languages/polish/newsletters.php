<?php
/*

Last Update: 08/03/2005
Original Author(s): Harald Ponce de Leon (hpdl@theexchangeproject.org)
*/
define('TABLE_HEADING_NEW_PRODUCTS', 'Nowo�ci %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Zapowiedzi');
define('TABLE_HEADING_DATE_EXPECTED', 'Data wprowadzenia');
define('TEXT_NO_PRODUCTS', 'Nie ma produkt�w w tej kategorii.');
define('NAVBAR_TITLE_1', 'Newsletter');
define('NAVBAR_TITLE', 'Newsletter');
define('HEADING_TITLE', 'Newsletter - Rejestracja');

define('TEXT_INFORMATION', '<b>Dzi�kujemy za subskrybcje naszego newslettera.</b><br>Email z potwierdzeniem zostanie wys�any na wskazany adres.');

define('TOP_BAR_TITLE', STORE_NAME . 'Newsletter');

define('TOP_BAR_SUCCESS', '<I>Thank you ! You are now subscribed</I> to our Newsletter based on your selection.<BR><BR><B>An email will be sent to the address you entered</I> in order to <B>confirm your registration</B> and to validate that the address is correct. <BR><BR>this email will contain as well all instructions if you wanted to unsubscribe in the future. <BR><BR> You may review as well the archives of the <B>past newsletters</B> in acrobat format at the bottom on the Section "Newsletters" of our site. <BR><BR>If you would like to <B>contribute or write an article</B> for one of our newsletters , do not hesitate to contact us . You can as well <B>use the online form in order to submit your article and pictures</B>. (The newsletter online form link is located in the section Newsletter of our site).<BR><BR>All photo credits and name of the author will of course be mentionned in our newsletter. <BR><BR> Your article will be as well stored in our Knowledge base in order to be searched by visitors.');

define('TOP_BAR_EXPLAIN', STORE_NAME . ' is dedicated to bring you sound advices and tips about <I>your site</I>, <I>special offers</I> or <I>new products</I>.<BR>If you are looking for tips and new ideas. Our newsletter is full of useful information. Just enter your e-mail address below and we will add you to our list.<BR><BR>)');

define('TOP_BAR_EXPLAIN1', ' * Note: All our newsletters are in Acrobat Format. You can download the newsletter from our archive area. Acrobat is free to download from the Adobe web site (http://www.adobe.com).<BR><BR>');

define('EMAIL_WELCOME_SUBJECT', 'Witamy w ' . STORE_NAME . '!');

define('EMAIL_WELCOME1', 'Witamy w ' . STORE_NAME . '! You will now receive on a monthly basis our newsletter.' . "\n" . '* If you would like to contribute or write an article for one of our newsletters, do not hesitate to contact us.' . "\n\n" . 'For help with any of our online services, please email our Customer Service Center : ' . HTTP_SERVER . DIR_WS_CATALOG . 'customer_service.php' . "\n\n" . 'We are happy to have you as a member of our community. Privacy is important to us; therefore, we will not sell, rent, or give away your name or address to anyone. At any point, you can select the link at the bottom of every email to unsubscribe, or to receive less or more information.' . "\n\n" . 'Thanks again for registering, and please visit ' . STORE_NAME . ' soon! If you have any questions or comments, feel free to contact us.' . '"\n\n"');

define('EMAIL_WELCOME', '*** Witamy w Newsletterze ' . STORE_NAME . ' ***' . "\n\n" . 'Ta wiadomo�� potwierdza, �e twoje zg�oszenie zosta�o przetworzone i jeste� zapisany do naszego newslettera' . "\n\n" . 'INFO: Ten adres email zosta� podany podczas procesu rejestracji. Je�eli to nie ty zapisywa�e� si� do newslettera ' . STORE_NAME . ' , mo�esz na ko�cu tej wiadomo�ci klikn�� link wypisuj�cy ci� z tego newslettera.');

define('CLOSING_BLOCK1', '');
define('CLOSING_BLOCK2', '');

define('CLOSING_BLOCK3', "\n\n" . 'Sprawd� nasz� polityk� prywatno�ci : ' . HTTP_SERVER . DIR_WS_CATALOG . 'information.php?info_id=2' . '.');
define('UNSUBSCRIBE', "\n\n" . 'Aby si� wypisa� wejd� na :' ."\n". HTTP_SERVER . DIR_WS_CATALOG . 'newsletters_unsubscribe.php?action=view&email=');

define('TEXT_ORIGIN_LOGIN', '<font color="#FF0000"><small><b>Uwaga:</b></font></small>Rejestracja, w celu otrzymywania naszego newslettera jest procesem innym ni� rejestracja podczas sk�adania zam�wienia. Aby otrzymywa� nasz newsletter wystarczy, �e podasz swoje imi� i nazwisko + kraj. (Jednak nie b�dziesz m�gl sk�ada� zam�wie� ani �ledzi� przesy�ek dop�ki nie dokonasz pe�nej rejestracji.)</font>');
define('TEXT_ORIGIN_LOGIN1', '<font color="#FF0000"><small><b>Informacja:</b></font></small>' . STORE_NAME . ' szanuje twoj� prywatni��. Nigdy nie odsprzedajemy, ani nie ujawniamy osobom niepowo�anym informacji zawartych w procesie rejestracji : przeczytaj polityk� prywatno�ci w celu uzyskania szczg�owych informacji.</font>');

define('EMAIL_GREET_MR', 'Witaj ');
define('EMAIL_GREET_MS', 'Witaj ');
define('EMAIL_GREET_NONE', 'Witaj ');

define('TEXT_EMAIL', 'E-Mail');
define('TEXT_EMAIL_FORMAT', 'Format:');
define('TEXT_GENDER', 'P�e�:');
define('TEXT_FIRST_NAME', 'Imi�:');
define('TEXT_LAST_NAME', 'Nazwisko:');
define('TEXT_ZIP_INFO', '');
define('TEXT_ZIP_CODE', 'Kod pocztowy:');
define('TEXT_ORIGIN_EXPLAIN_BOTTOM', '');
define('TEXT_ORIGIN_EXPLAIN_TOP', '');
define('TEXT_EMAIL_HTML', 'HTML');
define('TEXT_EMAIL_TXT', 'tekst');
define('TEXT_GENDER_MR', 'm�czyzna');
define('TEXT_GENDER_MRS', 'kobieta');
?>