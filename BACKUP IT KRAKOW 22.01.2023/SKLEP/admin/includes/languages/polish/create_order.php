<?php
/*
  $Id: create_order.php,v 1 2003/08/17 23:21:34 frankl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
  
*/
// EXAMPLE TO MAKE REQUIRED VISIBLE
// define('ENTRY_STREET_ADDRESS_TEXT', '&nbsp;<small><font color="#AABBDD">required</font></small>');

// ### END ORDER MAKER ###
// pull down default text
define('PULL_DOWN_DEFAULT', 'Wybierz');
define('TYPE_BELOW', 'Type Below');

define('JS_ERROR', 'Errors have occured during the process of your form!\nPlease make the following corrections:\n\n');

define('JS_GENDER', '* The \'Gender\' value must be chosen.\n');
define('JS_FIRST_NAME', '* The \'First Name\' entry must have at least ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' characters.\n');
define('JS_LAST_NAME', '* The \'Last Name\' entry must have at least ' . ENTRY_LAST_NAME_MIN_LENGTH . ' characters.\n');
define('JS_DOB', '* The \'Date of Birth\' entry must be in the format: xx/xx/xxxx (month/day/year).\n');
define('JS_EMAIL_ADDRESS', '* The \'E-Mail Address\' entry must have at least ' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' characters.\n');
define('JS_ADDRESS', '* The \'Street Address\' entry must have at least ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' characters.\n');
define('JS_POST_CODE', '* The \'Post Code\' entry must have at least ' . ENTRY_POSTCODE_MIN_LENGTH . ' characters.\n');
define('JS_CITY', '* The \'Suburb\' entry must have at least ' . ENTRY_CITY_MIN_LENGTH . ' characters.\n');
define('JS_STATE', '* The \'State\' entry must be selected.\n');
define('JS_STATE_SELECT', '-- Select Above --');
define('JS_ZONE', '* The \'State\' entry must be selected from the list for this country.\n');
define('JS_COUNTRY', '* The \'Country\' entry must be selected.\n');
define('JS_TELEPHONE', '* The \'Telephone Number\' entry must have at least ' . ENTRY_TELEPHONE_MIN_LENGTH . ' characters.\n');
define('JS_PASSWORD', '* The \'Password\' and \'Confirmation\' entries must match and have at least ' . ENTRY_PASSWORD_MIN_LENGTH . ' characters.\n');

define('CATEGORY_COMPANY', 'Company Details');
define('CATEGORY_PERSONAL', 'Personal Details');
define('CATEGORY_ADDRESS', 'Address');
define('CATEGORY_CONTACT', 'Contact Information');
define('CATEGORY_OPTIONS', 'Options');
define('CATEGORY_PASSWORD', 'Password');
define('CATEGORY_CORRECT', 'Je?eli dane klienta s? poprawne, kliknij w przycisk pod formularzem.');
define('ENTRY_CUSTOMERS_ID', 'ID:');
define('ENTRY_CUSTOMERS_ID_TEXT', '&nbsp;');
define('ENTRY_COMPANY', 'Company Name:');
define('ENTRY_COMPANY_ERROR', '');
define('ENTRY_COMPANY_TEXT', '');
define('ENTRY_GENDER', 'Gender:');
define('ENTRY_GENDER_ERROR', '&nbsp;');
define('ENTRY_GENDER_TEXT', '&nbsp;');
define('ENTRY_FIRST_NAME', 'First Name:');
define('ENTRY_FIRST_NAME_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_FIRST_NAME_TEXT', '&nbsp;');
define('ENTRY_LAST_NAME', 'Last Name:');
define('ENTRY_LAST_NAME_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_LAST_NAME_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_LAST_NAME_TEXT', '&nbsp;');
define('ENTRY_DATE_OF_BIRTH', 'Date of Birth:');
define('ENTRY_DATE_OF_BIRTH_ERROR', '&nbsp;<small><font color="#FF0000">(eg. 05/21/1970)</font></small>');
define('ENTRY_DATE_OF_BIRTH_TEXT', '&nbsp;<small>(eg. 05/21/1970) ');
define('ENTRY_EMAIL_ADDRESS', 'E-Mail Address:');
define('ENTRY_EMAIL_ADDRESS_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_EMAIL_ADDRESS_CHECK_ERROR', '&nbsp;<small><font color="#FF0000">Your email address doesn\'t appear to be valid!</font></small>');
define('ENTRY_EMAIL_ADDRESS_ERROR_EXISTS', '&nbsp;<small><font color="#FF0000">email address already exists!</font></small>');
define('ENTRY_EMAIL_ADDRESS_TEXT', '&nbsp;');
define('ENTRY_STREET_ADDRESS', 'Street Address:');
define('ENTRY_STREET_ADDRESS_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_STREET_ADDRESS_TEXT', '&nbsp;');
define('ENTRY_SUBURB', 'Suburb:');
define('ENTRY_SUBURB_ERROR', '');
define('ENTRY_SUBURB_TEXT', '');
define('ENTRY_POST_CODE', 'Post Code:');
define('ENTRY_POST_CODE_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_POSTCODE_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_POST_CODE_TEXT', '&nbsp;');
define('ENTRY_CITY', 'Suburb:');
define('ENTRY_CITY_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_CITY_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_CITY_TEXT', '&nbsp;');
define('ENTRY_STATE', 'Wojew?dztwo:');
define('ENTRY_STATE_ERROR', '&nbsp;');
define('ENTRY_STATE_TEXT', '&nbsp;');
define('ENTRY_COUNTRY', 'Kraj:');
define('ENTRY_COUNTRY_ERROR', '');
define('ENTRY_COUNTRY_TEXT', '&nbsp;');
define('ENTRY_TELEPHONE_NUMBER', 'Telefon:');
define('ENTRY_TELEPHONE_NUMBER_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_TELEPHONE_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_TELEPHONE_NUMBER_TEXT', '&nbsp;');
define('ENTRY_FAX_NUMBER', 'Fax:');
define('ENTRY_FAX_NUMBER_ERROR', '');
define('ENTRY_FAX_NUMBER_TEXT', '');
define('ENTRY_CELL_NUMBER', 'Telefon kom?rkowy:');
define('ENTRY_CELL_NUMBER_ERROR', '');
define('ENTRY_CELL_NUMBER_TEXT', '');
define('ENTRY_NEWSLETTER', 'Newsletter:');
define('ENTRY_NEWSLETTER_TEXT', '');
define('ENTRY_NEWSLETTER_YES', 'Subskrybuj');
define('ENTRY_NEWSLETTER_NO', 'Unsubscribed');
define('ENTRY_NEWSLETTER_ERROR', '');
define('ENTRY_PASSWORD', 'Password:');
define('ENTRY_PASSWORD_CONFIRMATION', 'Password Confirmation:');
define('ENTRY_PASSWORD_CONFIRMATION_TEXT', '&nbsp;');
define('ENTRY_PASSWORD_ERROR', '&nbsp;<small><font color="#FF0000">min ' . ENTRY_PASSWORD_MIN_LENGTH . ' chars</font></small>');
define('ENTRY_PASSWORD_TEXT', '&nbsp;');
define('PASSWORD_HIDDEN', '--HIDDEN--');
// ### END ORDER MAKER ###




define('HEADING_TITLE', 'Sk?adanie zam?wienia - krok po kroku');
define('HEADING_CREATE', 'Potwierd? dane klienta:'); 

define('TEXT_SELECT_CUST', 'Wybierz klienta:'); 
define('TEXT_SELECT_CURRENCY', 'Waluta');
define('BUTTON_TEXT_SELECT_CUST', 'U?yj danych klienta:'); 
define('TEXT_OR_BY', 'lub podaj jego ID:'); 
define('TEXT_STEP_1', 'Krok 1 - Wybierz klienta i potwierd? jego dane');
define('BUTTON_SUBMIT', 'potwierd?');
define('ENTRY_CURRENCY','Wyb?r waluty');
define('ENTRY_ADMIN','Zam?wienie stworzone przez:');
define('TEXT_CS','Obs?uga klienta');
?>