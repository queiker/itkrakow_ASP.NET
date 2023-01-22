# osCommerce, Open Source E-Commerce Solutions
# http://www.oscommerce.com
#
# Database Backup For TUTAJ wpisz nazw� sklepu
# Copyright (c) 2010 TUTAJ wpisz dane w�a�ciciela sklepu
#
# Database: abtest_comfort25
# Database Server: localhost
#
# Backup Date: 08/11/2010 11:46:38

drop table if exists additional_images;
create table additional_images (
  additional_images_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  images_description varchar(64) ,
  popup_images varchar(64) ,
  PRIMARY KEY (additional_images_id),
  KEY products_id (products_id)
);

insert into additional_images (additional_images_id, products_id, images_description, popup_images) values ('1', '1', 'ASUS F3SC-AS265E', 'rnasu712h03.jpg');
drop table if exists address_book;
create table address_book (
  address_book_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  entry_gender char(1) not null ,
  entry_company varchar(96) ,
  entry_nip varchar(32) ,
  entry_firstname varchar(32) not null ,
  entry_lastname varchar(32) not null ,
  entry_street_address varchar(64) not null ,
  entry_street_address_dom varchar(10) not null ,
  entry_street_address_mieszkanie varchar(6) ,
  entry_suburb varchar(32) ,
  entry_postcode varchar(10) not null ,
  entry_city varchar(32) not null ,
  entry_state varchar(32) ,
  entry_country_id int(11) default '0' not null ,
  entry_zone_id int(11) default '0' not null ,
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
);

drop table if exists address_format;
create table address_format (
  address_format_id int(11) not null auto_increment,
  address_format varchar(128) not null ,
  address_summary varchar(48) not null ,
  PRIMARY KEY (address_format_id)
);

