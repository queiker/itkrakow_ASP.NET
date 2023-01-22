-- phpMyAdmin SQL Dump
-- version 2.8.2.4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Czas wygenerowania: 15 Mar 2010, 17:44
-- Wersja serwera: 5.1.34
-- Wersja PHP: 5.2.12
-- 
-- Baza danych: `comfort.2.4`
-- 

-- --------------------------------------------------------

ALTER TABLE  `customers` ADD  `customers_cell` VARCHAR( 64 ) NULL ,
ADD  `customers_sms_notify` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `orders` ADD  `shipping_module` VARCHAR( 255 ) NULL ,
ADD  `customer_service_id` VARCHAR( 15 ) NULL ;

INSERT INTO  `admin_files` (  `admin_files_id` ,  `admin_files_name` ,  `admin_files_is_boxes` ,  `admin_files_to_boxes` ,  `admin_groups_id` ) 
VALUES
(NULL ,  'edit_orders_add_product.php',  '0',  '3',  '1'),
(NULL ,  'edit_orders_ajax.php',  '0',  '3',  '1');

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES 
('', 'Pokazuj list� rozwijan� opcji p�atno�ci ?', 'ORDER_EDITOR_PAYMENT_DROPDOWN', 'true', '<b>true:</b> Edytor mo�liwe opcje p�atno�ci wy�wietli jako list� rozwijan�. Je�li <b>false:</b> b�dzie to pole typu input.', 72, 1, '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
('', 'U�yj cen z modu�u SPPC ?', 'ORDER_EDITOR_USE_SPPC', 'false', 'W wersji Mysklep Comfort nale�y t� opcj� pozostawi� na false.', 72, 3, '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
('', 'U�ywaj technologii Ajax do aktualizacji informacji w zam�wieniu?', 'ORDER_EDITOR_USE_AJAX', 'true', 'Nale�y opcj� t� ustawi� na <b>false</b> je�eli obs�uga sklepu korzysta z przegl�darki z wy��czon� lub niedost�pn� obs�ug� JavaScript.', 72, 4, '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
('', 'Wybierz opcj� p�atno�ci dla Kart kredytowych', 'ORDER_EDITOR_CREDIT_CARD', 'Other', 'Edytor zam�wie� wy�wietli dodatkowe pola dla danych karty kredytowej, je�li ta opcja p�atno�ci zostanie wybrana.', 72, 5, '2009-10-02 14:29:28', '2009-10-02 14:13:39', NULL, 'tep_cfg_pull_down_payment_methods('),