insert into address_format (address_format_id, address_format, address_summary) values ('1', '$firstname $lastname$cr$streets$cr$postcode $city$cr$statecomma$country', '$city / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('2', '$firstname $lastname$cr$streets$cr$postcode $city$cr$state, $country', '$city, $state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode -$statecomma$country', '$state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
drop table if exists admin;
create table admin (
  admin_id int(11) not null auto_increment,
  admin_groups_id int(11) ,
  admin_firstname varchar(32) not null ,
  admin_lastname varchar(32) ,
  admin_email_address varchar(96) not null ,
  admin_password varchar(40) not null ,
  admin_created datetime ,
  admin_modified datetime default '0000-00-00 00:00:00' not null ,
  admin_logdate datetime ,
  admin_lognum int(11) default '0' not null ,
  PRIMARY KEY (admin_id),
  UNIQUE admin_email_address (admin_email_address)
);

insert into admin (admin_id, admin_groups_id, admin_firstname, admin_lastname, admin_email_address, admin_password, admin_created, admin_modified, admin_logdate, admin_lognum) values ('1', '1', 'Mysklep', 'Admin', 'admin@mysklep.pl', 'af83994fee86aed854f32d7752d7ac36:7f', '2007-10-16 19:00:00', '2007-10-16 19:00:00', '2010-11-08 11:40:45', '16');
drop table if exists admin_files;
create table admin_files (
  admin_files_id int(11) not null auto_increment,
  admin_files_name varchar(64) not null ,
  admin_files_is_boxes tinyint(5) default '0' not null ,
  admin_files_to_boxes int(11) default '0' not null ,
  admin_groups_id set('1','4') default '1' not null ,
  PRIMARY KEY (admin_files_id)
);

insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('1', 'administrator.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('2', 'configuration.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('3', 'catalog.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('4', 'modules.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('5', 'customers.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('6', 'taxes.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('7', 'localization.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('8', 'reports.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('54', 'newsletters.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('10', 'admin_members.php', '0', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('11', 'admin_files.php', '0', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('12', 'configuration.php', '0', '2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('13', 'categories.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('14', 'products_attributes.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('15', 'manufacturers.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('16', 'reviews.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('17', 'specials.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('18', 'products_expected.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('19', 'modules.php', '0', '4', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('20', 'customers.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('21', 'orders.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('22', 'countries.php', '0', '6', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('23', 'zones.php', '0', '6', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('24', 'geo_zones.php', '0', '6', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('25', 'tax_classes.php', '0', '6', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('26', 'tax_rates.php', '0', '6', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('27', 'currencies.php', '0', '7', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('28', 'languages.php', '0', '7', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('29', 'orders_status.php', '0', '7', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('30', 'stats_products_viewed.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('31', 'stats_products_purchased.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('32', 'stats_customers.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('53', 'mail.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('51', 'cache.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('49', 'banner_statistics.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('48', 'banner_manager.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('47', 'backup.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('46', 'tools.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('44', 'easypopulate.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('64', 'define_mainpage.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('55', 'server_info.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('56', 'whos_online.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('57', 'featured.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('58', 'information.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('59', 'information_form.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('60', 'information_list.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('61', 'information_manager.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('63', 'easypopulate_functions.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('66', 'product_updates.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('67', 'information_preview.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('68', 'stats_low_stock.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('73', 'customer_stats.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('74', 'orders_tracking.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('75', 'orders_tracking_zones.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('76', 'customers_groups.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('77', 'manudiscount.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('78', 'admin_notes.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('79', 'admin_notes_help.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('80', 'edit_orders.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('81', 'napraw_produkty.php', '0', '46', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('82', 'product_extra_fields.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('83', 'specialsbycategory.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('84', 'quick_updates.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('85', 'customers_advanced.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('87', 'ship2pay.php', '0', '4', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('88', 'produkty_powiazane.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('89', 'stats_wishlists.php', '0', '8', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('90', 'wsparcie.php', '1', '0', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('91', 'newsdesk.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('92', 'newsdesk_configuration.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('93', 'newsdesk_reviews.php', '0', '58', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('94', 'create_account_process.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('95', 'create_account_success.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('96', 'create_order.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('97', 'create_order_process.php', '0', '5', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('98', 'edit_orders_add_product.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('99', 'edit_orders_ajax.php', '0', '3', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id) values ('100', 'create_account.php', '0', '5', '1');
drop table if exists admin_groups;
create table admin_groups (
  admin_groups_id int(11) not null auto_increment,
  admin_groups_name varchar(64) ,
  PRIMARY KEY (admin_groups_id),
  UNIQUE admin_groups_name (admin_groups_name)
);

insert into admin_groups (admin_groups_id, admin_groups_name) values ('1', 'Top Administrator');
drop table if exists admin_notes;
create table admin_notes (
  contr_id int(11) not null auto_increment,
  admin_note varchar(255) not null ,
  config_comments longtext ,
  category varchar(40) not null ,
  status tinyint(1) default '2' not null ,
  date_status_change datetime default '0000-00-00 00:00:00' not null ,
  note_created datetime default '0000-00-00 00:00:00' not null ,
  contr_last_modified datetime default '0000-00-00 00:00:00' not null ,
  last_update varchar(10) ,
  KEY config_id (contr_id)
);

insert into admin_notes (contr_id, admin_note, config_comments, category, status, date_status_change, note_created, contr_last_modified, last_update) values ('2', 'Notatki Admina', '�yczymy udanej i owocnej pracy oraz wielu sukces�w w sprzeda�y.', 'Og�lne Notatki', '0', '2005-11-13 23:52:58', '2005-11-13 23:10:32', '2007-10-16 17:48:40', '');
drop table if exists admin_notes_type;
create table admin_notes_type (
  type_id int(11) default '0' not null ,
  type_name varchar(40) not null ,
  status tinyint(1) default '0' not null 
);

insert into admin_notes_type (type_id, type_name, status) values ('1', 'Administracja', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Konfiguracja', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Modu�y Sklepowe', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Klienci', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Rabaty', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Og�lne Notatki', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Go�cie', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'P�atno�ci', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Produkty', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Sprzeda�e', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Dostawa', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Dostawcy', '1');
insert into admin_notes_type (type_id, type_name, status) values ('1', 'Inne', '1');
drop table if exists banners;
create table banners (
  banners_id int(11) not null auto_increment,
  banners_title varchar(64) not null ,
  banners_url varchar(255) not null ,
  banners_image varchar(64) not null ,
  banners_group varchar(64) not null ,
  banners_html_text text ,
  expires_impressions int(7) default '0' ,
  expires_date datetime ,
  date_scheduled datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (banners_id)
);

insert into banners (banners_id, banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) values ('2', 'nag�owek pomara�czowy', '#', 'pomaranczowy.jpg', 'naglowek_standard', '', '0', NULL, NULL, '2010-01-04 16:11:08', NULL, '1');
insert into banners (banners_id, banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) values ('3', 'nag��wek niebieski', '', 'niebieski.jpg', 'naglowek_niebieski', '', '0', NULL, NULL, '2010-01-04 16:11:40', NULL, '1');
insert into banners (banners_id, banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) values ('4', 'aglowek r�owy', '', 'rozowy.jpg', 'naglowek_rozowy', '', '0', NULL, NULL, '2010-01-04 20:06:55', NULL, '1');
drop table if exists banners_history;
create table banners_history (
  banners_history_id int(11) not null auto_increment,
  banners_id int(11) default '0' not null ,
  banners_shown int(5) default '0' not null ,
  banners_clicked int(5) default '0' not null ,
  banners_history_date datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (banners_history_id)
);

insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('4', '2', '96', '21', '2010-01-04 16:13:59');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('3', '3', '82', '18', '2010-01-04 16:11:48');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('5', '4', '173', '0', '2010-01-04 20:07:06');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('6', '4', '29', '0', '2010-01-05 09:23:03');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('7', '2', '42', '0', '2010-01-05 09:23:42');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('8', '3', '4', '0', '2010-01-05 09:24:13');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('9', '3', '1', '0', '2010-01-06 09:29:42');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('10', '2', '1', '0', '2010-01-06 09:32:01');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('11', '2', '1', '0', '2010-11-08 11:39:50');
drop table if exists cache;
create table cache (
  cache_id varchar(32) not null ,
  cache_language_id tinyint(1) default '0' not null ,
  cache_name varchar(255) not null ,
  cache_data mediumtext not null ,
  cache_global tinyint(1) default '1' not null ,
  cache_gzip tinyint(1) default '1' not null ,
  cache_method varchar(20) default 'RETURN' not null ,
  cache_date datetime default '0000-00-00 00:00:00' not null ,
  cache_expires datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (cache_id, cache_language_id),
  KEY cache_id (cache_id),
  KEY cache_language_id (cache_language_id),
  KEY cache_global (cache_global)
);

drop table if exists categories;
create table categories (
  categories_id int(11) not null auto_increment,
  categories_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id),
  KEY sort_order (sort_order)
);

insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('1', '', '0', '1', '2007-10-16 18:12:10', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('2', '', '0', '2', '2007-10-16 18:37:39', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('3', '', '2', '1', '2007-10-16 18:38:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('4', '', '2', '2', '2007-10-16 18:45:13', NULL);
drop table if exists categories_description;
create table categories_description (
  categories_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  categories_name varchar(48) not null ,
  categories_heading_title varchar(64) ,
  categories_description text ,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

insert into categories_description (categories_id, language_id, categories_name, categories_heading_title, categories_description) values ('1', '4', 'Notebooki', 'Notebooki', '<strong>Rewolucja w mobilnej rozrywce</strong> - procesor mobilny Intel Centrino Duo w F3Sc to gwarancja najwy�szych osi�g&oacute;w w�r&oacute;d komputer&oacute;w przeno�nych, nowych funkcji zwi�zanych ze standardem HD i d�u�szego czasu pracy na bateriach.<br /><br /><strong>Dwa rdzenie, podw&oacute;jna moc </strong><br />Dzi�ki wyposa�eniu w najnowsze procesory dwurdzeniowe, notebooki z serii ASUS F3Sc daj� Ci jeszcze wi�ksze mo�liwo�ci podczas wykonywania kilku zada� jednocze�nie, np. obr&oacute;bki cyfrowego d�wi�ku i obrazu wideo, gier, rozm&oacute;w przy u�yciu komunikatora internetowego czy przegl�dania stron WWW. Moc dw&oacute;ch rdzeni sprawia, �e zarz�dzanie multimediami czy praca w najbardziej wymagaj�cych aplikacjach jeszcze nigdy nie by�y tak przyjemne.');
insert into categories_description (categories_id, language_id, categories_name, categories_heading_title, categories_description) values ('2', '4', 'Akcesoria', 'Akcesoria', '');
insert into categories_description (categories_id, language_id, categories_name, categories_heading_title, categories_description) values ('3', '4', 'S�uchawki', 'S�uchawki', '');
insert into categories_description (categories_id, language_id, categories_name, categories_heading_title, categories_description) values ('4', '4', 'Myszki', 'Myszki', '');
drop table if exists configuration;
create table configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(255) not null ,
  configuration_key varchar(255) not null ,
  configuration_value varchar(255) not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) default '0' not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  use_function varchar(255) ,
  set_function varchar(255) ,
  PRIMARY KEY (configuration_id),
  KEY configuration_key (configuration_key)
);

insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1', 'Nazwa sklepu', 'STORE_NAME', 'TUTAJ wpisz nazw� sklepu', 'Nazwa Twojego sklepu', '1', '1', '2007-10-16 18:42:41', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2', 'W�a�ciciel sklepu', 'STORE_OWNER', 'TUTAJ wpisz dane w�a�ciciela sklepu', 'Nazwisko i imi� w�a�ciela sklepu lub nazwa firmy', '1', '2', '2007-10-16 17:21:27', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3', 'Adres e-mail w�a�ciciela sklepu', 'STORE_OWNER_EMAIL_ADDRESS', 'TUTAJ wpisz adres e-mail administratora sklepu', 'Adres e-mail w�a�ciciela sklepu', '1', '3', '2007-10-16 17:22:38', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('4', 'E-mail OD', 'EMAIL_FROM', 'TUTAJ wpisz adres e-mail do kontakt�w z twoich klient�w', 'E-mail u�ywany w korespondencji z klientami sklepu (u�ywany przy rejestracji, potwierdzeniach zam�wie�)', '1', '4', '2007-10-16 17:23:33', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('5', 'Kraj', 'STORE_COUNTRY', '170', 'Kraj w kt�rym znajduje si� sklep <br><br><b>Uwaga: Pami�taj aby r�wnie� wybra� wojew�dztwo.</b>', '1', '6', '2004-09-19 01:31:17', '2003-07-17 05:51:54', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('6', 'Wojew�dztwo', 'STORE_ZONE', '187', 'Wojew�dztwo, w kt�rym znajduje si� sklep', '1', '7', '2005-04-12 10:47:23', '2003-07-17 05:51:54', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('7', 'Kolejno�� sortowania produkt�w oczekiwanych', 'EXPECTED_PRODUCTS_SORT', 'desc', 'Mo�e przyjmowa� warto�ci rosn�co (asc) lub malej�co (desc).', '1', '8', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('8', 'Pole sortowania produkt�w oczekiwanych', 'EXPECTED_PRODUCTS_FIELD', 'products_name', 'Mo�e sortowa� dane wg pola Nazwa produktu (products_name) lub Oczekiwana data wprowadzenia (date_expected).', '1', '9', '2005-03-17 12:30:19', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('9', 'Prze��cz na walut� j�zyka', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'true', 'Automatycznie zmienia walut� wraz ze zmian� j�zyka interfejsu - pole typu prawda(true)/fa�sz(false).', '1', '10', '2003-07-17 07:12:42', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('10', 'Wy�lij dodatkowe e-maile z zam�wieniem DO', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Podaj e-mail - lub kilka e-maili (oddzielone przecinkami), np. Magazyn <magazyn@sklep.pl>, Pakowalnia <pakowalnia@sklep.pl> itd.', '1', '11', '2005-04-02 10:19:33', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('11', 'U�ywaj bezpiecznych link�w dla wyszukiwarek (w trakcie test�w)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Gdy uruchomisz t� us�ug� (true) linki w osC b�d� prezentowane w spos�b przyjazny dla takich wyszukiwarek.', '1', '12', '2005-03-19 12:39:45', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('12', 'Poka� koszyk po dodaniu produktu', 'DISPLAY_CART', 'true', 'Pokazuje koszyk po ka�dorazowym dodaniu do niego produktu.', '1', '14', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('13', 'Pozw�l go�ciom powiadamia� znajomych', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'true', 'Umo�liwia (true) lub nie (false) korzystanie osobom niezalogowanym z opcji Powiadom znajomego', '1', '15', '2003-07-31 00:13:49', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('14', 'Domy�lny operator wyszukiwania', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Mo�liwe opcje to i (and) oraz albo (or) - gdy zostan� w wyszukiwarce wpisane dwa s�owa przyj�ty zostanie domy�lny operator tutaj wskazany.', '1', '17', '2005-03-17 12:31:33', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('15', 'Adres sklepu i nr telefonu', 'STORE_NAME_ADDRESS', 'TUTAJ wpisz adres sklepu', 'U�ywany kosmetycznie np. przy drukowaniu faktur oraz innych dokument�w.', '1', '18', '2007-10-16 17:24:37', '2003-07-17 05:51:54', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('16', 'Pokazuj liczebno�� kategorii', 'SHOW_COUNTS', 'false', 'Pokazuje (true) lub nie (false) rekursywnie w nawiasie obok nazwy kategorii liczb� produkt�w do niej przypisanych. Uwaga: Spowalnia dzia�anie sklepu.', '1', '19', '2005-05-06 06:21:52', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('17', 'Zaokr�glanie podatku', 'TAX_DECIMAL_PLACES', '0', 'Podaj (liczbowo) do ilu miejsc po przecinku zaokr�gla� podatek.', '1', '20', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('18', 'Pokazuj ceny z podatkiem', 'DISPLAY_PRICE_WITH_TAX', 'true', 'Innymi s�owy czy pokazywa� ceny brutto (true) czy netto (false).', '1', '21', '2005-05-06 11:37:09', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('19', 'Imi�', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimalna d�ugo�� imienia', '2', '1', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('20', 'Nazwisko', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimalna d�ugo�� nazwiska', '2', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('21', 'Data urodzenia', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimalna d�ugo�� daty urodzenia', '2', '3', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('22', 'E-mail', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimalna d�ugo�� adresu e-mail', '2', '4', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('23', 'Ulica', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimalna d�ugo�� nazwy ulicy i nr domu', '2', '5', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('24', 'Firma', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimalna d�ugo�� nazwy firmy', '2', '6', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('25', 'Kod pocztowy', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimalna d�ugo�� kodu pocztowego', '2', '7', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('26', 'Miasto', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimalna d�ugo�� nazwy miasta', '2', '8', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('27', 'Wojew�dztwo', 'ENTRY_STATE_MIN_LENGTH', '7', 'Minimalna d�ugo�� nazwy wojew�dztwa', '2', '9', '2003-07-17 13:32:31', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('28', 'Telefon', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimalna d�ugo�� nr telefonu', '2', '10', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('29', 'Has�o', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimalna d�ugo�� has�a', '2', '11', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('30', 'Nazwisko w�a�ciciela karty kredytowej', 'CC_OWNER_MIN_LENGTH', '3', 'Minimalna d�ugo�� nazwiska w�a�ciciela karty kredytowej', '2', '12', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('31', 'Nr karty kredytowej', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimalna d�ugo�� nr karty kredytowej', '2', '13', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('32', 'Tekst recenzji', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimalna d�ugo�� tekstu recenzji', '2', '14', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('33', 'Bestsellery', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimalna ilo�� bestseller�w, kt�re zostan� wy�wietlone w sklepie', '2', '15', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('34', 'R�wnie� zam�wione', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimalna ilo�� produkt�w, kt�re zostan� wy�wietlone w boxie  \'Klienci kt�rzy zam�wili ten produkt kupili r�wnie�\'', '2', '16', '2005-04-08 21:36:44', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('35', 'Ilo�� wpis�w w ksi��ce adresowej', 'MAX_ADDRESS_BOOK_ENTRIES', '3', 'Maksymalna ilo�� wpis�w w ksi��ce adresowej', '3', '1', '2005-04-09 22:40:48', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('36', 'Wynik wyszukiwania', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Ilo�� produkt�w, kt�ra zostanie wy�wietlona w wyniku wyszukiwania', '3', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('37', 'Liczba stron trafie�', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Gdy wyszukiwarka znajdzie wi�cej trafie� ni� wpisano w polu Wynik wyszukiwania pokazuje je na kolejnych stronach - ilo�� stron ustalasz w�a�nie w tym miejscu', '3', '3', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('38', 'Promocje', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maksymalna ilo�� produkt�w w cenach promocyjnych, kt�re zostan� wy�wietlone w sklepie', '3', '4', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('39', 'Modu� nowych produkt�w', 'MAX_DISPLAY_NEW_PRODUCTS', '3', 'Maksymalna ilo�� nowych produkt�w, kt�re zostan� pokazane w ka�dej kategorii', '3', '5', '2005-04-09 22:40:36', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('40', 'Produkty oczekiwane', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '3', 'Maksymalna ilo�� produkt�w oczekiwanych, kt�re zostan� wy�wietlone w sklepie', '3', '6', '2005-04-09 22:40:40', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('41', 'Lista producent�w', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '1', 'Je�eli ilo�� producent�w przekroczy wprowadzon� tutaj liczb�, pokazana zostanie lista rozwijalna', '3', '7', '2005-06-16 13:22:22', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('42', 'Rozmiar pola wyboru producenta', 'MAX_MANUFACTURERS_LIST', '1', 'Je�eli warto�� tego pola to 1, wtedy lista producent�w prezentowana jest jako lista rozwijalna. Je�eli warto�� pola jest wi�ksza ni� 1, u�ywana jest lista wyboru o zadanym rozmiarze.', '3', '7', '2005-06-16 13:22:12', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('43', 'D�ugo�� nazwy producenta', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '18', 'Je�eli nazwa przekroczy wskazany rozmiar zobaczysz dwie kropki (np. Micro.. przy ustawieniu 5)', '3', '8', '2005-04-12 10:50:08', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('44', 'Nowe recenzje', 'MAX_DISPLAY_NEW_REVIEWS', '1', 'Maksymalna ilo�� nowych recenzji, kt�re zostan� wy�wietlone w sklepie', '3', '9', '2005-03-18 21:36:10', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('45', 'Wyb�r losowej recenzji', 'MAX_RANDOM_SELECT_REVIEWS', '3', 'Liczba rekord�w z po�r�d kt�rych ma zosta� wylosowana losowa recenzja do wy�wietlenia w boxie', '3', '10', '2005-04-09 22:39:39', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('46', 'Wyb�r losowego nowego produktu', 'MAX_RANDOM_SELECT_NEW', '3', 'Jak wy�ej', '3', '11', '2005-04-09 22:39:26', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('47', 'Wyb�r losowej promocji', 'MAX_RANDOM_SELECT_SPECIALS', '4', 'Jak wy�ej', '3', '12', '2007-06-30 18:14:23', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('48', 'Liczba kategorii w jednym wierszu', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '2', 'Ile wy�wietli� kategorii w pojedy�czym wierszu', '3', '13', '2007-07-02 14:59:32', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('49', 'Liczba nowych produkt�w w wykazach produkt�w', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maksymalna ilo�� nowych produkt�w w wykazach', '3', '14', '2005-04-09 22:38:18', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('50', 'Bestsellery', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maksymalna ilo�� bestseller�w, kt�ra zostanie wy�wietlona w sklepie', '3', '15', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('51', 'R�wnie� zam�wione', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maksymalna ilo�� produkt�w, kt�re zostan� wy�wietlone w boxie  \'Klienci kt�rzy zam�wili ten produkt kupili r�wnie�\'', '3', '16', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('52', 'Box historia zam�wie�', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Liczba produkt�w wy�wietlana w boxie Historia zam�wie�', '3', '17', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('53', 'Historia zam�wie�', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Liczba zam�wie� wy�wietlana na jednej stronie', '3', '18', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('54', 'Szeroko�� miniaturki', 'SMALL_IMAGE_WIDTH', '100', 'Szeroko�� miniaturki w pixelach', '4', '1', '2005-04-27 18:46:35', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('55', 'Wysoko�� miniaturki', 'SMALL_IMAGE_HEIGHT', '100', 'Wysoko�� miniaturki w pixelach (obrazek b�dzie skalowany do najbli�szej wsp�lnej wieko�ci, dzi�ki temu wszystkie miniaturki b�d� mia�y zbli�one wymiary)', '4', '2', '2005-04-27 18:46:32', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('56', 'Szeroko�� obrazk�w nag��wkowych', 'HEADING_IMAGE_WIDTH', '75', '', '4', '3', '2007-06-20 16:48:24', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('57', 'Wysoko�� obrazk�w nag�owkowych', 'HEADING_IMAGE_HEIGHT', '75', '', '4', '4', '2007-06-20 16:48:35', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('58', 'Szeroko�� obrazk�w podkategorii', 'SUBCATEGORY_IMAGE_WIDTH', '100', '', '4', '5', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('59', 'Wysoko�� obrazk�w podkategorii', 'SUBCATEGORY_IMAGE_HEIGHT', '57', '', '4', '6', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('60', 'Przelicz rozmiar obrazka', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Prawda (true) je�eli maj� by� zachowane proporcje pomi�dzy miniaturk� a orygina�em lub fa�sz (false) je�eli nie', '4', '7', '2005-04-25 23:06:08', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('61', 'Czy obrazki s� wymagane', 'IMAGE_REQUIRED', 'false', 'Je�eli fa�sz (false) to w przypadku, kiedy obrazek nie istnieje nie zostanie on wy�wietlony. Je�li prawda (true) brak obrazka na stronie b�dzie widoczny w postaci pustego prostok�ta.', '4', '8', '2003-07-17 05:56:29', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('62', 'P�e�', 'ACCOUNT_GENDER', 'true', 'Pole wymagane (true) lub nie (false)', '5', '2', '2007-07-02 16:44:39', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('63', 'Data urodzenia', 'ACCOUNT_DOB', 'true', 'Pole wymagane (true) lub nie (false)', '5', '2', '2007-07-02 16:44:47', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('64', 'Firma', 'ACCOUNT_COMPANY', 'true', 'Pole wymagane (true) lub nie (false)', '5', '3', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('65', 'Dzielnica', 'ACCOUNT_SUBURB', 'true', 'Pole wymagane (true) lub nie (false)', '5', '4', '2007-07-02 16:43:52', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('66', 'Wojew�dztwo', 'ACCOUNT_STATE', 'true', 'Pole wymagane (true) lub nie (false)', '5', '5', '2005-03-17 00:37:20', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('67', 'Zainstalowane modu�y', 'MODULE_PAYMENT_INSTALLED', 'banktransfer.php;cod.php;cop.php', 'Automatycznie aktualizowana', '6', '0', '2007-10-16 17:46:19', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1017', 'Pokazuj przelew bankowy', 'MODULE_PAYMENT_BANKTRANSFER_STATUS', 'True', 'Czy chcesz w��czy� p�atno�� przelewem bankowym?', '6', '1', NULL, '2007-10-16 17:45:52', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('68', 'Zainstalowane modu�y', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'Automatycznie aktualizowana', '6', '0', '2007-10-16 17:47:43', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('69', 'Zainstalowane modu�y', 'MODULE_SHIPPING_INSTALLED', 'dp.php;dp2.php;dp3.php;intown2.php', 'Automatycznie aktualizowane', '6', '0', '2007-10-16 17:47:33', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1027', 'W��czy� p�atno�� przy odbiorze osobistym towaru', 'MODULE_PAYMENT_COP_STATUS', 'True', 'Do you want to accept Cash On Pickup payments?', '6', '1', NULL, '2007-10-16 17:46:19', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1026', 'Ustaw Status Zam�wienia', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Ustaw status zam�wie� realizowanych t� form� p�atno�ci', '6', '0', NULL, '2007-10-16 17:46:12', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1025', 'Kolejno�� wy�wielania', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:46:12', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1041', 'Z jakiego kraju wysy�ka', 'MODULE_SHIPPING_DP3_ZONE', '0', '', '6', '0', NULL, '2007-10-16 17:46:48', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1042', 'Kolejno�� wy�wietlania', 'MODULE_SHIPPING_DP3_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:46:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('84', 'Domy�lna waluta', 'DEFAULT_CURRENCY', 'PLN', 'Domy�lna waluta', '6', '0', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('85', 'Domy�lny j�zyk', 'DEFAULT_LANGUAGE', 'pl', 'Domy�lny j�zyk interfejsu sklepu', '6', '0', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('86', 'Domy�lny status zam�wienia', 'DEFAULT_ORDERS_STATUS_ID', '1', 'Domy�lny status zam�wienia, kt�ry zostanie pokazany klientowi.', '6', '0', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('334', 'Minimalna wielko�� zam�wienia dla darmowej przesy�ki', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Dla klient�w zamawiaj�cych za kwot� wi�ksz� ni� wpisana tutaj, nie b�dzie doliczony koszt przesy�ki .', '6', '4', NULL, '2004-09-19 02:37:18', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('335', 'Darmowa przesy�ka dla zam�wie� z wybranego rejonu', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'krajowe', 'Umo�liwia darmow� przesy�k� dla klient�w z wybranego rejonu (wojew�dztwa).', '6', '5', NULL, '2004-09-19 02:37:18', NULL, 'tep_cfg_select_option(array(\'krajowe\', \'miedzynarodowe\', \'wszystkie\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('331', 'Wysy�ka', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Pokazuje (true) lub nie (false) koszt przesy�ki przy zam�wieniu', '6', '1', NULL, '2004-09-19 02:37:18', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('332', 'Spos�b wy�wietlania', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '3', 'Na kt�rym miejscu pokaza�?', '6', '2', NULL, '2004-09-19 02:37:18', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('92', 'Pokazuj podsum�', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Pokazuje podsum� na stronie z zam�wieniem', '6', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('93', 'Spos�b wy�wietlania', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Na kt�rym miejscu pokaza�?', '6', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('94', 'Pokazuj podatek', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Pokazuje podatek na stronie z zam�wieniem', '6', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('95', 'Spos�b wy�wietlania', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '2', 'Na kt�rym miejscu pokaza�?', '6', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('96', 'Pokazuj sum�', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Pokazuje sum� na stronie z zam�wieniem', '6', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('97', 'Spos�b wy�wietlania', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '900', 'Na kt�rym miejscu pokaza�?', '6', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('98', 'Kraj docelowy', 'SHIPPING_ORIGIN_COUNTRY', '170', '', '7', '1', '2004-09-19 01:33:44', '2003-07-17 05:51:54', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('99', 'Kod pocztowy', 'SHIPPING_ORIGIN_ZIP', 'NONE', '', '7', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('100', 'Maksymalna waga paczki, kt�r� sklep mo�e wys�a�', 'SHIPPING_MAX_WEIGHT', '20', 'Powy�ej tej wagi pojedy�cze paczki nie b�d� wysy�ane.', '7', '3', '2004-09-19 01:33:53', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('101', 'Waga opakowania (tara)', 'SHIPPING_BOX_WEIGHT', '0', '', '7', '4', '2004-09-19 01:33:58', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('102', 'Wi�ksze paczki - wzrost procentowy.', 'SHIPPING_BOX_PADDING', '10', 'Dla pobierania op�at wi�kszych o 10% wpisz 10', '7', '5', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('103', 'Pokazuj zdj�cie produktu', 'PRODUCT_LIST_IMAGE', '3', 'Pokazuj zdj�cie produktu (wpisuj�c 1 zostanie pokazany na pierwszym miejscu, wpisz 0 aby nie pokazywa� zdj�cia produktu w wykazach)', '8', '1', '2005-03-18 16:43:35', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('104', 'Pokazuj nazw� producenta', 'PRODUCT_LIST_MANUFACTURER', '0', 'Jak wy�ej', '8', '2', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('105', 'Pokazuj model produktu', 'PRODUCT_LIST_MODEL', '2', 'Jak wy�ej', '8', '3', '2005-03-18 16:43:20', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('106', 'Pokazuj nazw� produktu', 'PRODUCT_LIST_NAME', '1', 'Jak wy�ej', '8', '4', '2003-07-29 19:30:21', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('107', 'Pokazuj cen� produktu', 'PRODUCT_LIST_PRICE', '4', 'Jak wy�ej', '8', '5', '2005-03-18 16:44:23', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('108', 'Pokazuj ilo�� dost�pnych produkt�w', 'PRODUCT_LIST_QUANTITY', '0', 'Jak wy�ej', '8', '6', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('109', 'Pokazuj wag� produktu', 'PRODUCT_LIST_WEIGHT', '0', 'Jak wy�ej', '8', '7', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('110', 'Pokazuj kolumn� Kup Teraz', 'PRODUCT_LIST_BUY_NOW', '5', 'Czy pokaza� kolumn� Kup Teraz?', '8', '8', '2005-03-18 16:44:35', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('111', 'Pokazuj filtr Kategorii/Producent�w (0=wy��czone; 1=w��czone)', 'PRODUCT_LIST_FILTER', '1', '', '8', '9', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('112', 'Umiejscowienie paska nawigacyjnego Dalej/Wstecz (1-g�ra, 2-d�,', 'PREV_NEXT_BAR_LOCATION', '2', '', '8', '10', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('113', 'Sprawdzaj stan magazynu', 'STOCK_CHECK', 'true', 'Sprawdza (true) lub nie (false) czy dany produkt jest dost�pny w magazynie', '9', '1', '2007-06-30 14:56:40', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('114', 'Aktualizacja magazynu', 'STOCK_LIMITED', 'false', 'Je�li zaznaczone (true), po ka�dym zam�wieniu produktu, jego ilo�� zmniejszy si� w magazynie', '9', '2', '2005-03-21 13:08:52', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('115', 'Pozw�l zam�wi�', 'STOCK_ALLOW_CHECKOUT', 'true', 'Pozwala (true) zam�wi� klientowi produkt, kt�rego aktualnie nie ma na stanie w magazynie', '9', '3', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('116', 'Zaznaczanie produkt�w niedost�pnych w magazynie', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '<img src=\"images/icons/brak.gif\" alt=\"[!]\">', 'Spos�b w jaki na zam�wieniu zostan� oznaczone produkty aktualnie niedost�pne w magazynie', '9', '4', '2007-07-05 16:22:28', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('117', 'Poziom krytyczny magazynu', 'STOCK_REORDER_LEVEL', '5', 'Ilo�� zapas�w w magazynie, po przekroczeniu kt�rej zostanie powiadomiony administrator sklepu', '9', '5', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('118', 'Przechowuj czas przetwarzania strony', 'STORE_PAGE_PARSE_TIME', 'false', '', '10', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('119', 'Miejsce sk�adowania log�w', 'STORE_PAGE_PARSE_TIME_LOG', '/tmp/page_parse_time.log', '', '10', '2', '2007-10-16 17:37:36', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('120', 'Format daty log�w', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', '', '10', '3', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('121', 'Pokazuj czas przetwarzania stron', 'DISPLAY_PAGE_PARSE_TIME', 'false', '', '10', '4', '2005-05-23 12:48:26', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('122', 'Przechowuj zapytania do bazy danych', 'STORE_DB_TRANSACTIONS', 'false', 'Czy aplikacja ma (true) czy nie (false) przechowywa� zapytania do SQL w logach (dotyczy PHP4)', '10', '5', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('123', 'U�ywaj Cache', 'USE_CACHE', 'false', '', '11', '1', '2007-07-02 16:31:55', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('124', 'Katalog Cache', 'DIR_FS_CACHE', '/tmp/', '', '11', '2', '2007-10-16 17:37:21', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('125', 'Metoda wysy�ania e-maili', 'EMAIL_TRANSPORT', 'sendmail', 'E-maile mog� by� wysy�ane poprzez program sendmail (linux) lub przez serwer SMTP (Windows, MacOS) - w zale�no�ci od konfiguracji php.ini .', '12', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('126', 'Symbol ko�ca linii e-maila', 'EMAIL_LINEFEED', 'LF', 'S�u�y do wydzielania linii nag�owka e-maila.', '12', '2', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('127', 'U�ywaj MIME HTML gdy wysy�asz e-maile', 'EMAIL_USE_HTML', 'false', 'Wysy�a e-maile w formacie HTML', '12', '3', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('128', 'Weryfikuj adresy e-mail przez DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', '', '12', '4', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('129', 'Wysy�aj e-maile', 'SEND_EMAILS', 'true', 'Sklep mo�e wysy�a� (true) lub nie (false) e-maile do klient�w', '12', '5', '2007-06-29 18:38:48', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('130', 'W��cz �ci�ganie', 'DOWNLOAD_ENABLED', 'false', 'W�acza (true) lub nie (false) modu� �ci�gania dla produkt�w.', '13', '1', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('131', '�ci�ganie przez przekierowanie', 'DOWNLOAD_BY_REDIRECT', 'false', '', '13', '2', NULL, '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('132', 'Wyga�niecie po (dniach)', 'DOWNLOAD_MAX_DAYS', '7', 'Po ilu dniach ma wygasa� wa�no�� podanego odno�nika. 0 oznacza brak limitu.', '13', '3', NULL, '2003-07-17 05:51:54', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('133', 'Maksymalna ilo�� �ci�gni��', 'DOWNLOAD_MAX_COUNT', '5', 'Limit liczby �ci�gni��. 0 oznacza brak limitu.', '13', '4', NULL, '2003-07-17 05:51:54', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('134', 'W��cz kompresj� GZip', 'GZIP_COMPRESSION', 'true', 'W��cza (true) kompresj� GZip stron WWW.', '11', '3', '2005-03-19 11:53:18', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('135', 'Poziom kompresji GZip', 'GZIP_LEVEL', '5', 'Poziom kompresji GZip (0 = minimalny, 9 = maksymalny).', '11', '4', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('136', 'Katalog sesji', 'SESSION_WRITE_DIRECTORY', '/tmp/', 'Je�li wybrano spos�b przechowywania sesji w plikach wpisz tutaj katalog, w kt�rym s� zapisywane.', '15', '1', '2005-11-13 21:35:34', '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('137', 'Wymu� u�ywanie cookie', 'SESSION_FORCE_COOKIE_USE', 'False', '', '15', '2', '2005-03-19 12:34:44', '2003-07-17 05:51:54', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('138', 'Sprawdzaj ID sesji', 'SESSION_CHECK_SSL_SESSION_ID', 'True', '', '15', '3', '2005-11-14 00:39:47', '2003-07-17 05:51:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('139', 'Sprawdzaj przegl�dark� internetow�', 'SESSION_CHECK_USER_AGENT', 'False', '', '15', '4', NULL, '2003-07-17 05:51:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('140', 'Sprawdzaj adres IP', 'SESSION_CHECK_IP_ADDRESS', 'False', '', '15', '5', NULL, '2003-07-17 05:51:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('141', 'Chro� przed rozpoczynaniem sesji przez wyszukiwarki', 'SESSION_BLOCK_SPIDERS', 'True', '', '15', '6', '2005-04-12 11:31:07', '2003-07-17 05:51:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('142', 'Odtw�rz sesj�', 'SESSION_RECREATE', 'False', 'Generuj (true) nowy ID sesji je�li klient loguje si� lub tworzy nowe konto (wymagane PHP >=4.1).', '15', '7', NULL, '2003-07-17 05:51:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('143', 'Opisywa� produkty z u�yciem edytora HTML?', 'HTML_AREA_WYSIWYG_DISABLE', 'Disable', 'W��cz (Enable) lub wy��cz (Disable) edytor HTML', '112', '0', '2007-07-02 12:32:55', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('144', 'Wersja edytora HTML - Podstawowa (Basic) / Zaawansowana (Advance', 'HTML_AREA_WYSIWYG_BASIC_PD', 'Basic', 'Podstawowa wersja jest SZYBSZA<br>Zaawansowana WOLNIEJSZA', '112', '10', '2003-07-24 09:50:52', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Basic\', \'Advanced\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('145', 'Szeroko�� okna edytora HTML w opisach produkt�w', 'HTML_AREA_WYSIWYG_WIDTH', '505', 'Jak� szeroko�� ma mie� okno edytora (domy�lnie: 505)', '112', '15', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('146', 'Wysoko�� okna edytora HTML w opisach produkt�w', 'HTML_AREA_WYSIWYG_HEIGHT', '240', 'Jak� wysoko�� ma mie� okno edytora (domy�lnie: 240)', '112', '19', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('147', 'Czy u�ywa� edytora HTML w e-mailach do klient�w?', 'HTML_AREA_WYSIWYG_DISABLE_EMAIL', 'Enable', 'U�ywa (enable) lub nie (disable) edytora w trakcie tworzenia e-maili do klient�w', '112', '20', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('148', 'Wersja edytora HTML - Podstawowa (Basic) / Zaawansowana (Advance', 'HTML_AREA_WYSIWYG_BASIC_EMAIL', 'Basic', 'Podstawowa wersja jest SZYBSZA<br>Zaawansowana WOLNIEJSZA', '112', '21', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Basic\', \'Advanced\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('149', 'Szeroko�� okna edytora HTML przy tworzeniu e-maili', 'EMAIL_AREA_WYSIWYG_WIDTH', '505', 'Jak� szeroko�� ma mie� okno edytora (domy�lnie: 505)', '112', '25', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('150', 'Wysoko�� okna edytora HTML przy tworzeniu e-maili', 'EMAIL_AREA_WYSIWYG_HEIGHT', '140', 'Jak� wysoko�� ma mie� okno edytora (domy�lnie: 140)', '112', '29', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('151', 'Czy u�ywa� edytora HTML w przygotowywaniu biuletyn�w?', 'HTML_AREA_WYSIWYG_DISABLE_NEWSLETTER', 'Enable', 'W��cz (enable) lub nie (disable) edytor HTML', '112', '30', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('152', 'Wersja edytora HTML - Podstawowa (Basic) / Zaawansowana (Advance', 'HTML_AREA_WYSIWYG_BASIC_NEWSLETTER', 'Basic', 'Podstawowa wersja jest SZYBSZA<br>Zaawansowana WOLNIEJSZA', '112', '32', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Basic\', \'Advanced\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('153', 'Szeroko�� okna edytora HTML przy tworzeniu biuletyn�w', 'NEWSLETTER_EMAIL_WYSIWYG_WIDTH', '505', 'Jak� szeroko�� ma mie� okno edytora (domy�lnie: 505)', '112', '35', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('154', 'Wysoko�� okna edytora HTML przy tworzeniu biuletyn�w', 'NEWSLETTER_EMAIL_WYSIWYG_HEIGHT', '140', 'Jak� wysoko�� ma mie� okno edytora (domy�lnie: 140)', '112', '39', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('155', 'Definiuj stron� g��wn� przy u�yciu edytora HTML', 'HTML_AREA_WYSIWYG_DISABLE_DEFINE', 'Disable', 'W��cz (enable) lub nie (disable)', '112', '40', '2007-07-02 12:33:07', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('156', 'Wersja edytora HTML - Podstawowa (Basic) / Zaawansowana (Advance', 'HTML_AREA_WYSIWYG_BASIC_DEFINE', 'Basic', 'Podstawowa wersja jest SZYBSZA<br>Zaawansowana WOLNIEJSZA', '112', '41', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Basic\', \'Advanced\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('157', 'Szeroko�� okna edytora HTML przy tworzeniu strony g��wnej', 'DEFINE_MAINPAGE_WYSIWYG_WIDTH', '605', 'Jak� szeroko�� ma mie� okno edytora (domy�lnie: 605)', '112', '42', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('158', 'Wysoko�� okna edytora HTML przy tworzeniu strony g��wnej', 'DEFINE_MAINPAGE_WYSIWYG_HEIGHT', '300', 'Jak� szeroko�� ma mie� okno edytora (domy�lnie: 300)', '112', '43', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('159', 'Globalne ustawienia - czcionka', 'HTML_AREA_WYSIWYG_FONT_TYPE', 'Times New Roman', '', '112', '45', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'Arial\', \'Courier New\', \'Georgia\', \'Impact\', \'Tahoma\', \'Times New Roman\', \'Verdana\', \'Wingdings\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('160', 'Globalne ustawienia - rozmiar czcionki', 'HTML_AREA_WYSIWYG_FONT_SIZE', '12', 'np. 10 oznacza 10 pt', '112', '50', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\\\'8\\\', \\\'10\\\', \\\'12\\\', \\\'14\\\', \\\'18\\\', \\\'24\\\', \\\'36\\\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('161', 'Globalne ustawienia - kolor czcionki', 'HTML_AREA_WYSIWYG_FONT_COLOUR', 'Black', 'White, Black, C0C0C0, Red, FFFFFF, Yellow, Pink, Blue, Gray, 000000, itd.<br>Mo�e to by� ka�dy kolor z palety kolor�w w kodzie HTML', '112', '55', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('162', 'Globalne ustawienia - t�o', 'HTML_AREA_WYSIWYG_BG_COLOUR', 'White', 'White, Black, C0C0C0, Red, FFFFFF, Yellow, Pink, Blue, Gray, 000000, itd.<br>Mo�e to by� ka�dy kolor z palety kolor�w w kodzie HTML', '112', '60', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('163', 'Globalne ustawienia - wersja debuggowana', 'HTML_AREA_WYSIWYG_DEBUG', '0', 'Wy��cz debuggowanie = 0<br>W��cz debuggowanie = 1<br>Domy�lnie = 0 wy��czone', '112', '65', '2003-07-24 00:27:47', '2003-07-24 00:27:47', NULL, 'tep_cfg_select_option(array(\'0\', \'1\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('164', 'Opisy kategorii', 'ALLOW_CATEGORY_DESCRIPTIONS', 'true', 'W��cza (true) lub nie (false) opisy kategorii', '1', '19', NULL, '2003-07-24 01:47:01', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1045', 'Odbi�r osobisty', 'MODULE_SHIPPING_INTOWN2_STATUS', 'True', 'Czy chcesz oferwowa� mo�liwo�� odbioru osobistego przez klient�w ?', '6', '0', NULL, '2007-10-16 17:46:54', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1044', 'Stawki za poszczeg�lne paczki', 'MODULE_SHIPPING_DP3_COST_1', '1:8,2:9.50,5:11,10:17.5,15:21,20:30,30:33', 'Wpisz wag� oraz odpowiadaj�cy jej koszt przesy�ki, np. <b>3:8.50,5:10</b> . Do 3kg wysy�ka 8.50PLN. 3 do 5kg wysylka 10PLN', '6', '0', NULL, '2007-10-16 17:46:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1043', 'Kraj docelowy', 'MODULE_SHIPPING_DP3_COUNTRIES_1', 'PL', 'Oddzielana przecinkami lista kod�w ISO kraj�w', '6', '0', NULL, '2007-10-16 17:46:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('217', 'Enable Display', 'MODULE_SHIPPING_FREECOUNT_DISPLAY', 'True', 'Do you want to display text way if the minimum amount is not reached?', '6', '7', NULL, '2003-07-26 21:44:02', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('216', 'Enable Free Shipping with Minimum Purchase', 'MODULE_SHIPPING_FREECOUNT_STATUS', 'True', 'Do you want to offer free shipping?', '6', '7', NULL, '2003-07-26 21:44:02', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1024', 'Strefa p�atno�ci', 'MODULE_PAYMENT_COD_ZONE', '0', 'Je�eli wybrano stref� ten rodzaj p�atno�ci b�dzie aktywny tylko dla niej.', '6', '2', NULL, '2007-10-16 17:46:12', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1023', 'W��cz p�atno�� za pobraniem', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', '6', '1', NULL, '2007-10-16 17:46:12', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1021', 'Nazwa Banku', 'MODULE_PAYMENT_BANKTRANSFER_BANKNAM', 'Twoj Bank', 'Nazwa banku', '6', '1', NULL, '2007-10-16 17:45:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1022', 'Kolejno�� wy�wietlania.', 'MODULE_PAYMENT_BANKTRANSFER_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:45:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('218', 'Minimum Cost', 'MODULE_SHIPPING_FREECOUNT_AMOUNT', '1500', 'Minimum order amount purchased before shipping is free?', '6', '8', NULL, '2003-07-26 21:44:02', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('219', 'Reihenfolge der Anzeige', 'MODULE_SHIPPING_FREECOUNT_SORT_ORDER', '0', 'Niedrigste wird zuerst angezeigt.', '6', '4', NULL, '2003-07-26 21:44:02', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('225', 'Produkty polecane', 'FEATURED_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) produkty polecane na stronie g��wnej?', '99', '1', '2003-07-31 00:13:19', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('226', 'Ilo�� produkt�w', 'MAX_DISPLAY_FEATURED_PRODUCTS', '12', 'Ile produkt�w wy�wietli�?', '99', '2', '2005-03-17 09:26:15', '0000-00-00 00:00:00', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('227', 'Ilo�� kolumn', 'FEATURED_PRODUCTS_COLUMNS', '2', 'W ilu kolumnach pokaza�?', '99', '3', '2005-03-17 09:26:35', '0000-00-00 00:00:00', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('333', 'Darmowa przesy�ka', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'nie', 'Pozwala lub nie na darmow� przesy�k�', '6', '3', NULL, '2004-09-19 02:37:18', NULL, 'tep_cfg_select_option(array(\'tak\', \'nie\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1048', 'Strefa Dostawy', 'MODULE_SHIPPING_INTOWN2_ZONE', '0', 'Je�eli wybrano stref� ten rodzaj dostawy b�dzie aktywny tylko dla niej.', '6', '0', NULL, '2007-10-16 17:46:54', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('340', 'Promocje - box', 'PBOX_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) promocje w boxie w kolumnie bocznej?', '99', '14', '2005-02-06 00:13:19', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('339', 'Promocje - podkategorie', 'PNESTED_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) promocje na stronie z podkategoriami?', '99', '13', '2005-04-13 14:04:34', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('338', 'Promocje - str. g�.', 'PINDEX_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) promocje na stronie g��wnej?', '99', '12', '2005-04-13 14:04:30', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('337', 'Nowo�ci tego miesi�ca - podkategorie', 'NMNESTED_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) nowe produkty z danego miesi�ca na stronie z podkategoriami?', '99', '11', '2005-04-12 10:51:28', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('165', 'Numer NIP', 'ENTRY_NIP_MIN_LENGTH', '2', 'Minimum length of nip number', '2', '6', NULL, '2003-12-02 10:34:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('166', 'Numer NIP', 'ACCOUNT_NIP', 'true', 'Display NIP in the customers account', '5', '4', NULL, '2003-12-02 10:34:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('336', 'Nowo�ci tego miesi�ca - str. g�.', 'NMINDEX_PRODUCTS_DISPLAY', 'true', 'Pokaza� (true) czy nie (false) nowe produkty z danego miesi�ca na stronie g��wnej?', '99', '10', '2005-04-13 14:04:25', '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1028', 'Strefa p�atno�ci', 'MODULE_PAYMENT_COP_ZONE', '0', 'Je�eli wybrano stref� ten rodzaj p�atno�ci b�dzie aktywny tylko dla niej.', '6', '2', NULL, '2007-10-16 17:46:19', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1029', 'Kolejno�� wy�wietlania', 'MODULE_PAYMENT_COP_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:46:19', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1030', 'Ustaw Status Zam�wienia', 'MODULE_PAYMENT_COP_ORDER_STATUS_ID', '0', 'Ustaw status zam�wie� realizowanych t� form� p�atno�ci', '6', '0', NULL, '2007-10-16 17:46:19', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1046', 'Koszt dostawy', 'MODULE_SHIPPING_INTOWN2_COST', '0.00', '', '6', '0', NULL, '2007-10-16 17:46:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1047', 'Stawka podatkowa', 'MODULE_SHIPPING_INTOWN2_TAX_CLASS', '0', '', '6', '0', NULL, '2007-10-16 17:46:54', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('354', 'Gmina', 'ENTRY_GMINA_MIN_LENGTH', '2', 'Min d�ugo�� nazwy Gminy', '6', '6', NULL, '2003-12-02 10:34:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('355', 'Gmina', 'ACCOUNT_GMINA', 'false', 'Wy�wietlaj Gmin� w koncie klienta', '6', '4', '2005-03-22 13:35:16', '2003-12-02 10:34:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('356', 'Powiat', 'ENTRY_POWIAT_MIN_LENGTH', '2', 'Min d�ugo�� nazwy Powaitu', '6', '6', NULL, '2003-12-02 10:34:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('357', 'Powiat', 'ACCOUNT_POWIAT', 'false', 'Wy�wietlaj Powiat w koncie klienta', '6', '4', '2005-03-22 13:35:28', '2003-12-02 10:34:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('365', 'Minimalna warto�� zam�wienia', 'MIN_ORDER_AMOUNT', '10', 'Minimalna warto�� zam�wienia umo�liwiaj�ca dokonania zakupu. Puste oznacza brak minimum.', '2', '0', '2005-04-27 19:27:05', '2005-03-22 18:48:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('200', 'Centrowanie', 'CENTER_SHOP_ON', 'on', 'W��cz/wy��cz [on/off] Centrowanie', '16', '1', '2005-04-02 07:59:23', '2004-09-01 00:01:58', NULL, 'tep_cfg_select_option(array(\'on\', \'off\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('201', 'Szeroko�� sklepu', 'CENTER_SHOP_WIDTH', '920', 'Szeroko�� sklepu.', '16', '2', '2007-06-27 12:53:43', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('202', 'Szeroko�� lewej kolumny', 'BOX_WIDTH', '225', 'Szeroko�� bocznych box�w menu', '16', '3', '2007-06-20 12:16:40', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('203', 'Szeroko�� prawej kolumny', 'BOX_WIDTH2', '220', 'Szeroko�� bocznych box�w menu', '16', '3', '2007-06-27 14:26:13', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('204', 'Margines wok� sklepu', 'CENTER_SHOP_PADDING', '0', 'Margines poza sklepem [table cellpadding]', '16', '4', '2007-06-27 13:08:59', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('205', 'Kolor t�a', 'CENTER_SHOP_BACKGROUND_COLOR_OUT', '#cccccc url(images/bg.gif)', 'Kolor zewn�trznego t�a sklepu', '16', '6', '2005-04-02 07:03:54', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('206', 'Grubo�� obramowania', 'CENTER_SHOP_BORDER', '0', 'Grubo�� obramowania wok� sklepu', '16', '7', '2007-06-27 13:09:30', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('207', 'Kolor obramowania', 'CENTER_SHOP_BORDERCOLOR', '000000', 'Kolor obramowania [np. #FFFFFF]', '16', '8', '2004-09-01 00:01:58', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('208', 'Margines zewn�trzny kom�rki', 'CENTER_SHOP_CELLSPACING', '0', 'Margines zewn�trzny kom�rki [cellspacing]', '16', '9', '2007-06-27 13:09:59', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('209', 'Margines wewn�trzny kom�rki', 'CENTER_SHOP_CELLPADDING', '0', 'Margines zewn�trzny kom�rki [cellpadding]', '16', '10', '2005-04-13 14:06:41', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('210', 'W��cz Kolor t�a sklepu', 'CENTER_SHOP_BACKGROUND_ON', 'on', 'U�ywa� koloru t�a wewn�trz sklepu? [on/off]', '16', '11', '2005-04-13 13:27:58', '2004-09-01 00:01:58', NULL, 'tep_cfg_select_option(array(\'on\', \'off\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('211', 'Kolor wewn�trznego t�a sklepu', 'CENTER_SHOP_BACKGROUND_COLOR', 'url(images/tlo_sklepu.jpg)', 'Kolor t�a wewn�trz sklepu [np. #FFFFFF]', '16', '12', '2005-04-13 14:15:02', '2004-09-01 00:01:58', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('231', 'Kontakt fax', 'KONTAKT_FAX_1', '', 'Numer FAXu prezentowany w boxie :Kontakt:', '1', '31', '2007-06-20 15:46:08', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('232', 'Kontakt telefon', 'KONTAKT_TELEFON_1', 'TUTAJ wpisz nr telefonu', 'Numer telefonu prezentowany w boxie :Kontakt:', '1', '32', '2007-10-16 18:40:51', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('233', 'Kontakt GSM', 'KONTAKT_GSM_1', '', 'Numer telefonu kom�rkowego prezentowany w boxie :Kontakt:', '1', '33', '2007-10-16 18:41:09', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('234', 'Kontakt nr GG', 'KONTAKT_NR_GG_1', 'TUTAJ podaj nr GG', 'Numer GG prezentowany w boxie :Kontakt:', '1', '34', '2007-10-16 18:41:20', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1049', 'Kolejno�� wy�wietlania', 'MODULE_SHIPPING_INTOWN2_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:46:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('241', 'Kontakt nr SKYPE', 'KONTAKT_SKYPE_1', 'TUTAJ podaj nick Skype', 'Login SKYPE prezentowany w boxie :Kontakt:', '1', '41', '2007-10-16 18:41:33', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('242', 'Kontakt godziny dzia�ania', 'KONTAKT_GODZINY_1', 'TUTAJ wpisz godziny pracy', 'Godziny otwarcia/dzia�ania prezentowane w boxie :Kontakt:', '1', '42', '2007-10-16 18:41:48', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('230', 'Kontakt e-mail', 'KONTAKT_EMAIL_1', 'TUTAJ wpisz e-mail', 'Adres email prezentowany w boxie :Kontakt:', '1', '30', '2007-10-16 18:40:36', '2005-04-02 07:07:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1040', 'Stawka podatkowa', 'MODULE_SHIPPING_DP3_TAX_CLASS', '0', '', '6', '0', NULL, '2007-10-16 17:46:48', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1039', 'Koszt pakowania', 'MODULE_SHIPPING_DP3_HANDLING', '0', '', '6', '0', NULL, '2007-10-16 17:46:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1038', 'Paczka Priorytetowa - Poczta Polska', 'MODULE_SHIPPING_DP3_STATUS', 'True', 'Czy chcesz oferowa� wysy�k� za po�rednictwem Poczty Polskiej?', '6', '0', NULL, '2007-10-16 17:46:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1037', 'Stawki za poszczeg�lne paczki', 'MODULE_SHIPPING_DP_COST_1', '1:6.5,2:8,5:9.5,10:15,15:19,20:27,30:30', 'Wpisz wag� oraz odpowiadaj�cy jej koszt przesy�ki, np. <b>3:8.50,5:10</b> . Do 3kg wysy�ka 8.50PLN. 3 do 5kg wysylka 10PLN', '6', '0', NULL, '2007-10-16 17:46:45', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1036', 'Kraj docelowy', 'MODULE_SHIPPING_DP_COUNTRIES_1', 'PL', 'Oddzielana przecinkami lista kod�w ISO kraj�w', '6', '0', NULL, '2007-10-16 17:46:45', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1035', 'Kolejno�� wy�wietlania', 'MODULE_SHIPPING_DP_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:46:45', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1034', 'Z jakiego kraju wysy�ka', 'MODULE_SHIPPING_DP_ZONE', '0', '', '6', '0', NULL, '2007-10-16 17:46:45', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1033', 'Stawka podatkowa', 'MODULE_SHIPPING_DP_TAX_CLASS', '0', '', '6', '0', NULL, '2007-10-16 17:46:45', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1032', 'Koszt pakowania', 'MODULE_SHIPPING_DP_HANDLING', '0', '', '6', '0', NULL, '2007-10-16 17:46:45', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1031', 'Poczta Polska', 'MODULE_SHIPPING_DP_STATUS', 'True', 'Czy chcesz oferowa� wysy�k� za po�rednictwem Poczty Polskiej?', '6', '0', NULL, '2007-10-16 17:46:45', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('396', 'Poka� ilo�� zapyta� SQL i czas generowania', 'DISPLAY_QUERIES_BRIEF', 'true', 'Poka� ilo�c zapyta� do bazy danych oraz czas generowania strony', '10', '6', NULL, '2005-04-08 20:35:45', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('397', 'Debuguj zapytaia SQL', 'DISPLAY_QUERIES', 'false', 'Wy�wietlaj info o COOKIE, SESSION, POST, i GET w stopce', '10', '7', '2005-05-06 05:10:43', '2005-04-08 20:35:45', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('410', 'Wysoko�� obrazk�w w PopUp', 'POPUP_IMAGE_HEIGHT', '', 'Wysoko�� w pixelach obrazk�w w PopUpie produktu. Aby pokaza� obrazek w oryginalnych rozmiarach pozostaw to pole puste!', '4', '12', '2005-04-26 01:33:05', '2005-04-25 23:26:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('409', 'Szeroko�� obrazk�w w PopUp', 'POPUP_IMAGE_WIDTH', '', 'Szeroko�� w pixelach obrazk�w w PopUpie produktu. Aby pokaza� obrazek w oryginalnych rozmiarach pozostaw to pole puste!', '4', '11', '2005-04-26 01:33:08', '2005-04-25 23:26:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('408', 'Wysoko�c obrak�w produkt�w', 'DISPLAY_IMAGE_HEIGHT', '130', 'Wysoko�� w pixelach obrazk�w na stronie <b>produktu</b>', '4', '10', '2005-05-02 17:45:54', '2005-04-25 23:26:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('407', 'Szeroko�� obrazk�w produkt�w', 'DISPLAY_IMAGE_WIDTH', '130', 'Szeroko�� w pixelach obrazk�w na stronie <b>produktu</b>', '4', '9', '2005-05-02 17:45:50', '2005-04-25 23:26:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('406', 'Czas trwania sesji admina', 'MYSESSION_LIFETIME', '1800', 'Jak d�ugo [w sekundach] chcesz m�c pozostawa� w adminie, bez od�wie�ania strony, zanim b�dziesz musia� si� ponownie zalogowa�. (NIE USTAWIAJ NA 0. Je�li to zrobisz nie b�dizesz m�g� si� zalogowa�!!!  3600 to jedna godzina)', '15', '8', '2005-04-25 18:20:33', '2005-04-19 03:30:25', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('433', 'Zakupy bez rejestracji', 'PWA_ON', 'true', 'Pozw�l Klientom dokonywa� zakup�w bez rejestracji', '5', '1', '2007-07-02 16:42:26', '2003-04-08 12:10:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('448', 'Ilo�� cen na produkt', 'XPRICES_NUM', '1', 'Ilo�� cen na produkt<br><br><b>UWAGA: Zmiana wymazuje ceny w tabeli dodatkowych cen!</b><br><br><b>Grupom u�ywaj�cym tych cen przypisane zostana standardowe.</b>', '113', '31', '2003-11-11 18:33:04', '0000-00-00 00:00:00', 'tep_update_prices', 'tep_cfg_pull_down_prices(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('449', 'Pokazuj Go�ciom ceny', 'ALLOW_GUEST_TO_SEE_PRICES', 'true', 'Pokazuj Klientom standardowe ceny', '113', '32', '2005-11-13 20:30:59', '2004-03-15 14:59:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('450', 'Zni�ki dla Go�ci', 'GUEST_DISCOUNT', '0', 'Zni�ki dla Go�ci', '113', '33', '0000-00-00 00:00:00', '2004-03-15 14:59:05', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('451', 'Ceny Promocyjne (ukrywanie cen produkt�w)', 'SPECIAL_PRICES_HIDE', 'false', 'Ceny Promocyjne (ukrywanie cen produkt�w)', '113', '34', '2005-11-13 21:02:07', '2004-03-15 14:59:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('452', 'Aktywuj Nowych Klient�w', 'NEW_CUSTOMERS_ENABLED', 'true', 'Aktywuj lub nie klient�w po ich rejestracji', '5', '1', '0000-00-00 00:00:00', '2004-03-15 14:59:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('453', 'Rozwijane Menu nawigacyjne', 'MENU_DHTML', 'true', 'Pokazuj rozwijane menu, zamiast standardowego menu link�w w kolumnie.', '1', '19', NULL, '0000-00-00 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('454', 'Edytor Zam�wie� - Pokazuj list� p�atno?ci?', 'DISPLAY_PAYMENT_METHOD_DROPDOWN', 'true', 'Pokazuj w Edytorze Zam�wie� list� dostepnych p�atno?ci w postaci rozwijanego menu (true) lub pola tekstowego (false)', '1', '21', NULL, '2006-04-02 11:51:01', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('455', 'Produkty - BRAK', 'STOCK_LEVEL_NONE', '0', 'Ilo�� zapas�w w magazynie, kt�ra b�dzie oznaczana w sklepie jako BRAK', '9', '11', NULL, '2007-01-21 09:13:23', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('456', 'Produkty - poziom niski', 'STOCK_LEVEL_LOW', '2', 'Ilo�� zapas�w w magazynie, kt�ra b�dzie oznaczana w sklepie jako poziom niski', '9', '12', NULL, '2007-01-21 09:13:23', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('457', 'Produkty - poziom �redni', 'STOCK_LEVEL_MEDIUM', '2', 'Ilo�� zapas�w w magazynie, kt�ra b�dzie oznaczana w sklepie jako poziom �redni', '9', '13', NULL, '2007-01-21 09:13:23', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('458', 'Produkty - poziom wysoki', 'STOCK_LEVEL_HIGH', '5', 'Ilo�� zapas�w w magazynie, kt�ra b�dzie oznaczana w sklepie jako poziom wysoki', '9', '14', NULL, '2007-01-21 09:13:23', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1020', 'Nazwa konta bankowego', 'MODULE_PAYMENT_BANKTRANSFER_ACCNAM', 'Fredy Kruger', 'Nazwa rachunku bankowego', '6', '1', NULL, '2007-10-16 17:45:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1019', 'Numer narunku bankowego', 'MODULE_PAYMENT_BANKTRANSFER_ACCNUM', '123456789012345678901234', 'Numer rachunku bankowego', '6', '1', NULL, '2007-10-16 17:45:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1018', 'Kod banku', 'MODULE_PAYMENT_BANKTRANSFER_SORTCODE', '00-00-00', 'Kod banku jest w formacie 00-00-00', '6', '1', NULL, '2007-10-16 17:45:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('463', 'Liczba sztuk produktu w koszyku', 'MAX_QTY_IN_CART', '999', 'Maksymalna ilo�� danego produktu, kt�ra mo�e zosta� dodana do koszyka (wpisz 0 bez limit�w)', '3', '19', NULL, '2007-10-15 21:58:05', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1001', 'Poka� pole Model', 'DISPLAY_MODEL', 'true', '', '300', '1', '2003-06-04 05:04:07', '2003-06-04 04:25:57', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1002', 'Edycja pola Model', 'MODIFY_MODEL', 'true', '', '300', '2', '2003-06-04 05:04:07', '2003-06-04 04:25:57', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1003', 'Edycja nazwy', 'MODIFY_NAME', 'true', '', '300', '3', '2003-06-04 05:04:01', '2003-06-04 04:30:31', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1004', 'Edycja statusu', 'DISPLAY_STATUT', 'true', '', '300', '4', '2003-06-04 05:07:11', '2003-06-04 05:00:58', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1005', 'Edycja wagi', 'DISPLAY_WEIGHT', 'true', '', '300', '5', '2003-06-04 05:06:44', '2003-06-04 04:33:16', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1006', 'Edycja ilo�ci', 'DISPLAY_QUANTITY', 'true', '', '300', '6', '2003-06-04 05:06:48', '2003-06-04 04:34:34', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1007', 'Edycja zdj�cia', 'DISPLAY_IMAGE', 'true', '', '300', '7', '2003-06-04 05:06:52', '2003-06-04 04:36:57', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1008', 'Poka� pole producent', 'DISPLAY_MANUFACTURER', 'true', '', '300', '8', '2003-06-04 05:19:08', '2003-06-04 05:17:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1009', 'Edycja pola Producent', 'MODIFY_MANUFACTURER', 'true', '', '300', '9', '2003-06-04 05:06:57', '2003-06-04 04:37:40', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1010', 'Poka� pole Podatek', 'DISPLAY_TAX', 'true', '', '300', '10', '2003-06-04 05:19:08', '2003-06-04 05:17:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1011', 'Edycja stawki podatku', 'MODIFY_TAX', 'true', '', '300', '11', '2003-06-04 05:06:40', '2003-06-04 04:31:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1012', 'Pokazuj cen� brutto po najechaniu myszk� na produkt', 'DISPLAY_TVA_OVER', 'true', '', '300', '12', '2003-06-04 05:07:02', '2003-06-04 04:38:45', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1013', 'Pokazuj cen� brutto podczas edycji ceny', 'DISPLAY_TVA_UP', 'true', '', '300', '13', '2003-06-04 05:07:06', '2003-06-04 04:40:12', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1014', 'Poka� podgl�d produktu', 'DISPLAY_PREVIEW', 'true', '', '300', '14', '2003-06-04 05:19:13', '2003-06-04 05:15:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1015', 'Edycja produktu', 'DISPLAY_EDIT', 'true', '', '300', '15', '2003-06-04 05:19:08', '2003-06-04 05:17:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1016', 'Margines zmian cen', 'ACTIVATE_COMMERCIAL_MARGIN', 'true', '', '300', '16', '2006-11-08 15:22:41', '2003-06-04 05:17:05', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1050', 'Przesy�ka kurierska', 'MODULE_SHIPPING_DP2_STATUS', 'True', 'Czy chcesz oferowa� wysy�k� za po�rednictwem firmy kurierskiej?', '6', '0', NULL, '2007-10-16 17:47:32', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1051', 'Koszt pakowania', 'MODULE_SHIPPING_DP2_HANDLING', '0', '', '6', '0', NULL, '2007-10-16 17:47:32', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1052', 'Stawka podatkowa', 'MODULE_SHIPPING_DP2_TAX_CLASS', '0', '', '6', '0', NULL, '2007-10-16 17:47:32', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1053', 'Z jakiego kraju wysy�ka', 'MODULE_SHIPPING_DP2_ZONE', '0', '', '6', '0', NULL, '2007-10-16 17:47:32', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1054', 'Kolejno�� wy�wietlania', 'MODULE_SHIPPING_DP2_SORT_ORDER', '0', 'Kolejno�� wy�wietlania. Najni�sze wy�wietlane s� na pocz�tku.', '6', '0', NULL, '2007-10-16 17:47:32', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1055', 'Kraj docelowy', 'MODULE_SHIPPING_DP2_COUNTRIES_1', 'PL', 'Oddzielana przecinkami lista kod�w ISO kraj�w', '6', '0', NULL, '2007-10-16 17:47:32', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1056', 'Stawki za poszczeg�lne przesy�ki', 'MODULE_SHIPPING_DP2_COST_1', '5:16.50,10:20.50,20:28.50', 'Wpisz wag� oraz odpowiadaj�cy jej koszt przesy�ki, np. <b>3:8.50,5:10</b> . Do 3kg wysy�ka 8.50PLN. 3 do 5kg wysylka 10PLN', '6', '0', NULL, '2007-10-16 17:47:32', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1057', 'Produkt�w w przechowalni', 'MAX_DISPLAY_WISHLIST_PRODUCTS', '10', 'Ile produkt�w pokazywa� na jednej stronie przechowalni', '12954', '0', '2009-12-30 12:59:28', '2009-12-30 12:59:28', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1058', 'Produkt�w w boksie przechowalni', 'MAX_DISPLAY_WISHLIST_BOX', '100', 'Ile produkt�w pokazywa� w boksie informacyjnym zanim zmieni si� w licznik', '12954', '0', '2009-12-30 12:59:28', '2009-12-30 12:59:28', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1059', 'Adresy e-mail', 'DISPLAY_WISHLIST_EMAILS', '3', 'Ile adres�w e-mail wy�wietla�, kiedy klienci przesy�aj� list� �ycze� z przechowalni', '12954', '0', '2009-12-30 12:59:28', '2009-12-30 12:59:28', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1060', 'Przekierowanie z przechowalni', 'WISHLIST_REDIRECT', 'No', 'Czy chcesz przekirowywa� do strony produktu, kiedy klient dodaje produkt do przechowalni?', '12954', '0', '2009-12-30 12:59:28', '2009-12-30 12:59:28', NULL, 'tep_cfg_select_option(array(\'Yes\', \'No\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1200', 'Szablon sklepu', 'DEFAULT_TEMPLATE', 'standard', 'Wybierz szablon dla sklepu.<br><br><a href=\"http://www.mysklep.pl/sklep\" target=\"_blank\" style=\"color: #0098D0\">Zam�w dodatkowe templatki</a>', '99', NULL, '2010-01-06 09:30:34', '2009-12-30 15:19:50', NULL, 'tep_cfg_select_option(array(\'standard\', \'niebieski\', \'rozowy\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1201', 'Pokazuj na listowaniu zdj�cia podkategorii', 'DISPLAY_SUBCATEGORIES_IMAGES', 'false', 'Po wej�ciu do kategori zawieraj�cej podkategorie, ka�da z nich b�dzie wy�wietla�a miniaturk� zdj�cia (true) lub tylko list� kategorii (false)', '4', '22', '2009-03-04 00:00:00', '2009-03-04 00:00:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1202', 'Nr domu', 'ENTRY_STREET_ADDRESS_DOM_MIN_LENGTH', '1', 'Minimalna ilo�� znak�w w nr domu', '2', '5', NULL, '2003-07-17 05:51:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1203', 'Pokazuj list� rozwijan� opcji p�atno�ci ?', 'ORDER_EDITOR_PAYMENT_DROPDOWN', 'true', '<b>true:</b> Edytor mo�liwe opcje p�atno�ci wy�wietli jako list� rozwijan�. Je�li <b>false:</b> b�dzie to pole typu input.', '72', '1', '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1204', 'U�yj cen z modu�u SPPC ?', 'ORDER_EDITOR_USE_SPPC', 'false', 'W wersji Mysklep Comfort nale�y t� opcj� pozostawi� na false.', '72', '3', '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1205', 'U�ywaj technologii Ajax do aktualizacji informacji w zam�wieniu?', 'ORDER_EDITOR_USE_AJAX', 'true', 'Nale�y opcj� t� ustawi� na <b>false</b> je�eli obs�uga sklepu korzysta z przegl�darki z wy��czon� lub niedost�pn� obs�ug� JavaScript.', '72', '4', '2009-10-02 14:13:39', '2009-10-02 14:13:39', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1206', 'Wybierz opcj� p�atno�ci dla Kart kredytowych', 'ORDER_EDITOR_CREDIT_CARD', 'Other', 'Edytor zam�wie� wy�wietli dodatkowe pola dla danych karty kredytowej, je�li ta opcja p�atno�ci zostanie wybrana.', '72', '5', '2009-10-02 14:29:28', '2009-10-02 14:13:39', NULL, 'tep_cfg_pull_down_payment_methods(');
drop table if exists configuration_group;
create table configuration_group (
  configuration_group_id int(11) not null auto_increment,
  configuration_group_title varchar(64) not null ,
  configuration_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  PRIMARY KEY (configuration_group_id)
);

insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('1', 'Tw�j sklep', 'Podstawowe informacje o sklepie', '1', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('2', 'Warto�ci minimalne', 'The minimum values for functions / data', '2', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('3', 'Warto�ci maksymalne', 'The maximum values for functions / data', '3', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('4', 'Obrazki', 'Image parameters', '4', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('5', 'Dane klienta', 'Konfiguracja konta Klienta', '5', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('6', 'Opcje modu��w', 'Ukryte z poziomu konfiguracji', '6', '0');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('7', 'Dostawa/Pakowanie', 'Shipping options available at my store', '7', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('9', 'Magazyn', 'Opcje kontroli magazynu', '9', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('10', 'Logi', 'Konfiguracja log�w', '10', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('11', 'Cache i Kompresja Gzip', 'Konfiguracja cache i GZip', '11', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('12', 'Opcje e-mail', 'Konfiguracja e-mail', '12', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('13', 'Download', 'Konfiguracja �ci�gania produkt�w', '13', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('15', 'Sesje', 'Konfiguracja sesji', '15', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('99', 'Wygl�d box�w', 'Wygl�d box�w w sklepie, zar�wno centralnych, jak i w bocznych kolumnach', '15', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('113', 'Opcje B2B', 'Opcje B2B - konfiguracja', '113', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('300', 'Szybka aktualizacja oferty', 'Szybka aktualizacja oferty - konfiguracja', '112', '1');
drop table if exists counter;
create table counter (
  startdate char(8) ,
  counter int(12) 
);

insert into counter (startdate, counter) values ('20071016', '0');
drop table if exists counter_history;
create table counter_history (
  month char(8) ,
  counter int(12) 
);

drop table if exists countries;
create table countries (
  countries_id int(11) not null auto_increment,
  countries_name varchar(64) not null ,
  countries_iso_code_2 char(2) not null ,
  countries_iso_code_3 char(3) not null ,
  address_format_id int(11) default '0' not null ,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('1', 'Afghanistan', 'AF', 'AFG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('2', 'Albania', 'AL', 'ALB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('3', 'Algeria', 'DZ', 'DZA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('4', 'American Samoa', 'AS', 'ASM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('5', 'Andorra', 'AD', 'AND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('6', 'Angola', 'AO', 'AGO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('7', 'Anguilla', 'AI', 'AIA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('8', 'Antarctica', 'AQ', 'ATA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('9', 'Antigua and Barbuda', 'AG', 'ATG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('10', 'Argentina', 'AR', 'ARG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('11', 'Armenia', 'AM', 'ARM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('12', 'Aruba', 'AW', 'ABW', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('13', 'Australia', 'AU', 'AUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('14', 'Austria', 'AT', 'AUT', '5');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('15', 'Azerbaijan', 'AZ', 'AZE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('16', 'Bahamas', 'BS', 'BHS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('17', 'Bahrain', 'BH', 'BHR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('18', 'Bangladesh', 'BD', 'BGD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('19', 'Barbados', 'BB', 'BRB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('20', 'Belarus', 'BY', 'BLR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('21', 'Belgium', 'BE', 'BEL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('22', 'Belize', 'BZ', 'BLZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('23', 'Benin', 'BJ', 'BEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('24', 'Bermuda', 'BM', 'BMU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('25', 'Bhutan', 'BT', 'BTN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('26', 'Bolivia', 'BO', 'BOL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('27', 'Bosnia and Herzegowina', 'BA', 'BIH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('28', 'Botswana', 'BW', 'BWA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('29', 'Bouvet Island', 'BV', 'BVT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('30', 'Brazil', 'BR', 'BRA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('32', 'Brunei Darussalam', 'BN', 'BRN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('33', 'Bulgaria', 'BG', 'BGR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('34', 'Burkina Faso', 'BF', 'BFA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('35', 'Burundi', 'BI', 'BDI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('36', 'Cambodia', 'KH', 'KHM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('37', 'Cameroon', 'CM', 'CMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('38', 'Canada', 'CA', 'CAN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('39', 'Cape Verde', 'CV', 'CPV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('40', 'Cayman Islands', 'KY', 'CYM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('41', 'Central African Republic', 'CF', 'CAF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('42', 'Chad', 'TD', 'TCD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('43', 'Chile', 'CL', 'CHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('44', 'China', 'CN', 'CHN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('45', 'Christmas Island', 'CX', 'CXR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('47', 'Colombia', 'CO', 'COL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('48', 'Comoros', 'KM', 'COM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('49', 'Congo', 'CG', 'COG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('50', 'Cook Islands', 'CK', 'COK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('51', 'Costa Rica', 'CR', 'CRI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('53', 'Croatia', 'HR', 'HRV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('54', 'Cuba', 'CU', 'CUB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('55', 'Cyprus', 'CY', 'CYP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('56', 'Czech Republic', 'CZ', 'CZE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('57', 'Denmark', 'DK', 'DNK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('58', 'Djibouti', 'DJ', 'DJI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('59', 'Dominica', 'DM', 'DMA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('60', 'Dominican Republic', 'DO', 'DOM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('61', 'East Timor', 'TP', 'TMP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('62', 'Ecuador', 'EC', 'ECU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('63', 'Egypt', 'EG', 'EGY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('64', 'El Salvador', 'SV', 'SLV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('66', 'Eritrea', 'ER', 'ERI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('67', 'Estonia', 'EE', 'EST', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('68', 'Ethiopia', 'ET', 'ETH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('70', 'Faroe Islands', 'FO', 'FRO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('71', 'Fiji', 'FJ', 'FJI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('72', 'Finland', 'FI', 'FIN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('73', 'France', 'FR', 'FRA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('74', 'France, Metropolitan', 'FX', 'FXX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('75', 'French Guiana', 'GF', 'GUF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('76', 'French Polynesia', 'PF', 'PYF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('77', 'French Southern Territories', 'TF', 'ATF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('78', 'Gabon', 'GA', 'GAB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('79', 'Gambia', 'GM', 'GMB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('80', 'Georgia', 'GE', 'GEO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('81', 'Germany', 'DE', 'DEU', '5');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('82', 'Ghana', 'GH', 'GHA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('83', 'Gibraltar', 'GI', 'GIB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('84', 'Greece', 'GR', 'GRC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('85', 'Greenland', 'GL', 'GRL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('86', 'Grenada', 'GD', 'GRD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('87', 'Guadeloupe', 'GP', 'GLP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('88', 'Guam', 'GU', 'GUM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('89', 'Guatemala', 'GT', 'GTM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('90', 'Guinea', 'GN', 'GIN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('91', 'Guinea-bissau', 'GW', 'GNB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('92', 'Guyana', 'GY', 'GUY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('93', 'Haiti', 'HT', 'HTI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('95', 'Honduras', 'HN', 'HND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('96', 'Hong Kong', 'HK', 'HKG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('97', 'Hungary', 'HU', 'HUN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('98', 'Iceland', 'IS', 'ISL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('99', 'India', 'IN', 'IND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('100', 'Indonesia', 'ID', 'IDN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('102', 'Iraq', 'IQ', 'IRQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('103', 'Ireland', 'IE', 'IRL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('104', 'Israel', 'IL', 'ISR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('105', 'Italy', 'IT', 'ITA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('106', 'Jamaica', 'JM', 'JAM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('107', 'Japan', 'JP', 'JPN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('108', 'Jordan', 'JO', 'JOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('109', 'Kazakhstan', 'KZ', 'KAZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('110', 'Kenya', 'KE', 'KEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('111', 'Kiribati', 'KI', 'KIR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('112', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('113', 'Korea, Republic of', 'KR', 'KOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('114', 'Kuwait', 'KW', 'KWT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('115', 'Kyrgyzstan', 'KG', 'KGZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('117', 'Latvia', 'LV', 'LVA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('118', 'Lebanon', 'LB', 'LBN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('119', 'Lesotho', 'LS', 'LSO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('120', 'Liberia', 'LR', 'LBR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('121', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('122', 'Liechtenstein', 'LI', 'LIE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('123', 'Lithuania', 'LT', 'LTU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('124', 'Luxembourg', 'LU', 'LUX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('125', 'Macau', 'MO', 'MAC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('126', 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('127', 'Madagascar', 'MG', 'MDG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('128', 'Malawi', 'MW', 'MWI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('129', 'Malaysia', 'MY', 'MYS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('130', 'Maldives', 'MV', 'MDV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('131', 'Mali', 'ML', 'MLI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('132', 'Malta', 'MT', 'MLT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('133', 'Marshall Islands', 'MH', 'MHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('134', 'Martinique', 'MQ', 'MTQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('135', 'Mauritania', 'MR', 'MRT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('136', 'Mauritius', 'MU', 'MUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('137', 'Mayotte', 'YT', 'MYT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('138', 'Mexico', 'MX', 'MEX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('140', 'Moldova, Republic of', 'MD', 'MDA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('141', 'Monaco', 'MC', 'MCO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('142', 'Mongolia', 'MN', 'MNG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('143', 'Montserrat', 'MS', 'MSR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('144', 'Morocco', 'MA', 'MAR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('145', 'Mozambique', 'MZ', 'MOZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('146', 'Myanmar', 'MM', 'MMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('147', 'Namibia', 'NA', 'NAM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('148', 'Nauru', 'NR', 'NRU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('149', 'Nepal', 'NP', 'NPL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('150', 'Netherlands', 'NL', 'NLD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('151', 'Netherlands Antilles', 'AN', 'ANT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('152', 'New Caledonia', 'NC', 'NCL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('153', 'New Zealand', 'NZ', 'NZL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('154', 'Nicaragua', 'NI', 'NIC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('155', 'Niger', 'NE', 'NER', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('156', 'Nigeria', 'NG', 'NGA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('157', 'Niue', 'NU', 'NIU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('158', 'Norfolk Island', 'NF', 'NFK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('159', 'Northern Mariana Islands', 'MP', 'MNP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('160', 'Norway', 'NO', 'NOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('161', 'Oman', 'OM', 'OMN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('162', 'Pakistan', 'PK', 'PAK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('163', 'Palau', 'PW', 'PLW', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('164', 'Panama', 'PA', 'PAN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('165', 'Papua New Guinea', 'PG', 'PNG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('166', 'Paraguay', 'PY', 'PRY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('167', 'Peru', 'PE', 'PER', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('168', 'Philippines', 'PH', 'PHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('169', 'Pitcairn', 'PN', 'PCN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('170', 'Polska', 'PL', 'POL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('171', 'Portugal', 'PT', 'PRT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('172', 'Puerto Rico', 'PR', 'PRI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('173', 'Qatar', 'QA', 'QAT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('174', 'Reunion', 'RE', 'REU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('175', 'Romania', 'RO', 'ROM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('176', 'Russian Federation', 'RU', 'RUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('177', 'Rwanda', 'RW', 'RWA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('179', 'Saint Lucia', 'LC', 'LCA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('181', 'Samoa', 'WS', 'WSM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('182', 'San Marino', 'SM', 'SMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('183', 'Sao Tome and Principe', 'ST', 'STP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('184', 'Saudi Arabia', 'SA', 'SAU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('185', 'Senegal', 'SN', 'SEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('186', 'Seychelles', 'SC', 'SYC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('187', 'Sierra Leone', 'SL', 'SLE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('188', 'Singapore', 'SG', 'SGP', '4');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('189', 'Slovakia (Slovak Republic)', 'SK', 'SVK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('190', 'Slovenia', 'SI', 'SVN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('191', 'Solomon Islands', 'SB', 'SLB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('192', 'Somalia', 'SO', 'SOM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('193', 'South Africa', 'ZA', 'ZAF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('194', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('195', 'Spain', 'ES', 'ESP', '3');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('196', 'Sri Lanka', 'LK', 'LKA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('197', 'St. Helena', 'SH', 'SHN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('199', 'Sudan', 'SD', 'SDN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('200', 'Suriname', 'SR', 'SUR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('202', 'Swaziland', 'SZ', 'SWZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('203', 'Sweden', 'SE', 'SWE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('204', 'Switzerland', 'CH', 'CHE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('205', 'Syrian Arab Republic', 'SY', 'SYR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('206', 'Taiwan', 'TW', 'TWN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('207', 'Tajikistan', 'TJ', 'TJK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('209', 'Thailand', 'TH', 'THA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('210', 'Togo', 'TG', 'TGO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('211', 'Tokelau', 'TK', 'TKL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('212', 'Tonga', 'TO', 'TON', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('213', 'Trinidad and Tobago', 'TT', 'TTO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('214', 'Tunisia', 'TN', 'TUN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('215', 'Turkey', 'TR', 'TUR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('216', 'Turkmenistan', 'TM', 'TKM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('218', 'Tuvalu', 'TV', 'TUV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('219', 'Uganda', 'UG', 'UGA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('220', 'Ukraine', 'UA', 'UKR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('221', 'United Arab Emirates', 'AE', 'ARE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('222', 'United Kingdom', 'GB', 'GBR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('223', 'United States', 'US', 'USA', '2');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('225', 'Uruguay', 'UY', 'URY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('226', 'Uzbekistan', 'UZ', 'UZB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('227', 'Vanuatu', 'VU', 'VUT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('229', 'Venezuela', 'VE', 'VEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('230', 'Viet Nam', 'VN', 'VNM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('231', 'Virgin Islands (British)', 'VG', 'VGB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('234', 'Western Sahara', 'EH', 'ESH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('235', 'Yemen', 'YE', 'YEM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('236', 'Yugoslavia', 'YU', 'YUG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('237', 'Zaire', 'ZR', 'ZAR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('238', 'Zambia', 'ZM', 'ZMB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('239', 'Zimbabwe', 'ZW', 'ZWE', '1');
drop table if exists currencies;
create table currencies (
  currencies_id int(11) not null auto_increment,
  title varchar(32) not null ,
  code char(3) not null ,
  symbol_left varchar(12) ,
  symbol_right varchar(12) ,
  decimal_point char(1) ,
  thousands_point char(1) ,
  decimal_places char(1) ,
  value float(13,8) ,
  last_updated datetime ,
  PRIMARY KEY (currencies_id)
);

insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('3', 'Polski z�oty', 'PLN', '', 'z�', '.', '', '2', '1.00000000', '2007-07-02 18:43:46');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('4', 'Euro', 'EUR', '', 'EUR', '.', '', '2', '0.26656899', '2007-07-02 18:43:49');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('5', 'US Dolar', 'USD', '$', '', '.', '', '2', '0.35991901', '2007-07-02 18:43:49');
drop table if exists customers;
create table customers (
  customers_id int(11) not null auto_increment,
  purchased_without_account tinyint(1) unsigned default '0' not null ,
  customers_gender char(1) not null ,
  customers_firstname varchar(32) not null ,
  customers_lastname varchar(32) not null ,
  customers_dob datetime default '0000-00-00 00:00:00' not null ,
  customers_email_address varchar(96) not null ,
  customers_default_address_id int(11) ,
  customers_telephone varchar(32) not null ,
  customers_fax varchar(32) ,
  customers_password varchar(40) not null ,
  customers_newsletter char(1) ,
  customers_discount decimal(8,2) default '0.00' not null ,
  customers_groups_id int(11) default '1' not null ,
  customers_status int(1) default '0' not null ,
  customers_notes longtext ,
  customers_cell varchar(64) ,
  customers_sms_notify tinyint(1) unsigned default '0' not null ,
  PRIMARY KEY (customers_id),
  KEY purchased_without_account (purchased_without_account)
);

drop table if exists customers_basket;
create table customers_basket (
  customers_basket_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id tinytext not null ,
  customers_basket_quantity int(2) default '0' not null ,
  final_price decimal(15,4) ,
  customers_basket_date_added varchar(8) ,
  PRIMARY KEY (customers_basket_id)
);

drop table if exists customers_basket_attributes;
create table customers_basket_attributes (
  customers_basket_attributes_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id tinytext not null ,
  products_options_id int(11) default '0' not null ,
  products_options_value_id int(11) default '0' not null ,
  PRIMARY KEY (customers_basket_attributes_id)
);

drop table if exists customers_groups;
create table customers_groups (
  customers_groups_id int(11) not null auto_increment,
  customers_groups_name varchar(32) not null ,
  customers_groups_discount decimal(8,2) default '0.00' not null ,
  customers_groups_price int(11) default '1' not null ,
  PRIMARY KEY (customers_groups_id)
);

insert into customers_groups (customers_groups_id, customers_groups_name, customers_groups_discount, customers_groups_price) values ('1', 'Domy�lna', '0.00', '1');
insert into customers_groups (customers_groups_id, customers_groups_name, customers_groups_discount, customers_groups_price) values ('2', 'Hurtownicy', '-10.00', '1');
drop table if exists customers_info;
create table customers_info (
  customers_info_id int(11) default '0' not null ,
  customers_info_date_of_last_logon datetime ,
  customers_info_number_of_logons int(5) ,
  customers_info_date_account_created datetime ,
  customers_info_date_account_last_modified datetime ,
  global_product_notifications int(1) default '0' ,
  PRIMARY KEY (customers_info_id)
);

drop table if exists customers_wishlist;
create table customers_wishlist (
  products_id tinytext not null ,
  customers_id int(13) default '0' not null ,
  KEY customers_id (customers_id)
);

insert into customers_wishlist (products_id, customers_id) values ('4', '1');
insert into customers_wishlist (products_id, customers_id) values ('4', '2');
insert into customers_wishlist (products_id, customers_id) values ('4', '3');
insert into customers_wishlist (products_id, customers_id) values ('3', '3');
insert into customers_wishlist (products_id, customers_id) values ('3', '2');
drop table if exists customers_wishlist_attributes;
create table customers_wishlist_attributes (
  customers_wishlist_attributes_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id tinytext not null ,
  products_options_id int(11) default '0' not null ,
  products_options_value_id int(11) default '0' not null ,
  PRIMARY KEY (customers_wishlist_attributes_id),
  KEY customers_id (customers_id)
);

drop table if exists featured;
create table featured (
  featured_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  featured_date_added datetime ,
  featured_last_modified datetime ,
  expires_date datetime ,
  date_status_change datetime ,
  status int(1) default '1' ,
  PRIMARY KEY (featured_id),
  KEY products_id (products_id),
  KEY status (status)
);

insert into featured (featured_id, products_id, featured_date_added, featured_last_modified, expires_date, date_status_change, status) values ('1', '1', '2007-10-16 18:50:42', NULL, '0000-00-00 00:00:00', NULL, '1');
drop table if exists geo_zones;
create table geo_zones (
  geo_zone_id int(11) not null auto_increment,
  geo_zone_name varchar(32) not null ,
  geo_zone_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (geo_zone_id)
);

insert into geo_zones (geo_zone_id, geo_zone_name, geo_zone_description, last_modified, date_added) values ('1', 'Polska', '', NULL, '2007-07-17 06:46:19');
drop table if exists information;
create table information (
  information_id tinyint(3) unsigned not null auto_increment,
  visible enum('1','0') default '1' not null ,
  v_order tinyint(3) unsigned default '0' not null ,
  info_title varchar(255) not null ,
  description text not null ,
  languages_id int(11) default '0' not null ,
  PRIMARY KEY (information_id, languages_id)
);

insert into information (information_id, visible, v_order, info_title, description, languages_id) values ('3', '1', '2', 'Regulamin', 'Tutaj wpisz regulamin sklepu.
', '4');
insert into information (information_id, visible, v_order, info_title, description, languages_id) values ('2', '1', '3', 'Polityka prywatno�ci', 'Tutaj wpisz informacje dotycz�ce polityki prywatno�ci.', '4');
insert into information (information_id, visible, v_order, info_title, description, languages_id) values ('4', '1', '4', 'Wysy�ka i zwroty', 'Tutaj wpisz informacje dotycz�ce wysy�ki oraz zwrotu towar�w.', '4');
insert into information (information_id, visible, v_order, info_title, description, languages_id) values ('5', '1', '1', 'O nas', 'W tym miejscu napisz kilka s�&oacute;w o swojej dzia�alnosci.<br /> ', '4');
drop table if exists languages;
create table languages (
  languages_id int(11) not null auto_increment,
  name varchar(32) not null ,
  code char(2) not null ,
  image varchar(64) ,
  directory varchar(32) ,
  sort_order int(3) ,
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);

insert into languages (languages_id, name, code, image, directory, sort_order) values ('4', 'Polski', 'pl', 'icon.gif', 'polish', '0');
drop table if exists manudiscount;
create table manudiscount (
  manudiscount_id int(11) not null auto_increment,
  manudiscount_name varchar(128) not null ,
  manudiscount_groups_id int(11) default '0' not null ,
  manudiscount_customers_id int(11) default '0' not null ,
  manudiscount_manufacturers_id int(11) default '0' not null ,
  manudiscount_discount decimal(8,2) default '0.00' not null ,
  PRIMARY KEY (manudiscount_id)
);

drop table if exists manufacturers;
create table manufacturers (
  manufacturers_id int(11) not null auto_increment,
  manufacturers_name varchar(64) not null ,
  manufacturers_image varchar(64) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('1', 'Creative', NULL, '2007-10-16 18:41:13', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('2', 'ASUS', NULL, '2007-10-16 18:43:36', '2007-10-16 18:43:56');
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('3', 'Logitech', NULL, '2007-10-16 18:45:50', NULL);
drop table if exists manufacturers_info;
create table manufacturers_info (
  manufacturers_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  manufacturers_url varchar(255) not null ,
  url_clicked int(5) default '0' not null ,
  date_last_click datetime ,
  PRIMARY KEY (manufacturers_id, languages_id)
);

insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('1', '4', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('2', '4', 'www.asus.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('3', '4', '', '0', NULL);
drop table if exists newsdesk;
create table newsdesk (
  newsdesk_id int(11) not null auto_increment,
  newsdesk_image varchar(64) ,
  newsdesk_image_two varchar(64) ,
  newsdesk_image_three varchar(64) ,
  newsdesk_date_added datetime default '0000-00-00 00:00:00' not null ,
  newsdesk_last_modified datetime ,
  newsdesk_date_available datetime ,
  newsdesk_status tinyint(1) default '0' not null ,
  newsdesk_sticky tinyint(1) default '1' not null ,
  PRIMARY KEY (newsdesk_id),
  KEY idx_newsdesk_date_added (newsdesk_date_added)
);

insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('34', 'iStock_000009132308XSmall.jpg', 'audio_video.jpg', 'fotografia.jpg', '2009-12-29 17:54:26', '2010-01-04 20:28:46', NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('35', 'iStock_000005931922XSmall.jpg', '', '', '2009-12-30 13:28:05', '2010-01-04 20:28:09', NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('36', '', '', '', '2010-01-04 21:42:22', '2010-01-04 21:46:46', NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('37', '', '', '', '2010-01-04 21:43:30', NULL, NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('38', '', '', '', '2010-01-04 21:44:48', '2010-01-04 21:45:00', NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('39', '', '', '', '2010-01-04 21:45:57', '2010-01-04 21:47:24', NULL, '1', '0');
insert into newsdesk (newsdesk_id, newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_last_modified, newsdesk_date_available, newsdesk_status, newsdesk_sticky) values ('40', 'mysklep_203.gif', '', '', '2010-01-05 09:34:12', '2010-01-05 09:35:29', NULL, '1', '0');
drop table if exists newsdesk_categories;
create table newsdesk_categories (
  categories_id int(11) not null auto_increment,
  categories_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  date_added datetime ,
  last_modified datetime ,
  catagory_status tinyint(1) default '1' not null ,
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
);

insert into newsdesk_categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified, catagory_status) values ('1', NULL, '0', '1', '2006-10-25 23:27:01', '2009-12-30 14:21:47', '1');
insert into newsdesk_categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified, catagory_status) values ('2', NULL, '0', '999', '2010-01-05 09:30:14', NULL, '1');
drop table if exists newsdesk_categories_description;
create table newsdesk_categories_description (
  categories_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  categories_name varchar(32) not null ,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

insert into newsdesk_categories_description (categories_id, language_id, categories_name) values ('1', '4', 'Newsy');
insert into newsdesk_categories_description (categories_id, language_id, categories_name) values ('2', '4', 'Wiadomo�ci');
drop table if exists newsdesk_configuration;
create table newsdesk_configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(64) not null ,
  configuration_key varchar(64) not null ,
  configuration_value varchar(255) not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) default '0' not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  use_function varchar(255) ,
  set_function varchar(255) ,
  PRIMARY KEY (configuration_id)
);

insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1', 'Wyniki wyszukiwania', 'MAX_DISPLAY_NEWSDESK_SEARCH_RESULTS', '20', 'Ilo�� wyszukiwanych artyku��w', '1', '1', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2', 'Ilo�� artyku��w na stronie', 'MAX_DISPLAY_NEWSDESK_PAGE_LINKS', '10', 'Ile pokaza� artyku��w na pojedy�czej stronie?', '1', '2', '2004-11-11 12:46:14', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3', 'Pokazuj tytu� artyku�u', 'NEWSDESK_ARTICLE_NAME', '1', 'Czy pokaza� tytu� artyku�u? (0=nie lub nr do sortowania na li�cie)', '1', '3', '2004-11-11 12:44:55', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('4', 'Pokazuj wst�p artyku�u', 'NEWSDESK_ARTICLE_SHORTTEXT', '0', 'Czy pokaza� wst�p artyku�u? (0=nie lub nr do sortowania na li�cie)', '1', '4', '2004-11-11 12:46:04', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('5', 'Pokazuj tre�� artyku�u', 'NEWSDESK_ARTICLE_DESCRIPTION', '0', 'Czy pokaza� tre�� artyku�u? (0=nie lub nr do sortowania na li�cie)', '1', '5', '2004-05-10 13:28:43', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('6', 'Pokazuj dat�', 'NEWSDESK_DATE_AVAILABLE', '2', 'Czy pokaza� dat� utworzenia artyku�u? (0=nie lub nr do sortowania na li�cie)', '1', '6', '2004-11-11 12:46:08', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('7', 'Pokazuj URL artyku�u', 'NEWSDESK_ARTICLE_URL', '0', 'Czy pokaza� odno�nik do zewn�trznej strony WWW? (0=nie lub nr do sortowania na li�cie)', '1', '7', '2004-11-11 12:44:38', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('8', 'Pokazuj nazw� URL', 'NEWSDESK_ARTICLE_URL_NAME', '0', 'Czy pokaza� nazw� odno�nika do zewn�trznej strony WWW? (0=nie lub nr do sortowania na li�cie)', '1', '8', '2004-11-11 12:44:44', '2004-05-26 17:07:00', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('9', 'Pokazuj status artyku�u', 'NEWSDESK_STATUS', '0', 'Czy pokaza� status artyku�u? (0=nie lub nr do sortowania na li�cie)', '1', '9', '2004-11-11 12:43:32', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('10', 'Pokazuj Zdj�cie nr 1', 'NEWSDESK_IMAGE', '0', 'Czy pokaza� Zdj�cie nr 1? (0=nie lub nr do sortowania na li�cie)', '1', '10', '2004-11-11 13:28:59', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('11', 'Pokazuj Zdj�cie nr 2', 'NEWSDESK_IMAGE_TWO', '0', 'Czy pokaza� Zdj�cie nr 2? (0=nie lub nr do sortowania na li�cie)', '1', '11', '2004-05-10 13:29:01', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('12', 'Pokazuj Zdj�cie nr 3', 'NEWSDESK_IMAGE_THREE', '0', 'Czy pokaza� Zdj�cie nr 3? (0=nie lub nr do sortowania na li�cie)', '1', '12', '2004-05-10 13:29:06', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('14', 'Pasek nawigacyjny Poprzedni/Nast�pny', 'NEWSDESK_PREV_NEXT_BAR_LOCATION', '1', 'Czy pokaza� pasek nawigacyjny Poprzedni/Nast�pny? (0=nie, 1=tak)', '1', '14', '2004-11-11 12:54:36', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('15', 'Ilo�� artyku��w na stronie g��wnej', 'MAX_DISPLAY_NEWSDESK_NEWS', '5', 'Ile artyku��w pokaza� na stronie g��wnej sklepu?', '2', '1', '2010-01-04 21:39:30', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('16', 'Ilo�� artyku��w w boxie Aktualno�ci', 'LATEST_DISPLAY_NEWSDESK_NEWS', '5', 'Ile artyku��w pokaza� w boxie Aktualno�ci?', '2', '2', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('17', 'Box Aktualno�ci', 'DISPLAY_LATEST_NEWS_BOX', '1', 'Czy pokaza� box Aktualno�ci (0=nie,1=tak)', '2', '3', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('18', 'Box Kategorie artyku��w', 'DISPLAY_NEWS_CATAGORY_BOX', '1', 'Czy pokaza� box Kategorie artyku��w? (0=nie,1=tak)', '2', '4', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('19', 'Pokazuj ilo�� ods�on artyku�u', 'DISPLAY_NEWSDESK_VIEWCOUNT', '0', 'Czy pokaza� ilo�� ods�on artyku�u? (0=nie; 1=tak)', '2', '5', '2008-01-23 17:32:25', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('20', 'Pokazuj odno�nik \"wi�cej\"', 'DISPLAY_NEWSDESK_READMORE', '1', 'Czy pokaza� odno�nik \"wi�cej\"? (0=nie; 1=tak)', '2', '6', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('21', 'Pokazuj wst�p artuku�u', 'DISPLAY_NEWSDESK_SUMMARY', '0', 'Czy pokaza� wst�p artyku�u? (0=nie; 1=tak)', '2', '7', '2009-12-30 14:14:27', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('22', 'Pokazuj tytu� artyku�u', 'DISPLAY_NEWSDESK_HEADLINE', '1', 'Czy pokaza� tytu� artyku�u? (0=nie; 1=tak)', '2', '8', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('23', 'Pokazuj dat�', 'DISPLAY_NEWSDESK_DATE', '1', 'Czy pokaza� dat� utworzenia artyku�u? (0=nie; 1=tak)', '2', '9', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('24', 'Pokazuj Zdj�cie nr 1', 'DISPLAY_NEWSDESK_IMAGE', '1', 'Czy pokaza� Zdj�cie nr 1? (0=disable; 1=enable)', '2', '10', NULL, '2003-03-03 11:59:47', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('25', 'Pokazuj Zdj�cie nr 2', 'DISPLAY_NEWSDESK_IMAGE_TWO', '1', 'Czy pokaza� Zdj�cie nr 2? (0=nie; 1=tak)', '2', '11', '2004-11-11 13:27:03', '2003-03-03 11:59:47', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('26', 'Pokazuj Zdj�cie nr 3', 'DISPLAY_NEWSDESK_IMAGE_THREE', '1', 'Czy pokaza� Zdj�cie nr 3? (0=nie; 1=tak)', '2', '12', '2004-11-11 13:27:08', '2003-03-03 11:59:47', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('27', 'Pokazuj komentarze', 'DISPLAY_NEWSDESK_REVIEWS', '0', 'Czy pokazywa� komentarze do artyku��w? (0=nie; 1=tak)', '3', '1', '2008-04-17 16:22:02', '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('28', 'Ilo�� nowych komentarzy', 'MAX_DISPLAY_NEW_REVIEWS', '10', 'Maksymalna ilo�� nowych komentarzy do wy�wietlenia', '3', '2', NULL, '2003-02-16 02:08:36', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('29', 'Pokazuj tytu� artyku�u', 'STICKY_ARTICLE_NAME', '1', 'Czy pokaza� tytu� artyku�u? (0=nie; 1=tak)', '4', '1', NULL, '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('30', 'Pokazuj wst�p do artyku�u', 'STICKY_ARTICLE_SHORTTEXT', '1', 'Czy pokaza� wst�p do artyku�u? (0=nie; 1=tak)', '4', '2', NULL, '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('31', 'Pokazuj tre�� artuku�u', 'STICKY_ARTICLE_DESCRIPTION', '0', 'Czy pokaza� tre�� artyku�u? (0=nie; 1=tak)', '4', '3', '2004-11-11 13:08:52', '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('32', 'Pokazuj ilo�� ods�on artyku�u', 'STICKY_NEWSDESK_VIEWCOUNT', '0', 'Czy pokaza� ilo�� ods�on artyku�u? (0=nie; 1=tak)', '4', '4', '2007-11-23 13:36:16', '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('33', 'Pokazuj odno�nik \"wi�cej\"', 'STICKY_NEWSDESK_READMORE', '1', 'Czy pokaza� odno�nik \"wi�cej\"? (0=nie; 1=tak)', '4', '5', NULL, '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('34', 'Pokazuj dat�', 'STICKY_DATE_ADDED', '1', 'Czy pokaza� dat� utworzenia artyku�u? (0=nie; 1=tak)', '4', '6', '2003-03-02 00:49:54', '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('35', 'Pokazuj URL artyku�u', 'STICKY_ARTICLE_URL', '0', 'Czy pokaza� URL do zewn�trznej strony WWW? (0=nie; 1=tak)', '4', '7', '2004-05-26 17:13:50', '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('36', 'Pokazuj nazw� URL', 'STICKY_ARTICLE_URL_NAME', '1', 'Czy pokaza� nazw� URL do zewn�trznej strony WWW? (0=nie; 1=tak)', '4', '8', '2003-03-02 00:51:00', '2003-03-02 00:50:00', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('37', 'Pokazuj Zdj�cie nr 1', 'STICKY_IMAGE', '1', 'Czy pokaza� Zdj�cie nr 1? (0=nie; 1=tak)', '4', '9', '2003-03-02 00:50:14', '2003-03-02 00:47:21', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('38', 'Pokazuj Zdj�cie nr 2', 'STICKY_IMAGE_TWO', '1', 'Czy pokaza� Zdj�cie nr 2? (0=nie; 1=tak)', '4', '10', NULL, '2003-03-03 23:10:34', NULL, NULL);
insert into newsdesk_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('39', 'Pokazuj Zdj�cie nr 3', 'STICKY_IMAGE_THREE', '1', 'Czy pokaza� Zdj�cie nr 3? (0=nie; 1=tak)', '4', '11', NULL, '2003-03-03 23:10:34', NULL, NULL);
drop table if exists newsdesk_configuration_group;
create table newsdesk_configuration_group (
  configuration_group_id int(11) not null auto_increment,
  configuration_group_title varchar(64) not null ,
  configuration_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  PRIMARY KEY (configuration_group_id)
);

insert into newsdesk_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('1', 'Wygl�d listy artyku��w', '', '2', '1');
insert into newsdesk_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('2', 'Opcje artyku��w', '', '1', '1');
insert into newsdesk_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('3', 'Opcje komentarzy', '', '3', '1');
insert into newsdesk_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('4', 'Opcje Sticky', '', '4', '1');
drop table if exists newsdesk_description;
create table newsdesk_description (
  newsdesk_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  newsdesk_article_name varchar(64) not null ,
  newsdesk_article_description text ,
  newsdesk_article_shorttext text ,
  newsdesk_article_url varchar(255) ,
  newsdesk_article_url_name varchar(255) ,
  newsdesk_article_viewed int(5) default '0' ,
  newsdesk_image_text text ,
  newsdesk_image_text_two text ,
  newsdesk_image_text_three text ,
  PRIMARY KEY (newsdesk_id, language_id),
  KEY newsdesk_article_name (newsdesk_article_name)
);

insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('34', '4', 'Dlaczego warto pozycjonowa� sklep?', '<p style=\"text-align: justify;\"><strong>Pozycjonowanie </strong>stron w wyszukiwarkach internetowych to jeden z najwa�niejszych sk�adnik&oacute;w skutecznego marketingu internetowego. Pozycjonowanie to r&oacute;wnie� jedna z najskuteczniejszych i najta�szych metod dotarcia do setek a nawet tysi�cy klient&oacute;w, kt&oacute;rzy codziennie pytaj� wyszukiwarki o Twoje produkty lub us�ugi.<br /> <br /> Odk�d wyszukiwarki internetowe sta�y si� podstawowym i bezpo�rednim narz�dziem internaut&oacute;w poszukuj�cych informacji, wysoka pozycja w wynikach wyszukiwania jest bardzo cz�sto wyznacznikiem \"by� albo nie by�\" dla firm. Twoja pozycja w wyszukiwarce przek�ada si� bezpo�rednio na zyski.<br /> <br /> <br /> Ludzie s� z natury leniwi - lub inaczej m&oacute;wi�c po prostu wygodni.<br /> <br /> Maj� tendencj� do patrzenia tylko na pierwsze 10-20 wynik&oacute;w wyszukiwania (czyli najcz�ciej jedn� lub dwie strony). Dlatego tak wa�ne jest, aby Twoja strona znalaz�a si� w�a�nie w tej �cis�ej czo�&oacute;wce.<br /> <br /> Oferta pozycjonowania obejmuje swoim zakresem kompleksowe dzia�anie na rzecz zwi�kszania pozycji Twojej strony w wyszukiwarkach. Wszystkie metody z jakich korzystamy s� legalne i zapewniaj� wysok� skuteczno��.</p>', '<p style=\"text-align: justify;\"><strong>Pozycjonowanie </strong>stron w wyszukiwarkach internetowych to jeden z najwa�niejszych sk�adnik&oacute;w skutecznego marketingu internetowego. Pozycjonowanie to r&oacute;wnie� jedna z najskuteczniejszych i najta�szych metod dotarcia do setek a nawet tysi�cy klient&oacute;w, kt&oacute;rzy codziennie pytaj� wyszukiwarki o Twoje produkty lub us�ugi.</p>', '', '', '41', 'Zdj�cie #1', 'Zdj�cie #2', 'Zdj�cie #3');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('36', '4', 'Czym charakteryzuje si� nasze oprogramowanie?', '<p style=\"text-align: justify;\">Oprogramowanie sklepu <strong>Mysklep </strong>spe�nia wszystkie podstawowe warunki, kt&oacute;re pozwalaj� w swobodny spos&oacute;b prowadzi� sprzeda� r&oacute;�nego rodzaju towar&oacute;w czy us�ug np.: art. biurowych, spo�ywczych, mebli, cz�ci samochodowych, ksi��ek, ram, obraz&oacute;w, lek&oacute;w, oprogramowania, odzie�y, obuwia, art.dekoracyjnych, broni, elektroniki i komputer&oacute;w, sprz�tu rtv i agd oraz wielu innych zar&oacute;wno w formie detalicznej jak i hurtowej.</p>
<p style=\"text-align: justify;\"><strong>Mysklep </strong>zosta� przygotowany w oparciu o najpopularniejszy skrypt sklepu internetowego OsCommerce z kt&oacute;rego, z powodzeniem, korzystaj� miliony u�ytkownik&oacute;w na ca�ym &oelig;wiecie!<br /><br />W stosunku do oryginalnej wersji OsCommerce, Mysklep zosta� wzbogacony o przydatne funkcje i potrzebne zabezpieczenia, obj�ty programem pe�nego wsparcia i bezp�atnych aktualizacji dla zarejestrowanych u�ytkownik&oacute;w, wyczyszczony i skorygowany pod wzgl�dem wyst�puj�cych b��d&oacute;w, oraz w pe�ni przystosowany do pracy w wersji polsko-j�zycznej.<br /><br />Dzi�ki du�ej swobodzie w konfigurowaniu dowolnych p&oacute;l opisowych dla towar&oacute;w, mo�liwo�ci prezentacji wielu r&oacute;�nych zdj�� dla jednego produktu a tak�e, mi�dzy innymi, wsp&oacute;�pracy z arkuszem kalkulacyjnym czy wbudowanej opcji szybkiej aktualizacji oferty, i innych przydatnych narz�dzi u�ytkownik ma mo�liwo�� intuicyjnego zarz�dzania produktami oraz bezpiecznej edycji i swobodnego nadzoru nad oprogramowaniem sklepu.<br />Mysklep Osc charakteryzuje przede wszystkim bardzo du�a elastyczno�� pod wzgl�dem mo�liwo&oelig;�ci jego rozbudowy, integracji z oprogramowaniem zewn�trznym czy dostosowaniem do indywidualnych potrzeb u�ytkownika, tak pod wzgl�dem funkcji jak i wygl�du, co czyni z niego nowoczesne , bezpieczne i doskona�e narz�dzie do handlu internetowego.<br /><strong><br />Przewaga sklep&oacute;w opartych o OsCommerce nad konkurencyjnymi produktami jest oczywista.</strong></p>', '<p style=\"text-align: justify;\">Oprogramowanie sklepu <strong>Mysklep </strong>spe�nia wszystkie podstawowe warunki, kt&oacute;re pozwalaj� w swobodny spos&oacute;b prowadzi� sprzeda� r&oacute;�nego rodzaju towar&oacute;w czy us�ug np.: art. biurowych, spo�ywczych, mebli, cz�ci samochodowych, ksi��ek, ram, obraz&oacute;w, lek&oacute;w, oprogramowania, odzie�y, obuwia, art.dekoracyjnych, broni, elektroniki i komputer&oacute;w, sprz�tu rtv i agd oraz wielu innych zar&oacute;wno w formie detalicznej jak i hurtowej.</p>', '', '', '1', '', '', '');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('37', '4', 'Jak przechowujemy Twoje dane?', '<p style=\"text-align: justify;\">Zgodnie z ustaw� z dnia 29 sierpnia 1997 o ochronie danych    osobowych informujemy, �e dane osobowe s� przetwarzane w celu realizacji zam&oacute;wienia,    prowadzenia akcji promocyjnych i reklamowych za zgod� u�ytkownika wyra�on� zaznaczeniem    pola biuletyn w formularzu rejestracyjnym z zachowaniem wymog&oacute;w zabezpieczenia    danych okre�lonych w przepisach o ochronie danych osobowych. <br /> Po z�o�eniu zam&oacute;wienia dane osobowe s� udost�pniane upowa�nionym pracownikom,    wy��cznie w celu realizacji zam&oacute;wienia. Ka�demu przys�uguje prawo wgl�du do    swoich danych, poprawienia oraz ��dania zaprzestania wykorzystywania ich przez    w�a�ciciela serwisu, a tak�e usuni�cia konta.</p>', '<p style=\"text-align: justify;\">Zgodnie z ustaw� z dnia 29 sierpnia 1997 o ochronie danych    osobowych informujemy, �e dane osobowe s� przetwarzane w celu realizacji zam&oacute;wienia,    prowadzenia akcji promocyjnych i reklamowych za zgod� u�ytkownika wyra�on� zaznaczeniem    pola biuletyn w formularzu rejestracyjnym z zachowaniem wymog&oacute;w zabezpieczenia    danych okre�lonych w przepisach o ochronie danych osobowych.</p>', '', '', '1', '', '', '');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('38', '4', 'Co nale�y wiedzie� o bezpiecze�stwie danych?', '<p style=\"text-align: justify;\">Profilaktyka bezpiecznej pracy z oprogramowaniem Mysklep opiera si� na kilku podstawowych czynno�ciach wymienionych poni�ej:<br /><br /> 1) Je�li jeszcze tego nie zrobi�e� - aktywuj dodatkowe has�o na ca�ym katalogu admin.<br /> 2) Aktualizuj oprogramowanie sklepu dost�pnymi �atkami lub wykonaj jego upgrade do najnowszej wersji.<br /> 3) Wykonuj kopi� bazy danych z cz�stotliwo�ci� co najmniej raz na 7 dni.<br /> 4) Wykonuj kopi� wszystkich plik&oacute;w sklepu z cz�stotliwo�ci� co najmniej raz na kwarta�.<br /> 5) Nigdy NIE zapisuj has�a do konta FTP w Programie (np. Total Commander).<br /> 6) Je�li mo�esz korzystaj z bezpiecznego po��czenia sFTP ( port 22 ).<br /> 7) Na komputerach kt&oacute;rych u�ywasz do obs�ugi sklepu u�ywaj zawsze pakietu antywirusowego aktualizowanego online.<br /> 8) Je�li aktywowa�e� opcje blokady konta ftp uaktywnij dost�p do ftp TYLKO WTEDY gdy tego potrzebujesz.<br /> 9) Has�a z jakich korzystasz podczas pracy ze sklepem wymieniaj �rednio co kilka tygodni.<br /> 10) Nie udost�pniaj �adnych danych dost�powych do sklepu nieznanym osobom trzecim a je�eli musisz to pami�taj aby po tym fakcie bezzw�ocznie wymieni� has�a na nowe. <br /><br /> Monit oprogramowania i czynno�ci zwi�zane z usuni�ciem ew. infekcji jest bardzo kosztowny - warto zatem pami�ta� o podstawach BHP w pracy ze swoim sklepem. <br /><br /> Je�li chc� Pa�stwo zasi�gn�� dodatkowych informacji lub uzyska� pomoc na temat BEZP�ATNYCH sposob&oacute;w zabezpieczenia swojego sklepu zapraszamy do dzia�u FAQ, czekamy na zg�oszenia przez formularz pomocy lub pod numerem infolinii 801 011 643.</p>', '<p style=\"text-align: justify;\">Profilaktyka bezpiecznej pracy z oprogramowaniem Mysklep opiera si� na kilku podstawowych czynno�ciach wymienionych poni�ej:</p>', '', '', '1', '', '', '');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('35', '4', 'Dlaczego warto wybra� Mysklep?', '<p style=\"text-align: justify;\">Oprogramowanie <strong>Mysklep Comfort 2.4</strong> i <strong>Mysklep Biznes 3.0</strong> to proste w zarz�dzaniu, szybkie i stabilne sklepy internetowe, dzi�ki kt&oacute;rym b�dziesz m&oacute;g� bezpiecznie poprowadzi� i rozwin�� sw&oacute;j Internetowy Biznes. Mysklep Comfort i Mysklep Biznes zosta�y przygotowane w oparciu o najpopularniejszy<br /> sklep internetowy<br /> OsCommerce, kt&oacute;re w stosunku do jego oryginalnej wersji zosta�y wzbogacone o przydatne funkcje, wyczyszczone i skorygowany pod wzgl�dem najbardziej uci��liwych b��d&oacute;w, przystosowane do pracy w wersji polsko-j�zycznej oraz obj�teprogramem pe�nego wspracia technicznego dla zarejestrowanych u�ytkownik&oacute;w.</p>', '<p>Oprogramowanie <strong>Mysklep Comfort 2.4</strong> i <strong>Mysklep Biznes 3.0</strong> to proste w zarz�dzaniu, szybkie i stabilne sklepy internetowe, dzi�ki kt&oacute;rym b�dziesz m&oacute;g� bezpiecznie poprowadzi� i rozwin�� sw&oacute;j Internetowy Biznes.</p>', '', '', '32', '', '', '');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('39', '4', 'Integracja z Insert?', '<p style=\"text-align: justify;\">Tak. Oprogramowanie Mysklep Osc ju� w podstawowej wersji oferuje mo�liwo�� integracji z oprogramowaniem Insert oscGT.<br /><br /> Integracja odbywa si� poprzez instalacj� plik&oacute;w w katalogu sklepu kt&oacute;re u�ywane s� do dwustronnego przesy�ania  danych. W bazie danych sklepu instalowane sa dodatkowe tabele konfiguracyjne i tabele przej�ciowe u�ywane przez Subiekta. <br /><br /> Po integracji istnieje mo�liwo�� zaimportowania oferty sklepu do magazynu Subiekta a je�eli w bazie Subiekta istnieje ju� oferta mo�e zosta� ona przes�ana do sklepu z mo�liwo�ci� zdefiniowania podzia�u na kategorie inne ni� grupy w subiekcie. System synchronizuje zmiany opis&oacute;w, cen i stan&oacute;w magazynowych produkt&oacute;w znajduj�cych si� w subiekcie, pobiera informacje ze sklepu odno�nie nowych klient&oacute;w i zam&oacute;wie� i dodaje/aktualizuje je w bazie Subiekta jako nowe zam&oacute;wienia i nowych kontrahent&oacute;w . Synchronizacj� mo�na wykonywa� na ��danie, lub w ustalonych odst�pach czasu tak wszystkich jak i wybranych element&oacute;w ( zdj�cia, klienci, opisy, stany magazynowe, zam&oacute;wienia itd)</p>', '<p style=\"text-align: justify;\">Tak. Oprogramowanie Mysklep Osc ju� w podstawowej wersji oferuje mo�liwo�� integracji z oprogramowaniem Insert oscG.</p>', '', '', '3', '', '', '');
insert into newsdesk_description (newsdesk_id, language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_shorttext, newsdesk_article_url, newsdesk_article_url_name, newsdesk_article_viewed, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three) values ('40', '4', 'Wielka promocja!', '<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar nunc vel est porttitor sed eleifend diam tincidunt. Aliquam varius consequat vestibulum. Nullam auctor sem at quam hendrerit sed fringilla orci tempus. Nam quis justo massa. Maecenas egestas tempus nisl vitae viverra. Morbi eget purus eget neque aliquam consectetur. Duis lacus neque, tincidunt sed accumsan vel, vehicula sit amet erat. Fusce tellus elit, pretium eget lobortis et, scelerisque nec lectus. Nunc egestas blandit enim et sollicitudin. Vivamus vestibulum diam vel dui convallis sit amet interdum risus viverra.</p>
<p style=\"text-align: justify;\">Ut in tellus lacus. Mauris tempor elit sit amet arcu sollicitudin viverra. Mauris congue sollicitudin augue, id molestie justo congue ac. Nunc volutpat imperdiet felis ut laoreet. Nam sed luctus sem. Mauris imperdiet lacus id diam sollicitudin sed consectetur diam ornare. Fusce eget nulla diam, ac dictum lectus. Maecenas iaculis laoreet eleifend. Donec vel velit risus. Sed fringilla dolor id nulla congue venenatis a ut mi.</p>
<p style=\"text-align: justify;\">Vestibulum vel tortor ipsum, at tempor metus. Quisque aliquam nisi vitae ligula gravida tincidunt. Aliquam id risus id sapien venenatis dapibus. Cras rhoncus ornare tempus. In hac habitasse platea dictumst. Proin in neque ut libero varius pulvinar in et nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec eu nulla id leo viverra fringilla. Donec hendrerit est quis eros tempus varius. Proin euismod faucibus nisl, aliquet gravida neque tempus in. Proin vel leo quam, vel eleifend neque. Sed sem nisi, fringilla ut feugiat vitae, fringilla vel sem. Nam sit amet lacus eu nibh facilisis pharetra. Duis tortor ligula, ultricies nec viverra at, malesuada id ipsum. Etiam dictum ullamcorper tincidunt. Aenean iaculis, augue ut porttitor tempor, nisl augue luctus nisl, vitae pretium leo lacus non libero.</p>
<p style=\"text-align: justify;\">Vestibulum pretium, purus quis iaculis laoreet, leo nibh mollis elit, ac volutpat libero dui id diam. Suspendisse dignissim dapibus felis elementum gravida. Maecenas ullamcorper adipiscing hendrerit. In hac habitasse platea dictumst. Nullam commodo elementum dui, vel tristique urna euismod at. Aliquam massa magna, malesuada a interdum sed, bibendum mollis est. Donec in faucibus tellus. Nullam dignissim laoreet sem sit amet consequat. Praesent non lacus ut nisi sagittis posuere. Phasellus sit amet dui ac massa blandit faucibus. Mauris nunc urna, varius ut posuere in, pellentesque a sapien.</p>', '<p><span style=\"color: #800000;\"><span style=\"font-size: large;\"><strong>Wielka promocja!!</strong></span></span></p>
<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar nunc vel est porttitor sed eleifend diam tincidunt. Aliquam varius consequat vestibulum. Nullam auctor sem at quam hendrerit sed fringilla orci tempus. Nam quis justo massa. Maecenas egestas tempus nisl vitae viverra. Morbi eget purus eget neque aliquam consectetur.</p>', '', '', '1', '', '', '');
drop table if exists newsdesk_reviews;
create table newsdesk_reviews (
  reviews_id int(11) not null auto_increment,
  newsdesk_id int(11) default '0' not null ,
  customers_id int(11) ,
  customers_name varchar(64) not null ,
  reviews_rating int(1) ,
  date_added datetime ,
  last_modified datetime ,
  reviews_read int(5) default '0' not null ,
  approved tinyint(3) unsigned default '0' ,
  PRIMARY KEY (reviews_id)
);

drop table if exists newsdesk_reviews_description;
create table newsdesk_reviews_description (
  reviews_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

drop table if exists newsdesk_to_categories;
create table newsdesk_to_categories (
  newsdesk_id int(11) default '0' not null ,
  categories_id int(11) default '0' not null ,
  PRIMARY KEY (newsdesk_id, categories_id)
);

insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('34', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('35', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('36', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('37', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('38', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('39', '1');
insert into newsdesk_to_categories (newsdesk_id, categories_id) values ('40', '2');
drop table if exists newsletters;
create table newsletters (
  newsletters_id int(11) not null auto_increment,
  title varchar(255) not null ,
  content text not null ,
  module varchar(255) not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  date_sent datetime ,
  status int(1) ,
  locked int(1) default '0' ,
  PRIMARY KEY (newsletters_id)
);

drop table if exists orders;
create table orders (
  orders_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  customers_name varchar(64) not null ,
  customers_company varchar(96) ,
  customers_street_address varchar(64) not null ,
  customers_street_address_dom varchar(10) not null ,
  customers_street_address_mieszkanie varchar(6) not null ,
  customers_suburb varchar(32) ,
  customers_city varchar(32) not null ,
  customers_postcode varchar(10) not null ,
  customers_state varchar(32) ,
  customers_country varchar(32) not null ,
  customers_telephone varchar(32) not null ,
  customers_email_address varchar(96) not null ,
  customers_address_format_id int(5) default '0' not null ,
  customers_nip varchar(32) ,
  delivery_name varchar(64) not null ,
  delivery_company varchar(96) ,
  delivery_street_address varchar(64) not null ,
  delivery_street_address_dom varchar(10) not null ,
  delivery_street_address_mieszkanie varchar(6) not null ,
  delivery_suburb varchar(32) ,
  delivery_city varchar(32) not null ,
  delivery_postcode varchar(10) not null ,
  delivery_state varchar(32) ,
  delivery_country varchar(32) not null ,
  delivery_address_format_id int(5) default '0' not null ,
  delivery_nip varchar(32) ,
  billing_name varchar(64) not null ,
  billing_company varchar(96) ,
  billing_street_address varchar(64) not null ,
  billing_street_address_dom varchar(10) not null ,
  billing_street_address_mieszkanie varchar(6) not null ,
  billing_suburb varchar(32) ,
  billing_city varchar(32) not null ,
  billing_postcode varchar(10) not null ,
  billing_state varchar(32) ,
  billing_country varchar(32) not null ,
  billing_address_format_id int(5) default '0' not null ,
  billing_nip varchar(32) ,
  payment_method varchar(96) not null ,
  cc_type varchar(20) ,
  cc_owner varchar(64) ,
  cc_number varchar(32) ,
  cc_expires varchar(4) ,
  last_modified datetime ,
  date_purchased datetime ,
  orders_status int(5) default '0' not null ,
  orders_date_finished datetime ,
  currency char(3) ,
  currency_value decimal(14,6) ,
  purchased_without_account tinyint(1) unsigned default '0' not null ,
  shipping_tax decimal(7,4) default '0.0000' not null ,
  shipping_module varchar(255) ,
  customer_service_id varchar(15) ,
  PRIMARY KEY (orders_id),
  KEY customers_id (customers_id)
);

drop table if exists orders_products;
create table orders_products (
  orders_products_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  products_id int(11) default '0' not null ,
  products_model varchar(40) ,
  products_name varchar(96) not null ,
  products_price decimal(15,4) default '0.0000' not null ,
  final_price decimal(15,4) default '0.0000' not null ,
  products_tax decimal(7,4) default '0.0000' not null ,
  products_quantity int(2) default '0' not null ,
  PRIMARY KEY (orders_products_id),
  KEY orders_id (orders_id),
  KEY products_id (products_id)
);

drop table if exists orders_products_attributes;
create table orders_products_attributes (
  orders_products_attributes_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  products_options varchar(32) not null ,
  products_options_values varchar(32) not null ,
  options_values_price decimal(15,4) default '0.0000' not null ,
  price_prefix char(1) not null ,
  PRIMARY KEY (orders_products_attributes_id)
);

drop table if exists orders_products_download;
create table orders_products_download (
  orders_products_download_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  orders_products_filename varchar(255) not null ,
  download_maxdays int(2) default '0' not null ,
  download_count int(2) default '0' not null ,
  PRIMARY KEY (orders_products_download_id)
);

drop table if exists orders_status;
create table orders_status (
  orders_status_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  orders_status_name varchar(32) not null ,
  PRIMARY KEY (orders_status_id, language_id),
  KEY idx_orders_status_name (orders_status_name)
);

insert into orders_status (orders_status_id, language_id, orders_status_name) values ('3', '4', 'Zam�wione Towary Wys�ane');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('2', '4', 'Zam�wienie Przyj�te');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('1', '4', 'Zam�wienie Otrzymane');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('4', '4', 'Zam�wienie Realizowane');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('5', '4', 'Reklamowane w trakcie wyja�nie�');
drop table if exists orders_status_history;
create table orders_status_history (
  orders_status_history_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_status_id int(5) default '0' not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  customer_notified int(1) default '0' ,
  comments text ,
  PRIMARY KEY (orders_status_history_id),
  KEY orders_id (orders_id),
  KEY orders_status_id (orders_status_id)
);

drop table if exists orders_total;
create table orders_total (
  orders_total_id int(10) unsigned not null auto_increment,
  orders_id int(11) default '0' not null ,
  title varchar(255) not null ,
  text varchar(255) not null ,
  value decimal(15,4) default '0.0000' not null ,
  class varchar(32) not null ,
  sort_order int(11) default '0' not null ,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

drop table if exists products;
create table products (
  products_id int(11) not null auto_increment,
  products_quantity int(4) default '0' not null ,
  products_model varchar(40) default '0' not null ,
  products_image varchar(64) ,
  products_image_pop varchar(64) ,
  products_price decimal(15,4) default '0.0000' not null ,
  products_date_added datetime default '0000-00-00 00:00:00' not null ,
  products_last_modified datetime ,
  products_date_available datetime ,
  products_weight decimal(5,2) default '0.00' not null ,
  products_status tinyint(1) default '0' not null ,
  products_available tinyint(1) default '1' not null ,
  products_tax_class_id int(11) default '0' not null ,
  manufacturers_id int(11) ,
  products_ordered int(11) default '0' not null ,
  products_discount decimal(8,2) default '0.00' not null ,
  products_podobne varchar(128) ,
  PRIMARY KEY (products_id),
  KEY idx_products_date_added (products_date_added),
  KEY products_model (products_model),
  KEY manufacturers_id (manufacturers_id),
  KEY products_status (products_status),
  KEY products_last_modified (products_last_modified),
  KEY products_available (products_available),
  KEY products_ordered (products_ordered),
  KEY products_price (products_price)
);

insert into products (products_id, products_quantity, products_model, products_image, products_image_pop, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_available, products_tax_class_id, manufacturers_id, products_ordered, products_discount, products_podobne) values ('1', '1', 'ASUS F3SC-AS265E', 'f3sc-as265e.jpg', NULL, '3327.8689', '2007-10-16 18:21:47', '2007-10-16 18:44:44', NULL, '4.80', '1', '1', '2', '2', '0', '0.00', NULL);
insert into products (products_id, products_quantity, products_model, products_image, products_image_pop, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_available, products_tax_class_id, manufacturers_id, products_ordered, products_discount, products_podobne) values ('2', '10', 'CREATIVE ZEN AURVANA DJ', 'aurvana_dj.jpg', NULL, '188.5246', '2007-10-16 18:40:06', '2007-10-16 18:55:16', NULL, '1.10', '1', '1', '2', '1', '0', '0.00', NULL);
insert into products (products_id, products_quantity, products_model, products_image, products_image_pop, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_available, products_tax_class_id, manufacturers_id, products_ordered, products_discount, products_podobne) values ('3', '4', 'CREATIVE ZEN AURVANA', 'zen-aurvana.jpg', NULL, '163.1148', '2007-10-16 18:42:56', NULL, NULL, '0.24', '1', '1', '2', '1', '0', '0.00', NULL);
insert into products (products_id, products_quantity, products_model, products_image, products_image_pop, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_available, products_tax_class_id, manufacturers_id, products_ordered, products_discount, products_podobne) values ('4', '1', 'LOGITECH VX NANO CORDLESS NOTEBOOK MOUSE', '910-000255.jpg', NULL, '204.9180', '2007-10-16 18:47:42', '2007-10-16 18:49:13', NULL, '0.47', '1', '1', '2', '3', '0', '0.00', NULL);
drop table if exists products_attributes;
create table products_attributes (
  products_attributes_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  options_id int(11) default '0' not null ,
  options_values_id int(11) default '0' not null ,
  options_values_price decimal(15,4) default '0.0000' not null ,
  price_prefix char(1) not null ,
  attribute_sort int(10) unsigned default '0' not null ,
  PRIMARY KEY (products_attributes_id),
  KEY products_id (products_id),
  KEY options_id (options_id)
);

insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix, attribute_sort) values ('1', '1', '1', '2', '215.0000', '+', '1');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix, attribute_sort) values ('2', '1', '1', '1', '0.0000', '+', '0');
drop table if exists products_attributes_download;
create table products_attributes_download (
  products_attributes_id int(11) default '0' not null ,
  products_attributes_filename varchar(255) not null ,
  products_attributes_maxdays int(2) default '0' ,
  products_attributes_maxcount int(2) default '0' ,
  PRIMARY KEY (products_attributes_id)
);

drop table if exists products_description;
create table products_description (
  products_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  products_name varchar(96) not null ,
  products_shortdescription text ,
  products_description text ,
  products_url varchar(255) ,
  products_viewed int(5) default '0' ,
  PRIMARY KEY (products_id, language_id),
  KEY products_name (products_name),
  KEY products_id (products_id)
);

insert into products_description (products_id, language_id, products_name, products_shortdescription, products_description, products_url, products_viewed) values ('1', '4', 'ASUS F3SC-AS265E VB T7100/120 1GB/DVDRW 15.4\"', NULL, '<strong>Niesamowite doznania gwarantowane!</strong><br /><br /><strong>Rewolucja w mobilnej rozrywce</strong> - procesor mobilny Intel Centrino Duo w F3Sc to gwarancja najwy�szych osi�g&oacute;w w�r&oacute;d komputer&oacute;w przeno�nych, nowych funkcji zwi�zanych ze standardem HD i d�u�szego czasu pracy na bateriach.<br /><br /><strong>Dwa rdzenie, podw&oacute;jna moc </strong><br />Dzi�ki wyposa�eniu w najnowsze procesory dwurdzeniowe, notebooki z serii ASUS F3Sc daj� Ci jeszcze wi�ksze mo�liwo�ci podczas wykonywania kilku zada� jednocze�nie, np. obr&oacute;bki cyfrowego d�wi�ku i obrazu wideo, gier, rozm&oacute;w przy u�yciu komunikatora internetowego czy przegl�dania stron WWW. Moc dw&oacute;ch rdzeni sprawia, �e zarz�dzanie multimediami czy praca w najbardziej wymagaj�cych aplikacjach jeszcze nigdy nie by�y tak przyjemne. <br /><br /><strong>Wbudowana kamera internetowa wysokiej rozdzielczo�ci </strong><br />Integracja kamery internetowej o wysokiej rozdzielczo�ci sprawi�a, �e ASUS F3Sc pozwala na stworzenie konferencji z wykorzystaniem technologii wideo tu� po wyj�ciu go z pude�ka - bez potrzeby posiadania zewn�trznej kamery czy mikrofonu. W po��czeniu z ASUS LifeFrame2, ekskluzywnym oprogramowaniem przeznaczonym do nagrywania film&oacute;w i robienia zdj��, mo�esz w prosty spos&oacute;b nagrywa� filmiki z imprez, zrobi� sobie zdj�cie z grup� przyjaci&oacute;�, zobaczy� twarz Twojego przyjaciela podczas rozmowy online czy stworzy� wideokonferencj�. <br /><br /><strong>Technologia poprawy jako�ci obrazu ASUS Splendid</strong><br />Opatentowana przez firm� ASUS technologia Splendid poprawia jako�� obrazu szczeg&oacute;lnie efektywnie podczas odtwarzania kolor&oacute;w sk&oacute;ry, trawy, drzew, nieba oraz oceanu. Obraz generowany przez kart� graficzn� komputera jest lepszej jako�ci dzi�ki polepszaniu g��bi i intensywno�ci kolor&oacute;w w czasie rzeczywistym. Zaawansowany algorytm poprawia kontrast, jasno��, kolor sk&oacute;ry oraz nasycenie innych kolor&oacute;w dla uzyskania jak najbardziej �ywego obrazu. Dzi�ki zastosowaniu technologii ASUS Splendid (skr&oacute;t klawiszowy: Fn+C), panel LCD w Twoim notebooku b�dzie generowa� czysty i ostry obraz w naturalnie nasyconych kolorach.<br /><br /><strong>Pozosta� ci�gle w kontakcie i b�d� wolny od przewod&oacute;w</strong><br />Odpowiedzi� na pro�by klient&oacute;w, kt&oacute;rzy jednocze�nie korzystaj� z kilku urz�dze� Bluetooth (np. myszka, klawiatura, s�uchawki, telefony kom&oacute;rkowe) jest wyposa�enie notebook&oacute;w z serii F3Sc w interfejs Bluetooth zgodny ze specyfikacj� V2.0+EDR, kt&oacute;ry oferuje maksymalny transfer na poziomie 3Mb/s - trzykrotnie wy�szy ni� przepustowo�� obecnie produkowanych urz�dze�. Pozwala on r&oacute;wnie� na redukcj� zu�ycia mocy, co bardzo pozytywnie wp�ywa na czas pracy akcesori&oacute;w Bluetooth wykorzystuj�cych zasilanie bateryjne. Opr&oacute;cz tego, dzi�ki obs�udze najnowszego standardu sieci bezprzewodowych 802.11n, u�ytkownicy mog� pobiera� strumieniowo obraz w rozdzielczo�ci HD, muzyk� oraz dane przy jednoczesnym obni�eniu zu�ycia energii. Czas pracy na zasilaniu bateryjnym poprzez zastosowanie technologii Intel Wireless-N wyd�u�y� si� o godzin� w por&oacute;wnaniu do konkurencyjnych produkt&oacute;w zgodnych z 802.11n. <br /><br /><strong>Prostsza i szybsza transmisja danych cyfrowych</strong><br />Zadaniem standardu ExpressCard jest zapewnienie wysokich osi�g&oacute;w podczas przesy�u danych oraz mo�liwo�ci modularnej rozbudowy notebook&oacute;w przy zachowaniu niskich koszt&oacute;w i niewielkich wymiar&oacute;w. Dzi�ki niemu, b�dziesz mia� mo�liwo�� dodawania nowych urz�dze� komunikacyjnych i zabezpieczaj�cych w bardzo prosty spos&oacute;b - wystarczy w�o�y� nowy modu� ExpressCard do Twojego F3Sc. <br /><br /><strong>Modu� bezpiecze�stwa TPM </strong>(Trusted Platform Module)<br />Modu� bezpiecze�stwa TPM (Trusted Platform Module) jest zintegrowanym na p�ycie g�&oacute;wnej urz�dzeniem, kt&oacute;re przechowuje klucze wygenerowane przez komputer w formie zaszyfrowanej. Pomaga on unika� atak&oacute;w hacker&oacute;w, kt&oacute;rych celem jest przechwycenie hase� i kluczy do wa�nych danych. Zastosowanie TPM w F3Sc pozwala na bezpieczne uruchamianie aplikacji oraz wykonywanie transakcji i prowadzenie rozm&oacute;w bez obaw o wyciek danych. W po��czeniu z oprogramowaniem ASUS Security Protect Manager gwarantuje wzrost og&oacute;lnego bezpiecze�stwa systemu m.in. przez funkcje zabezpieczenia plik&oacute;w, poczty elektronicznych oraz folder&oacute;w u�ytkownika.<br />', '', '18');
insert into products_description (products_id, language_id, products_name, products_shortdescription, products_description, products_url, products_viewed) values ('2', '4', 'CREATIVE ZEN AURVANA DJ', NULL, 'Wygl�daj� r&oacute;wnie dobrze jak brzmi�!<br />Je�li szukasz jako�ci, kt&oacute;ra zadowoli nawet najbardziej wymagaj�cego DJ-a potrzebujesz s�uchawek Aurvana DJ Headphones. Zastosowano w nich najlepsze przetworniki i komponenty, zapewniaj�ce osi�gni�cie doskona�ych rezultat&oacute;w zar&oacute;wno w studiu jak i podczas imprezy w klubie. Creative Aurvana DJ Headphones wykonano ze zmatowionego metalu. S� odporne na uszkodzenia i niezwykle dok�adnie wyko�czone. Dzi�ki nim b�dziesz wygl�da� r&oacute;wnie dobrze jak brzmi Twoja muzyka ! S� to s�uchawki z najwy�szej p&oacute;�ki, w kt&oacute;rych zawarto do�wiadczenie wielokrotnie nagradzanych specjalist&oacute;w z firmy Creative zdobyte, w trakcie tworzenia technologii Sound Blaster, system&oacute;w E-MU, oraz odtwarzaczy ZEN.<br /> <ul><li>Specjalnie dobrany kszta�t oraz komfortowa wy�ci&oacute;�ka gwarantuj� doskona�� izolacj� od szum&oacute;w z otoczenia minimalizuj�c jednocze�nie zniekszta�cenia d�wi�ku. </li><li>Magnesy neodymowe o �rednicy 40 mm oraz cewki stworzone w technologii CCAW (przew&oacute;d aluminiowy powlekany miedzi�) przenosz� pe�ne pasmo d�wi�ku. </li><li>Poduszki s�uchawkowe, kt&oacute;re mo�na obr&oacute;ci� nawet o 180 stopni oraz pojedynczy przew&oacute;d u�atwiaj� prac� w domowym studiu nagra�.  </li><li>Wymienne wy�ci&oacute;�ki poduszek s�uchawkowych zwi�kszaj� �ywotno�� sprz�tu.  </li><li>Poz�acany wtyk i adapter pozwalaj� na uzyskanie bardzo czystego d�wi�ku.  </li><li>Sprz�t zaprojektowany z my�l� o wykorzystaniu w studiu lub w klubie. Kompatybilne z odtwarzaczami CD i MP3</li></ul> <p><strong>Dane techniczne</strong> </p> <ul><li>Przetworniki: 40 mm membrany z neodymowymi magnesami, oraz cewki, w kt&oacute;rych zastosowano przew&oacute;d aluminiowy powlekany miedzi� (CCAW) </li><li>Pasmo przenoszenia: 20Hz-20kHz  </li><li>Impedancja: 32omy  </li><li>Czu�o��: (1kHz): 105dB/mW  </li><li>D�ugo�� przewodu: od 1.4 do 3 m, wykonany z miedzi beztlenowej  </li><li>Wtyk: stereo, o �rednicy 3.5 mm, poz�acany  </li><li>Waga: 385 g (bez opakowania)</li></ul> <p><strong>Gwarancja</strong></p> <ul><li>Roczna ograniczona gwarancja sprz�towa</li></ul> <p><strong>Zawarto�� opakowania </strong></p> <ul><li>S�uchawki Creative Aurvana  </li><li>Jeden adapter (przej�ci&oacute;wka) stereo 6.3 mm</li></ul>', '', '2');
insert into products_description (products_id, language_id, products_name, products_shortdescription, products_description, products_url, products_viewed) values ('3', '4', 'CREATIVE ZEN AURVANA', NULL, 'Komfort i wierna reprodukcja d�wi�ku. Douszne s�uchawki Creative ZEN Aurvana przeznaczone s� dla najbardziej wymagaj�cych fan&oacute;w szczeg&oacute;�owego brzmienia i wiernej reprodukcji d�wi�ku. Dzi�ki przetwornikom typu Balanced Armature precyzyjnie odtwarzaj� muzyk� bez sztucznego podbijania ton&oacute;w niskich i wysokich. Wykorzystanie technologii AuraSeal, kt&oacute;ra eliminuje do 90% d�wi�k&oacute;w nap�ywaj�cych z otoczenia powoduje, �e mo�na delektowa� si� wszystkimi szczeg&oacute;�ami utwor&oacute;w muzycznych. Silikonowe, mi�kkie, konturowane i wymienne nak�adki w dwoch rozmiarach zapewniaj� komfort u�ytkowania a zastosowanie przewod&oacute;w z miedzi beztlenowej i poz�acanej ko�c&oacute;wki zapewnia doskona�� jako�� sygna�u. S�uchawki Creative ZEN Aurvana mo�na tak�e wykorzystywa� do s�uchanie muzyki lub ogl�danie film&oacute;w z przeno�nych odtwarzaczy przy ni�szym poziomie g�o�no�ci. <ul>Dane techniczne:  <li>Typ przetwornika: Balanced Armature  </li><li>Pasmo przenoszenia : 20Hz ~ 20kHz  </li><li>Impedancja: 42 Ohm&oacute;w  </li><li>Stosunek sygna�u do szumu: 115dB  </li><li>Wsp&oacute;�pracuj� z ka�dym odtwarzaczem MP3 lub video.  </li><li>Technologia AuraSealTM eliminuje do 90% d�wi�k&oacute;w otoczenia.  </li><li>Przetworniki Balanced Armature zapewniaj� wysok� jako�� d�wi�ku.  </li><li>Przew&oacute;d z miedzi beztlenowej i poz�acana ko�c&oacute;wka zapewniaj� doskona�� jako�� sygna�u.  </li><li>Ergonomiczne, mi�kkie elementy douszne z silikonu zapewniaj� wygod� podczas d�ugotrwa�ego s�uchania.  </li><li>ATUTY  </li><li>JAKO�� - Najlepsza wra�enia muzyczne; zaawansowana technologia daj�ca niezr&oacute;wnan� jako�� d�wi�ku.  </li><li>SZCZEG&Oacute;�OWY D�WI�K - AuraSealTM eliminuje do 90% d�wi�k&oacute;w otoczenia i zapewnia najlepsze wra�enia podczas s�uchania muzyki lub ogl�dania film&oacute;w. ��czy doskona�� wygod�, ergonomi� i styl. </li><li>WSZECHSTRONNO�� - Wsp&oacute;�pracuj� z ka�dym odtwarzaczem MP3 lub wideo. W zestawie przej�ci&oacute;wka umo�liwiaj�ca u�ywanie s�uchawek w samolocie! </li></ul>', '', '0');
insert into products_description (products_id, language_id, products_name, products_shortdescription, products_description, products_url, products_viewed) values ('4', '4', 'LOGITECH VX NANO CORDLESS NOTEBOOK MOUSE', NULL, 'U�atwienie �ycia w podr&oacute;�ach. VX Nano Cordless Laser Mouse for Notebooks to prawdziwie przeno�na mysz firmy Logitech, zawsze gotowa do pracy, jako �e jej nanoodbiornik mo�e by� stale pod��czony do notebooka. Na uwag� zas�uguje te� funkcja super szybkiego przewijania, zdumiewaj�ca precyzja �ledzenia ruch&oacute;w, pomys�owa konstrukcja i bezprzewodowa komunikacja w pa�mie 2,4 GHz. Trzyletnia gwarancja. <br /><br /><br /><ul><li>Prawdziwie przeno�na, bezprzewodowa mysz laserowa z nanoodbiornikiem do notebook&oacute;w </li><li>Nanoodbiornik tak ma�y, �e go prawie nie wida�, a mysz zawsze gotowa do pracy </li><li>Bardzo p�aska konstrukcja z �atwo�ci� mie�ci si� w torbie notebooka </li><li>Po d�ugich dokumentach mo�na �miga�, a mo�na te� przewija� precyzyjne &#39;&#39;klik po kliku&#39;&#39; </li><li>Technologia laserowa - ruchy p�ynne na praktycznie ka�dej powierzchni </li><li>Cyfrowa, niezawodna i bezprzewodowa komunikacja w pa�mie 2,4 GHz </li><li>Z��cze USB; Windows XP, Windows Vista i Mac OS X 10.3.9+ </li><li>Trzyletnia gwarancja </li><li>Pomoc techniczna w pe�nym zakresie</li></ul>', '', '3');
drop table if exists products_extra_fields;
create table products_extra_fields (
  products_extra_fields_id int(11) not null auto_increment,
  products_extra_fields_name varchar(64) not null ,
  products_extra_fields_order int(3) default '0' not null ,
  products_extra_fields_status tinyint(1) default '1' not null ,
  languages_id int(11) default '0' not null ,
  PRIMARY KEY (products_extra_fields_id)
);

insert into products_extra_fields (products_extra_fields_id, products_extra_fields_name, products_extra_fields_order, products_extra_fields_status, languages_id) values ('29', 'Gwarancja', '0', '1', '0');
drop table if exists products_notifications;
create table products_notifications (
  products_id int(11) default '0' not null ,
  customers_id int(11) default '0' not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (products_id, customers_id)
);

drop table if exists products_options;
create table products_options (
  products_options_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_name varchar(32) not null ,
  PRIMARY KEY (products_options_id, language_id),
  KEY products_options_name (products_options_name)
);

insert into products_options (products_options_id, language_id, products_options_name) values ('1', '4', 'pami�� RAM');
drop table if exists products_options_values;
create table products_options_values (
  products_options_values_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_values_name varchar(64) not null ,
  PRIMARY KEY (products_options_values_id, language_id)
);

insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '4', '2x512MB');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('2', '4', '2x1024MB');
drop table if exists products_options_values_to_products_options;
create table products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) not null auto_increment,
  products_options_id int(11) default '0' not null ,
  products_options_values_id int(11) default '0' not null ,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('1', '1', '1');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('2', '1', '2');
drop table if exists products_to_categories;
create table products_to_categories (
  products_id int(11) default '0' not null ,
  categories_id int(11) default '0' not null ,
  PRIMARY KEY (products_id, categories_id),
  KEY products_id (products_id),
  KEY categories_id (categories_id)
);

insert into products_to_categories (products_id, categories_id) values ('1', '1');
insert into products_to_categories (products_id, categories_id) values ('2', '3');
insert into products_to_categories (products_id, categories_id) values ('3', '3');
insert into products_to_categories (products_id, categories_id) values ('4', '4');
drop table if exists products_to_products_extra_fields;
create table products_to_products_extra_fields (
  products_id int(11) not null ,
  products_extra_fields_id int(11) not null ,
  products_extra_fields_value varchar(64) ,
  PRIMARY KEY (products_id, products_extra_fields_id)
);

insert into products_to_products_extra_fields (products_id, products_extra_fields_id, products_extra_fields_value) values ('1', '29', '24 m-ce');
insert into products_to_products_extra_fields (products_id, products_extra_fields_id, products_extra_fields_value) values ('2', '29', '12 m-cy');
insert into products_to_products_extra_fields (products_id, products_extra_fields_id, products_extra_fields_value) values ('3', '29', 'do�ywotnia');
insert into products_to_products_extra_fields (products_id, products_extra_fields_id, products_extra_fields_value) values ('4', '29', '36 m-cy');
drop table if exists products_xsell;
create table products_xsell (
  ID int(10) not null auto_increment,
  products_id int(10) unsigned default '1' not null ,
  xsell_id int(10) unsigned default '1' not null ,
  sort_order int(10) unsigned default '1' not null ,
  PRIMARY KEY (ID),
  KEY products_id (products_id),
  KEY xsell_id (xsell_id)
);

drop table if exists reviews;
create table reviews (
  reviews_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  customers_id int(11) ,
  customers_name varchar(64) not null ,
  reviews_rating int(1) ,
  date_added datetime ,
  last_modified datetime ,
  reviews_read int(5) default '0' not null ,
  approved tinyint(3) unsigned default '0' ,
  PRIMARY KEY (reviews_id),
  KEY products_id (products_id)
);

drop table if exists reviews_description;
create table reviews_description (
  reviews_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

drop table if exists sessions;
create table sessions (
  sesskey varchar(32) not null ,
  expiry int(11) unsigned default '0' not null ,
  value text not null ,
  PRIMARY KEY (sesskey)
);

drop table if exists ship2pay;
create table ship2pay (
  s2p_id int(11) not null auto_increment,
  shipment varchar(100) not null ,
  payments_allowed varchar(250) not null ,
  status tinyint(4) not null ,
  PRIMARY KEY (s2p_id),
  KEY status (status)
);

drop table if exists specials;
create table specials (
  specials_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  specials_new_products_price decimal(15,4) default '0.0000' not null ,
  specials_date_added datetime ,
  specials_last_modified datetime ,
  expires_date datetime ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  customers_groups_id int(11) default '0' not null ,
  customers_id int(11) default '0' not null ,
  PRIMARY KEY (specials_id),
  KEY products_id (products_id),
  KEY status (status),
  KEY customers_groups_id (customers_groups_id),
  KEY customers_id (customers_id)
);

insert into specials (specials_id, products_id, specials_new_products_price, specials_date_added, specials_last_modified, expires_date, date_status_change, status, customers_groups_id, customers_id) values ('1', '4', '174.5902', '2007-10-16 18:48:31', NULL, '0000-00-00 00:00:00', NULL, '1', '0', '0');
drop table if exists subscribers;
create table subscribers (
  subscribers_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  subscribers_email_address varchar(80) not null ,
  subscribers_firstname varchar(40) ,
  subscribers_lastname varchar(40) ,
  language varchar(30) ,
  subscribers_gender char(1) ,
  subscribers_email_type varchar(5) ,
  entry_date date default '0000-00-00' ,
  undeliverable_count mediumint(11) default '0' ,
  mail_details_customers_id int(5) default '0' ,
  list_number int(5) default '0' ,
  source_import varchar(70) ,
  date_account_created datetime default '0000-00-00 00:00:00' ,
  date_account_last_modified datetime default '0000-00-00 00:00:00' ,
  customers_newsletter int(4) ,
  subscribers_blacklist int(2) default '0' ,
  subscription_date datetime default '0000-00-00 00:00:00' ,
  status_sent1 int(2) default '0' ,
  host_name varchar(25) ,
  hardiness_zone char(3) ,
  PRIMARY KEY (subscribers_id),
  KEY list_number (list_number)
);

drop table if exists tax_class;
create table tax_class (
  tax_class_id int(11) not null auto_increment,
  tax_class_title varchar(32) not null ,
  tax_class_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (tax_class_id)
);

insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('1', 'VAT_8', '8% podatek VAT', '2004-09-19 02:46:38', '2004-09-19 02:41:52');
insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('2', 'VAT_23', '23% podatek VAT', '2004-09-19 02:46:44', '2004-09-19 02:43:48');
insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('3', 'VAT_0', '0% podatek VAT', '2004-09-19 02:46:30', '2004-09-19 02:44:49');
drop table if exists tax_rates;
create table tax_rates (
  tax_rates_id int(11) not null auto_increment,
  tax_zone_id int(11) default '0' not null ,
  tax_class_id int(11) default '0' not null ,
  tax_priority int(5) default '1' ,
  tax_rate decimal(7,4) default '0.0000' not null ,
  tax_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (tax_rates_id)
);

insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('5', '1', '2', '0', '23.0000', 'VAT-23', '2008-07-07 17:07:36', '2004-09-19 02:46:08');
insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('4', '1', '1', '1', '8.0000', 'VAT-8', '2008-07-07 17:07:40', '2004-09-19 02:45:38');
insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('3', '1', '3', '2', '0.0000', 'VAT-0', '2008-07-07 17:07:44', '2004-09-19 02:45:12');
drop table if exists whos_online;
create table whos_online (
  customer_id int(11) ,
  full_name varchar(64) not null ,
  session_id varchar(128) not null ,
  ip_address varchar(64) not null ,
  time_entry varchar(14) not null ,
  time_last_click varchar(14) not null ,
  last_page_url varchar(255) not null ,
  http_referer varchar(255) not null ,
  user_agent varchar(255) not null ,
  hostname varchar(255) not null 
);

drop table if exists zones;
create table zones (
  zone_id int(11) not null auto_increment,
  zone_country_id int(11) default '0' not null ,
  zone_code varchar(32) not null ,
  zone_name varchar(32) not null ,
  PRIMARY KEY (zone_id)
);

insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1', '223', 'AL', 'Alabama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2', '223', 'AK', 'Alaska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3', '223', 'AS', 'American Samoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4', '223', 'AZ', 'Arizona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('5', '223', 'AR', 'Arkansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('6', '223', 'AF', 'Armed Forces Africa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('7', '223', 'AA', 'Armed Forces Americas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('8', '223', 'AC', 'Armed Forces Canada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('9', '223', 'AE', 'Armed Forces Europe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('10', '223', 'AM', 'Armed Forces Middle East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('11', '223', 'AP', 'Armed Forces Pacific');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('12', '223', 'CA', 'California');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('13', '223', 'CO', 'Colorado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('14', '223', 'CT', 'Connecticut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('15', '223', 'DE', 'Delaware');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('16', '223', 'DC', 'District of Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('17', '223', 'FM', 'Federated States Of Micronesia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('18', '223', 'FL', 'Florida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('19', '223', 'GA', 'Georgia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('20', '223', 'GU', 'Guam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('21', '223', 'HI', 'Hawaii');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('22', '223', 'ID', 'Idaho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('23', '223', 'IL', 'Illinois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('24', '223', 'IN', 'Indiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('25', '223', 'IA', 'Iowa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('26', '223', 'KS', 'Kansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('27', '223', 'KY', 'Kentucky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('28', '223', 'LA', 'Louisiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('29', '223', 'ME', 'Maine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('30', '223', 'MH', 'Marshall Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('31', '223', 'MD', 'Maryland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('32', '223', 'MA', 'Massachusetts');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('33', '223', 'MI', 'Michigan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('34', '223', 'MN', 'Minnesota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('35', '223', 'MS', 'Mississippi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('36', '223', 'MO', 'Missouri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('37', '223', 'MT', 'Montana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('38', '223', 'NE', 'Nebraska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('39', '223', 'NV', 'Nevada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('40', '223', 'NH', 'New Hampshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('41', '223', 'NJ', 'New Jersey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('42', '223', 'NM', 'New Mexico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('43', '223', 'NY', 'New York');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('44', '223', 'NC', 'North Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('45', '223', 'ND', 'North Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('46', '223', 'MP', 'Northern Mariana Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('47', '223', 'OH', 'Ohio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('48', '223', 'OK', 'Oklahoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('49', '223', 'OR', 'Oregon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('50', '223', 'PW', 'Palau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('51', '223', 'PA', 'Pennsylvania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('52', '223', 'PR', 'Puerto Rico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('53', '223', 'RI', 'Rhode Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('54', '223', 'SC', 'South Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('55', '223', 'SD', 'South Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('56', '223', 'TN', 'Tennessee');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('57', '223', 'TX', 'Texas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('58', '223', 'UT', 'Utah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('59', '223', 'VT', 'Vermont');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('60', '223', 'VI', 'Virgin Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('61', '223', 'VA', 'Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('62', '223', 'WA', 'Washington');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('63', '223', 'WV', 'West Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('64', '223', 'WI', 'Wisconsin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('65', '223', 'WY', 'Wyoming');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('66', '38', 'AB', 'Alberta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('67', '38', 'BC', 'British Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('68', '38', 'MB', 'Manitoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('69', '38', 'NF', 'Newfoundland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('70', '38', 'NB', 'New Brunswick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('71', '38', 'NS', 'Nova Scotia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('72', '38', 'NT', 'Northwest Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('73', '38', 'NU', 'Nunavut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('74', '38', 'ON', 'Ontario');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('75', '38', 'PE', 'Prince Edward Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('76', '38', 'QC', 'Quebec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('77', '38', 'SK', 'Saskatchewan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('78', '38', 'YT', 'Yukon Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('79', '81', 'NDS', 'Niedersachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('80', '81', 'BAW', 'Baden-W�rttemberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('81', '81', 'BAY', 'Bayern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('82', '81', 'BER', 'Berlin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('83', '81', 'BRG', 'Brandenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('84', '81', 'BRE', 'Bremen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('85', '81', 'HAM', 'Hamburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('86', '81', 'HES', 'Hessen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('87', '81', 'MEC', 'Mecklenburg-Vorpommern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('88', '81', 'NRW', 'Nordrhein-Westfalen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('89', '81', 'RHE', 'Rheinland-Pfalz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('90', '81', 'SAR', 'Saarland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('91', '81', 'SAS', 'Sachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('92', '81', 'SAC', 'Sachsen-Anhalt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('93', '81', 'SCN', 'Schleswig-Holstein');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('94', '81', 'THE', 'Th�ringen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('95', '14', 'WI', 'Wien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('96', '14', 'NO', 'Nieder�sterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('97', '14', 'OO', 'Ober�sterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('98', '14', 'SB', 'Salzburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('99', '14', 'KN', 'K�rnten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('100', '14', 'ST', 'Steiermark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('101', '14', 'TI', 'Tirol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('102', '14', 'BL', 'Burgenland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('103', '14', 'VB', 'Voralberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('104', '204', 'AG', 'Aargau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('105', '204', 'AI', 'Appenzell Innerrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('106', '204', 'AR', 'Appenzell Ausserrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('107', '204', 'BE', 'Bern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('108', '204', 'BL', 'Basel-Landschaft');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('109', '204', 'BS', 'Basel-Stadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('110', '204', 'FR', 'Freiburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('111', '204', 'GE', 'Genf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('112', '204', 'GL', 'Glarus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('113', '204', 'JU', 'Graub�nden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('114', '204', 'JU', 'Jura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('115', '204', 'LU', 'Luzern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('116', '204', 'NE', 'Neuenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('117', '204', 'NW', 'Nidwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('118', '204', 'OW', 'Obwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('119', '204', 'SG', 'St. Gallen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('120', '204', 'SH', 'Schaffhausen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('121', '204', 'SO', 'Solothurn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('122', '204', 'SZ', 'Schwyz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('123', '204', 'TG', 'Thurgau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('124', '204', 'TI', 'Tessin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('125', '204', 'UR', 'Uri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('126', '204', 'VD', 'Waadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('127', '204', 'VS', 'Wallis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('128', '204', 'ZG', 'Zug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('129', '204', 'ZH', 'Z�rich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('130', '195', 'A Coru�a', 'A Coru�a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('131', '195', 'Alava', 'Alava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('132', '195', 'Albacete', 'Albacete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('133', '195', 'Alicante', 'Alicante');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('134', '195', 'Almeria', 'Almeria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('135', '195', 'Asturias', 'Asturias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('136', '195', 'Avila', 'Avila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('137', '195', 'Badajoz', 'Badajoz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('138', '195', 'Baleares', 'Baleares');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('139', '195', 'Barcelona', 'Barcelona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('140', '195', 'Burgos', 'Burgos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('141', '195', 'Caceres', 'Caceres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('142', '195', 'Cadiz', 'Cadiz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('143', '195', 'Cantabria', 'Cantabria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('144', '195', 'Castellon', 'Castellon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('145', '195', 'Ceuta', 'Ceuta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('146', '195', 'Ciudad Real', 'Ciudad Real');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('147', '195', 'Cordoba', 'Cordoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('148', '195', 'Cuenca', 'Cuenca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('149', '195', 'Girona', 'Girona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('150', '195', 'Granada', 'Granada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('151', '195', 'Guadalajara', 'Guadalajara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('152', '195', 'Guipuzcoa', 'Guipuzcoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('153', '195', 'Huelva', 'Huelva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('154', '195', 'Huesca', 'Huesca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('155', '195', 'Jaen', 'Jaen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('156', '195', 'La Rioja', 'La Rioja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('157', '195', 'Las Palmas', 'Las Palmas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('158', '195', 'Leon', 'Leon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('159', '195', 'Lleida', 'Lleida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('160', '195', 'Lugo', 'Lugo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('161', '195', 'Madrid', 'Madrid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('162', '195', 'Malaga', 'Malaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('163', '195', 'Melilla', 'Melilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('164', '195', 'Murcia', 'Murcia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('165', '195', 'Navarra', 'Navarra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('166', '195', 'Ourense', 'Ourense');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('167', '195', 'Palencia', 'Palencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('168', '195', 'Pontevedra', 'Pontevedra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('169', '195', 'Salamanca', 'Salamanca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('170', '195', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('171', '195', 'Segovia', 'Segovia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('172', '195', 'Sevilla', 'Sevilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('173', '195', 'Soria', 'Soria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('174', '195', 'Tarragona', 'Tarragona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('175', '195', 'Teruel', 'Teruel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('176', '195', 'Toledo', 'Toledo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('177', '195', 'Valencia', 'Valencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('178', '195', 'Valladolid', 'Valladolid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('179', '195', 'Vizcaya', 'Vizcaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('180', '195', 'Zamora', 'Zamora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('181', '195', 'Zaragoza', 'Zaragoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('182', '170', 'dolno�l�skie', 'dolno�l�skie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('183', '170', 'kujawsko-pomorskie', 'kujawsko-pomorskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('184', '170', 'lubelskie', 'lubelskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('185', '170', 'lubuskie', 'lubuskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('186', '170', '��dzkie', '��dzkie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('187', '170', 'ma�opolskie', 'ma�opolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('188', '170', 'mazowieckie', 'mazowieckie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('189', '170', 'opolskie', 'opolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('190', '170', 'podkarpackie', 'podkarpackie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('191', '170', 'podlaskie', 'podlaskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('192', '170', 'pomorskie', 'pomorskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('193', '170', '�l�skie', '�l�skie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('194', '170', '�wi�tokrzyskie', '�wi�tokrzyskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('195', '170', 'warmi�sko-mazurskie', 'warmi�sko-mazurskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('196', '170', 'wielkopolskie', 'wielkopolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('197', '170', 'zachodniopomorskie', 'zachodniopomorskie');
drop table if exists zones_to_geo_zones;
create table zones_to_geo_zones (
  association_id int(11) not null auto_increment,
  zone_country_id int(11) default '0' not null ,
  zone_id int(11) ,
  geo_zone_id int(11) ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (association_id)
);

