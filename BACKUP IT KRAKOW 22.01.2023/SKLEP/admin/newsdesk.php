<?php

require('includes/application_top.php');
require('includes/functions/newsdesk_general.php');

if ($HTTP_GET_VARS['action']) {
	switch ($HTTP_GET_VARS['action']) {
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// status call area ... you know the green/red lights
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'setflag':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( ($HTTP_GET_VARS['flag'] == '0') || ($HTTP_GET_VARS['flag'] == '1') ) {
	if ($HTTP_GET_VARS['pID']) {
		newsdesk_set_product_status($HTTP_GET_VARS['pID'], $HTTP_GET_VARS['flag']);
	}
	if ($HTTP_GET_VARS['cID']) {
		newsdesk_set_categories_status($HTTP_GET_VARS['cID'], $HTTP_GET_VARS['flag']);
	}

	if (USE_CACHE == 'true') {
		tep_reset_cache_block('categories');
		tep_reset_cache_block('newsdesk');
	}
}

// -----------------------------------------------------------------------
// sticky call area ... you know the green/red lights
// -----------------------------------------------------------------------
case 'setflag_sticky':
// -----------------------------------------------------------------------
if ( ($HTTP_GET_VARS['flag_sticky'] == '0') || ($HTTP_GET_VARS['flag_sticky'] == '1') ) {
	if ($HTTP_GET_VARS['pID']) {
		newsdesk_set_product_sticky($HTTP_GET_VARS['pID'], $HTTP_GET_VARS['flag_sticky']);
	}

	if (USE_CACHE == 'true') {
		tep_reset_cache_block('categories');
		tep_reset_cache_block('newsdesk');
	}
}


tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $HTTP_GET_VARS['cPath']));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'insert_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'update_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
//  double call codes ... all in one mentality ???
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$categories_id = tep_db_prepare_input($HTTP_POST_VARS['categories_id']);
$sort_order = tep_db_prepare_input($HTTP_POST_VARS['sort_order']);

//$sql_data_array = array('sort_order' => $sort_order);
$catagory_status = tep_db_prepare_input($HTTP_POST_VARS['catagory_status']);
$sql_data_array = array('sort_order' => $sort_order, 'catagory_status' => $catagory_status);

if ($HTTP_GET_VARS['action'] == 'insert_category') {
	$insert_sql_data = array(
		'parent_id' => $current_category_id,
		'date_added' => 'now()'
	);
	$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
	tep_db_perform(TABLE_NEWSDESK_CATEGORIES, $sql_data_array);
	$categories_id = tep_db_insert_id();
} elseif ($HTTP_GET_VARS['action'] == 'update_category') {
	$update_sql_data = array('last_modified' => 'now()');
	$sql_data_array = array_merge($sql_data_array, $update_sql_data);
	tep_db_perform(TABLE_NEWSDESK_CATEGORIES, $sql_data_array, 'update', 'categories_id = \'' . $categories_id . '\'');
}  // top if closing bracket

$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
	$categories_name_array = $HTTP_POST_VARS['categories_name'];
	$language_id = $languages[$i]['id'];
	$sql_data_array = array('categories_name' => tep_db_prepare_input($categories_name_array[$language_id]));
	if ($HTTP_GET_VARS['action'] == 'insert_category') {
		$insert_sql_data = array(
			'categories_id' => $categories_id,
			'language_id' => $languages[$i]['id']
		);
		$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
		tep_db_perform(TABLE_NEWSDESK_CATEGORIES_DESCRIPTION, $sql_data_array);
	} elseif ($HTTP_GET_VARS['action'] == 'update_category') {
		tep_db_perform(TABLE_NEWSDESK_CATEGORIES_DESCRIPTION, $sql_data_array, 'update', 'categories_id = \'' . $categories_id . '\' and language_id = \'' . $languages[$i]['id'] . '\'');
	}
}

$categories_image = tep_get_uploaded_file('categories_image');
$image_directory = tep_get_local_path(DIR_FS_CATALOG_IMAGES);

if (is_uploaded_file($categories_image['tmp_name'])) {
	tep_db_query("update " . TABLE_NEWSDESK_CATEGORIES . " set categories_image = '" . $categories_image['name'] . "' where categories_id = '" . tep_db_input($categories_id) . "'");
	tep_copy_uploaded_file($categories_image, $image_directory);
}

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $categories_id));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'delete_category_confirm':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS['categories_id']) {
$categories_id = tep_db_prepare_input($HTTP_POST_VARS['categories_id']);

$categories = newsdesk_get_category_tree($categories_id, '', '0', '', true);
$products = array();
$products_delete = array();

for ($i = 0, $n = sizeof($categories); $i < $n; $i++) {
	$product_ids_query = tep_db_query("select newsdesk_id from " . TABLE_NEWSDESK_TO_CATEGORIES . " where categories_id = '" . $categories[$i]['id'] . "'");
	while ($product_ids = tep_db_fetch_array($product_ids_query)) {
		$products[$product_ids['newsdesk_id']]['categories'][] = $categories[$i]['id'];
	}
}

reset($products);
while (list($key, $value) = each($products)) {
	$category_ids = '';
	for ($i = 0, $n = sizeof($value['categories']); $i < $n; $i++) {
		$category_ids .= '\'' . $value['categories'][$i] . '\', ';
	}
	$category_ids = substr($category_ids, 0, -2);

	$check_query = tep_db_query("select count(*) as total from " . TABLE_NEWSDESK_TO_CATEGORIES . " where newsdesk_id = '" . $key . "' and categories_id not in (" . $category_ids . ")");
	$check = tep_db_fetch_array($check_query);
	if ($check['total'] < '1') {
		$products_delete[$key] = $key;
	}
}

// Removing categories can be a lengthy process
tep_set_time_limit(0);
for ($i = 0, $n = sizeof($categories); $i < $n; $i++) {
	newsdesk_remove_category($categories[$i]['id']);
}

reset($products_delete);
while (list($key) = each($products_delete)) {
	newsdesk_remove_product($key);
}

}  // main if closing bracket

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'delete_product_confirm':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( ($HTTP_POST_VARS['newsdesk_id']) && (is_array($HTTP_POST_VARS['product_categories'])) ) {
$product_id = tep_db_prepare_input($HTTP_POST_VARS['newsdesk_id']);
$product_categories = $HTTP_POST_VARS['product_categories'];

for ($i = 0, $n = sizeof($product_categories); $i < $n; $i++) {
	tep_db_query("delete from " . TABLE_NEWSDESK_TO_CATEGORIES . " where newsdesk_id = '" . tep_db_input($product_id) . "' and categories_id = '" . tep_db_input($product_categories[$i]) . "'");
}

$product_categories_query = tep_db_query("select count(*) as total from " . TABLE_NEWSDESK_TO_CATEGORIES . " where newsdesk_id = '" . tep_db_input($product_id) . "'");
$product_categories = tep_db_fetch_array($product_categories_query);

if ($product_categories['total'] == '0') {
	newsdesk_remove_product($product_id);
}

if ($HTTP_POST_VARS['delete_image'] == 'yes') {
		unlink(DIR_FS_CATALOG_IMAGES . $HTTP_POST_VARS['products_previous_image']);
}

}  // top if closing bracket

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'move_category_confirm':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( ($HTTP_POST_VARS['categories_id']) && ($HTTP_POST_VARS['categories_id'] != $HTTP_POST_VARS['move_to_category_id']) ) {
$categories_id = tep_db_prepare_input($HTTP_POST_VARS['categories_id']);
$new_parent_id = tep_db_prepare_input($HTTP_POST_VARS['move_to_category_id']);
tep_db_query("update " . TABLE_NEWSDESK_CATEGORIES . " set parent_id = '" . tep_db_input($new_parent_id) . "', last_modified = now() where categories_id = '" . tep_db_input($categories_id) . "'");

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

}  // top if closing bracket

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $new_parent_id . '&cID=' . $categories_id));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'move_product_confirm':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$newsdesk_id = tep_db_prepare_input($HTTP_POST_VARS['newsdesk_id']);
$new_parent_id = tep_db_prepare_input($HTTP_POST_VARS['move_to_category_id']);

$duplicate_check_query = tep_db_query("select count(*) as total from " . TABLE_NEWSDESK_TO_CATEGORIES . " where newsdesk_id = '" . tep_db_input($newsdesk_id) . "' and categories_id = '" . tep_db_input($new_parent_id) . "'");
$duplicate_check = tep_db_fetch_array($duplicate_check_query);
if ($duplicate_check['total'] < 1) tep_db_query("update " . TABLE_NEWSDESK_TO_CATEGORIES . " set categories_id = '" . tep_db_input($new_parent_id) . "' where newsdesk_id = '" . tep_db_input($newsdesk_id) . "' and categories_id = '" . $current_category_id . "'");

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $new_parent_id . '&pID=' . $newsdesk_id));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'insert_product':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'update_product':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// Another double case situation -- must be an all in one mentality!
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( ($HTTP_POST_VARS['edit_x']) || ($HTTP_POST_VARS['edit_y']) ) {
	$HTTP_GET_VARS['action'] = 'new_product';
} else {

$newsdesk_id = tep_db_prepare_input($HTTP_GET_VARS['pID']);
$newsdesk_date_available = tep_db_prepare_input($HTTP_POST_VARS['newsdesk_date_available']);

$newsdesk_date_available = (date('Y-m-d') < $newsdesk_date_available) ? $newsdesk_date_available : 'null';

$sql_data_array = array(
		'newsdesk_image' => (($HTTP_POST_VARS['newsdesk_image'] == 'none') ? '' : tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image'])),
		'newsdesk_image_two' => (($HTTP_POST_VARS['newsdesk_image_two'] == 'none') ? '' : tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image_two'])),
		'newsdesk_image_three' => (($HTTP_POST_VARS['newsdesk_image_three'] == 'none') ? '' : tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image_three'])),
		'newsdesk_date_available' => $newsdesk_date_available,
		'newsdesk_status' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_status']),
		'newsdesk_sticky' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_sticky'])
	);

if ($HTTP_GET_VARS['action'] == 'insert_product') {
	$insert_sql_data = array('newsdesk_date_added' => 'now()');
	$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
	tep_db_perform(TABLE_NEWSDESK, $sql_data_array);
	$newsdesk_id = tep_db_insert_id();
	tep_db_query("insert into " . TABLE_NEWSDESK_TO_CATEGORIES . " (newsdesk_id, categories_id) values ('" . $newsdesk_id . "', '" . $current_category_id . "')");
} elseif ($HTTP_GET_VARS['action'] == 'update_product') {
	$update_sql_data = array('newsdesk_last_modified' => 'now()');
	$sql_data_array = array_merge($sql_data_array, $update_sql_data);
	tep_db_perform(TABLE_NEWSDESK, $sql_data_array, 'update', 'newsdesk_id = \'' . tep_db_input($newsdesk_id) . '\'');
}

$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
	$language_id = $languages[$i]['id'];

	$sql_data_array = array(
			'newsdesk_article_name' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_article_name'][$language_id]),
			'newsdesk_article_description' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_article_description'][$language_id]),
			'newsdesk_article_shorttext' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_article_shorttext'][$language_id]),
			'newsdesk_article_url' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_article_url'][$language_id]),
			'newsdesk_article_url_name' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_article_url_name'][$language_id]),
			'newsdesk_image_text' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image_text'][$language_id]),
			'newsdesk_image_text_two' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image_text_two'][$language_id]),
			'newsdesk_image_text_three' => tep_db_prepare_input($HTTP_POST_VARS['newsdesk_image_text_three'][$language_id])
		);

	if ($HTTP_GET_VARS['action'] == 'insert_product') {
		$insert_sql_data = array(
			'newsdesk_id' => $newsdesk_id,
			'language_id' => $language_id
		);
		$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
		tep_db_perform(TABLE_NEWSDESK_DESCRIPTION, $sql_data_array);
	} elseif ($HTTP_GET_VARS['action'] == 'update_product') {
		tep_db_perform(TABLE_NEWSDESK_DESCRIPTION, $sql_data_array, 'update', 'newsdesk_id = \'' . tep_db_input($newsdesk_id) . '\' and language_id = \'' . $language_id . '\'');
	}
}

if (USE_CACHE == 'true') {
	tep_reset_cache_block('categories');
	tep_reset_cache_block('also_purchased');
}

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $newsdesk_id));
}  // midway closing if bracket
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'copy_to_confirm':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ( (tep_not_null($HTTP_POST_VARS['newsdesk_id'])) && (tep_not_null($HTTP_POST_VARS['categories_id'])) ) {
	$newsdesk_id = tep_db_prepare_input($HTTP_POST_VARS['newsdesk_id']);
	$categories_id = tep_db_prepare_input($HTTP_POST_VARS['categories_id']);

if ($HTTP_POST_VARS['copy_as'] == 'link') {
	if ($HTTP_POST_VARS['categories_id'] != $current_category_id) {
		$check_query = tep_db_query("select count(*) as total from " . TABLE_NEWSDESK_TO_CATEGORIES . " where newsdesk_id = '" . tep_db_input($newsdesk_id) . "' and categories_id = '" . tep_db_input($categories_id) . "'");
		$check = tep_db_fetch_array($check_query);
		if ($check['total'] < '1') {
			tep_db_query("insert into " . TABLE_NEWSDESK_TO_CATEGORIES . " (newsdesk_id, categories_id) values ('" . tep_db_input($newsdesk_id) . "', '" . tep_db_input($categories_id) . "')");
		}
		} else {
			$messageStack->add_session(ERROR_CANNOT_LINK_TO_SAME_CATEGORY, 'error');
		}
		} elseif ($HTTP_POST_VARS['copy_as'] == 'duplicate') {


$product_query = tep_db_query("
select newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_date_available, newsdesk_status, newsdesk_sticky 
from " . TABLE_NEWSDESK . " where newsdesk_id = '" . tep_db_input($newsdesk_id) . "'
");
$product = tep_db_fetch_array($product_query);

tep_db_query("
insert into " . TABLE_NEWSDESK . " (newsdesk_image, newsdesk_image_two, newsdesk_image_three, newsdesk_date_added, newsdesk_date_available, 
newsdesk_status, newsdesk_sticky) values ('" . $product['newsdesk_image'] . "','" . $product['newsdesk_image_two'] . "',
'" . $product['newsdesk_image_three'] . "', '" . $product['newsdesk_date_added']  . "', '" . $product['newsdesk_date_available'] . "', 
'" . $product['newsdesk_status'] . "', '" . $product['newsdesk_sticky'] . "')
");
$dup_newsdesk_id = tep_db_insert_id();


$description_query = tep_db_query("
select language_id, newsdesk_article_name, newsdesk_article_description, newsdesk_article_url, newsdesk_article_url_name, newsdesk_image_text, newsdesk_image_text_two, 
newsdesk_image_text_three, newsdesk_article_viewed, newsdesk_article_shorttext from " . TABLE_NEWSDESK_DESCRIPTION . " where newsdesk_id = '" . 
tep_db_input($newsdesk_id) . "'
");

while ($description = tep_db_fetch_array($description_query)) {
	tep_db_query("insert into " . TABLE_NEWSDESK_DESCRIPTION . " (newsdesk_id, language_id, newsdesk_article_name, 
newsdesk_article_description, newsdesk_article_url, newsdesk_article_url_name, newsdesk_image_text, newsdesk_image_text_two, newsdesk_image_text_three, 
newsdesk_article_viewed, newsdesk_article_shorttext) values ('" . $dup_newsdesk_id . "', '" . $description['language_id'] . "', '" 
. addslashes($description['newsdesk_article_name']) . "', '" . addslashes($description['newsdesk_article_description']) . "', 
'" . $description['newsdesk_article_url'] . "', '" . $description['newsdesk_article_url_name'] . "', '" . $description['newsdesk_image_text'] . "', '" . $description['newsdesk_image_text_two'] . "', 
'" . $description['newsdesk_image_text_three'] . "', '" . $description['newsdesk_article_viewed'] . "', 
'" . $description['newsdesk_article_shorttext'] . "')");
}


			tep_db_query("insert into " . TABLE_NEWSDESK_TO_CATEGORIES . " (newsdesk_id, categories_id) values ('" . $dup_newsdesk_id . "', '" . tep_db_input($categories_id) . "')");
			$newsdesk_id = $dup_newsdesk_id;
		}

	if (USE_CACHE == 'true') {
		tep_reset_cache_block('categories');
		tep_reset_cache_block('also_purchased');
	}
}  // top closing if bracket

tep_redirect(tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $categories_id . '&pID=' . $newsdesk_id));
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
	} // very top switch closing bracket
}  // very top if closing bracket

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// check if the catalog image directory exists
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if (is_dir(DIR_FS_CATALOG_IMAGES)) {
	if (!is_writeable(DIR_FS_CATALOG_IMAGES)) $messageStack->add(ERROR_CATALOG_IMAGE_DIRECTORY_NOT_WRITEABLE, 'error');
	} else {
		$messageStack->add(ERROR_CATALOG_IMAGE_DIRECTORY_DOES_NOT_EXIST, 'error');
}

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// end of the case scenrio code
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// html head / body / left column code area
//
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<script language="javascript" src="includes/menu.js"></script>
<script language="javascript" type="text/javascript" src="includes/javascript/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="includes/javascript/tiny_mce/opcje.js"></script>
<script language="javascript" src="includes/general.js"></script>
</head>

<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF" onload="SetFocus();">
<div id="spiffycalendar" class="text"></div>
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table width="100%" height="17" border="0" cellpadding="2" cellspacing="2">
    <td height="7"><tr>
<!-- body_text //-->
		<td width="100%" valign="top">

<table border="0" width="100%" cellspacing="0" cellpadding="2">

<?php
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
//  start of main body-text table
//
//  Also in here you'll find the new_product wood work
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_GET_VARS['action'] == 'new_product') {
if ( ($HTTP_GET_VARS['pID']) && (!$HTTP_POST_VARS) ) {
$product_query = tep_db_query("
select pd.newsdesk_article_name, pd.newsdesk_article_description, pd.newsdesk_article_shorttext, pd.newsdesk_article_url, pd.newsdesk_article_url_name, 
pd.newsdesk_image_text, pd.newsdesk_image_text_two, pd.newsdesk_image_text_three, p.newsdesk_id, p.newsdesk_image, p.newsdesk_image_two, 
p.newsdesk_image_three, p.newsdesk_date_added, p.newsdesk_last_modified, date_format(p.newsdesk_date_available, '%Y-%m-%d') 
as newsdesk_date_available, p.newsdesk_status, p.newsdesk_sticky from " 
. TABLE_NEWSDESK . " p, " . TABLE_NEWSDESK_DESCRIPTION . " pd where p.newsdesk_id = '" 
. $HTTP_GET_VARS['pID'] . "' and p.newsdesk_id = pd.newsdesk_id and pd.language_id = '" . $languages_id . "'");
$product = tep_db_fetch_array($product_query);

$pInfo = new objectInfo($product);
} elseif ($HTTP_POST_VARS) {
	$pInfo = new objectInfo($HTTP_POST_VARS);
	$newsdesk_article_name = $HTTP_POST_VARS['newsdesk_article_name'];
	$newsdesk_article_description = $HTTP_POST_VARS['newsdesk_article_description'];
	$newsdesk_article_shorttext = $HTTP_POST_VARS['newsdesk_article_shorttext'];
	$newsdesk_article_url = $HTTP_POST_VARS['newsdesk_article_url'];
	$newsdesk_article_url_name = $HTTP_POST_VARS['newsdesk_article_url_name'];
	$newsdesk_image_text = $HTTP_POST_VARS['newsdesk_image_text'];
	$newsdesk_image_text_two = $HTTP_POST_VARS['newsdesk_image_text_two'];
	$newsdesk_image_text_three = $HTTP_POST_VARS['newsdesk_image_text_three'];
	$newsdesk_image = $HTTP_POST_VARS['newsdesk_image'];
	$newsdesk_image_two = $HTTP_POST_VARS['newsdesk_image_two'];
	$newsdesk_image_three = $HTTP_POST_VARS['newsdesk_image_three'];
} else {
	$pInfo = new objectInfo(array());
}

$languages = tep_get_languages();

switch ($pInfo->newsdesk_status) {
	case '0': $in_status = false; $out_status = true; break;
	case '1':
	default: $in_status = true; $out_status = false;
}

switch ($pInfo->newsdesk_sticky) {
	case '0': $sticky_on = false; $sticky_off = true; break;
	case '1': $sticky_on = true; $sticky_off = false; break;
	default: $sticky_on = false; $sticky_off = true;
}




// -------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
<link rel="stylesheet" type="text/css" href="includes/javascript/spiffyCal/spiffyCal_v2_1.css">
<script language="JavaScript" src="includes/javascript/spiffyCal/spiffyCal_v2_1.js"></script>
<script language="javascript">
var dateAvailable = new ctlSpiffyCalendarBox("dateAvailable", "new_product", "newsdesk_date_available","btnDate1","<?php echo $pInfo->newsdesk_date_available; ?>",scBTNMODE_CUSTOMBLUE);
</script>

	<tr>
		<td>
<?php 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
?>

<?php echo tep_draw_form('new_product', FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $HTTP_GET_VARS['pID'] . '&action=new_product_preview', 'post', 'enctype="multipart/form-data"'); ?>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td class="pageHeading"><?php echo sprintf(TEXT_NEW_NEWSDESK, newsdesk_output_generated_category_path($current_category_id)); ?></td>
		<td class="pageHeading" align="right">
<?php echo tep_draw_hidden_field('newsdesk_date_added', (($pInfo->newsdesk_date_added) ? $pInfo->newsdesk_date_added : date('Y-m-d'))) . tep_draw_hidden_field('newsdesk_date_available', (($pInfo->newsdesk_date_available) ? $pInfo->newsdesk_date_available : date('Y-m-d'))) . tep_image_submit('button_preview.gif', IMAGE_PREVIEW) . '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $HTTP_GET_VARS['pID']) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>'; ?>
		</td>
	</tr>
</table>


<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="main" width="50%" valign="top">


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_HEADLINE; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr>
		<td class="main">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_article_name[' . $languages[$i]['id'] . ']', (($newsdesk_article_name[$languages[$i]['id']]) ? 
stripslashes($newsdesk_article_name[$languages[$i]['id']]) : newsdesk_get_newsdesk_article_name($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="50"'); ?>
		</td>
	</tr>
<?php
} //  ........... <<<< .............. end of products name language loop
?>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_SUMMARY; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php 
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
?>

	<tr>
		<td class="main" valign="top">
<?php
echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']);
?>
		</td>
		<td class="main">

<?php
//  require(DIR_WS_INCLUDES . 'modules/newsdesk/html_editor/summary_bb.php');
 echo newsdesk_draw_textarea_field('newsdesk_article_shorttext_' . $languages[$i]['id'] . '', 'soft', '100%', '25', (($newsdesk_article_shorttext[$languages[$i]['id']]) ? stripslashes($newsdesk_article_shorttext[$languages[$i]['id']]) : newsdesk_get_newsdesk_article_shorttext($pInfo->newsdesk_id, $languages[$i]['id'])));
?>

		</td>
	</tr>
<?php
} // ........... <<<< .............. end of products description language loop
?>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_CONTENT; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr>
		<td class="main" valign="top">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php
// require(DIR_WS_INCLUDES . 'modules/newsdesk/html_editor/content_bb.php');
 echo newsdesk_draw_textarea_field('newsdesk_article_description_' . $languages[$i]['id'] . '', 'soft', '100%', '25', (($newsdesk_article_description[$languages[$i]['id']]) ? stripslashes($newsdesk_article_description[$languages[$i]['id']]) : newsdesk_get_newsdesk_article_description($pInfo->newsdesk_id, $languages[$i]['id'])));
?>
		</td>
	</tr>
<?php } // ........... <<<< .............. end of products description language loop ?>
</table>



		</td>
		<td class="main" width="50%" valign="top">



<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_STATUS; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td class="main">
<?php echo tep_draw_radio_field('newsdesk_status', '1', $in_status) . '&nbsp;' . TEXT_NEWSDESK_AVAILABLE; ?>
<?php echo tep_draw_radio_field('newsdesk_status', '0', $out_status) . '&nbsp;' . TEXT_NEWSDESK_NOT_AVAILABLE; ?>
		</td>
	</tr>
	<tr>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_STICKY; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td class="main">
<?php echo tep_draw_radio_field('newsdesk_sticky', '1', $sticky_on) . '&nbsp;' . TEXT_NEWSDESK_STICKY_ON; ?>
<?php echo tep_draw_radio_field('newsdesk_sticky', '0', $sticky_off) . '&nbsp;' . TEXT_NEWSDESK_STICKY_OFF; ?>
		</td>
	</tr>
	<tr>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_DATE_FORMAT; ?>&nbsp;&nbsp;<small>(YYYY-MM-DD)</small></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td class="main" width="25%"><?php echo TEXT_NEWSDESK_START_DATE; ?></td>
		<td class="main">
<script language="javascript">dateAvailable.writeControl(); dateAvailable.dateFormat="yyyy-MM-dd";</script>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_URL . '&nbsp;&nbsp;<small>' . TEXT_NEWSDESK_URL_WITHOUT_HTTP . '</small>'; ?></td>
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_URL_NAME; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	</tr>
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr>
		<td class="main">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_article_url[' . $languages[$i]['id'] . ']', (($newsdesk_article_url[$languages[$i]['id']]) ? stripslashes($newsdesk_article_url[$languages[$i]['id']]) : newsdesk_get_newsdesk_article_url($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="40"'); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_article_url_name[' . $languages[$i]['id'] . ']', (($newsdesk_article_url_name[$languages[$i]['id']]) ? stripslashes($newsdesk_article_url_name[$languages[$i]['id']]) : newsdesk_get_newsdesk_article_url_name($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="20"'); ?>
		</td>
	</tr>
<?php } // ........... <<<< .............. end of loop for article url?>
	<tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_IMAGE; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr class="main">
		<td class="" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_ONE; ?></td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php echo newsdesk_draw_file_field('newsdesk_image', 'size="40"'); ?>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr class="main">
		<td class="main" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_SUBTITLE; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_image_text[' . $languages[$i]['id'] . ']', (($newsdesk_image_text[$languages[$i]['id']]) ? 
stripslashes($newsdesk_image_text[$languages[$i]['id']]) : newsdesk_get_newsdesk_image_text($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="50"');
	if ($pInfo->newsdesk_image) {
		echo ' &nbsp; '.tep_draw_checkbox_field('newsdesk_image_one_kill','1',false).' usu? zdj?cie';
	}
?>
		</td>
	</tr>
<?php
} //  ........... <<<< .............. end of newsdesk_image_text loop
?>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="main">
<?php
echo tep_draw_hidden_field('products_previous_image', $pInfo->newsdesk_image);
if ($pInfo->newsdesk_image) {
echo tep_image(DIR_WS_CATALOG_IMAGES . $pInfo->newsdesk_image);
}
?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php
echo $pInfo->newsdesk_image;
?>
		</td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?>
		</td>
	</tr>
	<tr>
		<td class="headerBar">
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '1'); ?>
		</td>
	</tr>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr class="main">
		<td class="main" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_TWO; ?></td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php echo newsdesk_draw_file_field('newsdesk_image_two', 'size="40"'); ?>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr class="main">
		<td class="main" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_SUBTITLE_TWO; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_image_text_two[' . $languages[$i]['id'] . ']', (($newsdesk_image_text_two[$languages[$i]['id']]) ? 
stripslashes($newsdesk_image_text_two[$languages[$i]['id']]) : newsdesk_get_newsdesk_image_text_two($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="50"');
	if ($pInfo->newsdesk_image_two) {
		echo ' &nbsp; '.tep_draw_checkbox_field('newsdesk_image_two_kill','1',false).' usu? zdj?cie';
	}
?>
		</td>
	</tr>
<?php
} //  ........... <<<< .............. end of newsdesk_image_text_two loop
?>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="main">
<?php
echo tep_draw_hidden_field('products_previous_image_two', $pInfo->newsdesk_image_two);
if ($pInfo->newsdesk_image_two) {
echo tep_image(DIR_WS_CATALOG_IMAGES . $pInfo->newsdesk_image_two);
}
?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php
echo $pInfo->newsdesk_image_two;
?>
		</td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?>
		</td>
	</tr>
	<tr>
		<td class="headerBar">
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '1'); ?>
		</td>
	</tr>
</table>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr class="main">
		<td class="main" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_THREE; ?></td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php echo newsdesk_draw_file_field('newsdesk_image_three', 'size="40"'); ?>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
<?php for ($i = 0, $n = sizeof($languages); $i < $n; $i++) { ?>
	<tr class="main">
		<td class="main" colspan="2"><?php echo TEXT_NEWSDESK_IMAGE_SUBTITLE_THREE; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="main">
<?php echo tep_draw_input_field('newsdesk_image_text_three[' . $languages[$i]['id'] . ']', (($newsdesk_image_text_three[$languages[$i]['id']]) ? 
stripslashes($newsdesk_image_text_three[$languages[$i]['id']]) : newsdesk_get_newsdesk_image_text_three($pInfo->newsdesk_id, $languages[$i]['id'])), 'size="50"');
	if ($pInfo->newsdesk_image_three) {
		echo ' &nbsp; '.tep_draw_checkbox_field('newsdesk_image_three_kill','1',false).' usu? zdj?cie';
	}
?>
		</td>
	</tr>
<?php
} //  ........... <<<< .............. end of newsdesk_image_text_three loop
?>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="main">
<?php
echo tep_draw_hidden_field('products_previous_image_three', $pInfo->newsdesk_image_three);
if ($pInfo->newsdesk_image_three) {
echo tep_image(DIR_WS_CATALOG_IMAGES . $pInfo->newsdesk_image_three);
}
?>
		</td>
	</tr>
	<tr>
		<td class="main">
<?php
echo $pInfo->newsdesk_image_three;
?>
		</td>
	</tr>
	<tr>
		<td>
<?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?>
		</td>
	</tr>
</table>


		</td>
	</tr>
</table>
<br>


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td class="main" align="right">
<?php echo tep_draw_hidden_field('newsdesk_date_added', (($pInfo->newsdesk_date_added) ? $pInfo->newsdesk_date_added : date('Y-m-d'))) . tep_image_submit('button_preview.gif', IMAGE_PREVIEW) . '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $HTTP_GET_VARS['pID']) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>'; ?>
		</td>
	</tr>
</table>

</form>

		</td>
	</tr>


<?php
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
} elseif ($HTTP_GET_VARS['action'] == 'new_product_preview') {

if ($HTTP_POST_VARS) {
$pInfo = new objectInfo($HTTP_POST_VARS);
$newsdesk_article_name = $HTTP_POST_VARS['newsdesk_article_name'];
$newsdesk_article_description = $HTTP_POST_VARS['newsdesk_article_description'];
$newsdesk_article_shorttext = $HTTP_POST_VARS['newsdesk_article_shorttext'];


$newsdesk_article_shorttext[1] = ($HTTP_POST_VARS['newsdesk_article_shorttext_1']);
$newsdesk_article_shorttext[2] = ($HTTP_POST_VARS['newsdesk_article_shorttext_2']);
$newsdesk_article_shorttext[3] = ($HTTP_POST_VARS['newsdesk_article_shorttext_3']);
$newsdesk_article_shorttext[4] = ($HTTP_POST_VARS['newsdesk_article_shorttext_4']);
$newsdesk_article_shorttext[5] = ($HTTP_POST_VARS['newsdesk_article_shorttext_5']);
$newsdesk_article_shorttext[6] = ($HTTP_POST_VARS['newsdesk_article_shorttext_6']);
$newsdesk_article_shorttext[7] = ($HTTP_POST_VARS['newsdesk_article_shorttext_7']);
$newsdesk_article_shorttext[8] = ($HTTP_POST_VARS['newsdesk_article_shorttext_8']);
$newsdesk_article_shorttext[9] = ($HTTP_POST_VARS['newsdesk_article_shorttext_9']);


$newsdesk_article_description[1] = ($HTTP_POST_VARS['newsdesk_article_description_1']);
$newsdesk_article_description[2] = ($HTTP_POST_VARS['newsdesk_article_description_2']);
$newsdesk_article_description[3] = ($HTTP_POST_VARS['newsdesk_article_description_3']);
$newsdesk_article_description[4] = ($HTTP_POST_VARS['newsdesk_article_description_4']);
$newsdesk_article_description[5] = ($HTTP_POST_VARS['newsdesk_article_description_5']);
$newsdesk_article_description[6] = ($HTTP_POST_VARS['newsdesk_article_description_6']);
$newsdesk_article_description[7] = ($HTTP_POST_VARS['newsdesk_article_description_7']);
$newsdesk_article_description[8] = ($HTTP_POST_VARS['newsdesk_article_description_8']);
$newsdesk_article_description[9] = ($HTTP_POST_VARS['newsdesk_article_description_9']);


$newsdesk_article_url = $HTTP_POST_VARS['newsdesk_article_url'];
$newsdesk_article_url_name = $HTTP_POST_VARS['newsdesk_article_url_name'];
$newsdesk_image_text = $HTTP_POST_VARS['newsdesk_image_text'];
$newsdesk_image_text_two = $HTTP_POST_VARS['newsdesk_image_text_two'];
$newsdesk_image_text_three = $HTTP_POST_VARS['newsdesk_image_text_three'];

$newsdesk_image_one_kill = $HTTP_POST_VARS['newsdesk_image_one_kill'];
$newsdesk_image_two_kill = $HTTP_POST_VARS['newsdesk_image_two_kill'];
$newsdesk_image_three_kill = $HTTP_POST_VARS['newsdesk_image_three_kill'];

// copy image only if modified
$newsdesk_image = tep_get_uploaded_file('newsdesk_image');
$newsdesk_image_two = tep_get_uploaded_file('newsdesk_image_two');
$newsdesk_image_three = tep_get_uploaded_file('newsdesk_image_three');
$image_directory = tep_get_local_path(DIR_FS_CATALOG_IMAGES);

// BEGIN code by Peter
if ( ($newsdesk_image != 'none') && ($newsdesk_image != '') ) {
	$newsdesk_image = tep_get_uploaded_file('newsdesk_image');
	$image_directory = tep_get_local_path(DIR_FS_CATALOG_IMAGES);
}
if ( ($newsdesk_image_two != 'none') && ($newsdesk_image_two != '') ) {
	$newsdesk_image_two = tep_get_uploaded_file('newsdesk_image_two');
	$image_directory = tep_get_local_path(DIR_FS_CATALOG_IMAGES);
}
if ( ($newsdesk_image_three != 'none') && ($newsdesk_image_three != '') ) {
	$newsdesk_image_three = tep_get_uploaded_file('newsdesk_image_three');
	$image_directory = tep_get_local_path(DIR_FS_CATALOG_IMAGES);
}

if (is_uploaded_file($newsdesk_image['tmp_name'])) {
	tep_copy_uploaded_file($newsdesk_image, $image_directory);
	$newsdesk_image_name = $newsdesk_image['name'];
} else {
	if($newsdesk_image_one_kill == '1') {
		$newsdesk_image_name = '';
	} else {
		$newsdesk_image_name = $HTTP_POST_VARS['products_previous_image'];
	}
}

if (is_uploaded_file($newsdesk_image_two['tmp_name'])) {
	tep_copy_uploaded_file($newsdesk_image_two, $image_directory);
	$newsdesk_image_name_two = $newsdesk_image_two['name'];
} else {
	if($newsdesk_image_two_kill == '1') {
		$newsdesk_image_name_two = '';
	} else {
		$newsdesk_image_name_two = $HTTP_POST_VARS['products_previous_image_two'];
	}
}

if (is_uploaded_file($newsdesk_image_three['tmp_name'])) {
	tep_copy_uploaded_file($newsdesk_image_three, $image_directory);
	$newsdesk_image_name_three = $newsdesk_image_three['name'];
} else {
	if($newsdesk_image_three_kill == '1') {
		$newsdesk_image_name_three = '';
	} else {
		$newsdesk_image_name_three = $HTTP_POST_VARS['products_previous_image_three'];
	}
}
// END of Peter's changes

} else {
$product_query = tep_db_query("
select p.newsdesk_id, pd.language_id, pd.newsdesk_article_name, pd.newsdesk_article_description, pd.newsdesk_article_shorttext, 
pd.newsdesk_article_url, pd.newsdesk_article_url_name, pd.newsdesk_image_text, pd.newsdesk_image_text_two, pd.newsdesk_image_text_three, p.newsdesk_image, 
p.newsdesk_image_two, p.newsdesk_image_three, p.newsdesk_date_added, p.newsdesk_last_modified, 
p.newsdesk_date_available, p.newsdesk_status, p.newsdesk_sticky from " . TABLE_NEWSDESK . " p, " . TABLE_NEWSDESK_DESCRIPTION . " 
pd where p.newsdesk_id = pd.newsdesk_id and p.newsdesk_id = '" . $HTTP_GET_VARS['pID'] . "'
");
	$product = tep_db_fetch_array($product_query);

	$pInfo = new objectInfo($product);
	$newsdesk_image_name = $pInfo->newsdesk_image;
	$newsdesk_image_name_two = $pInfo->newsdesk_image_two;
	$newsdesk_image_name_three = $pInfo->newsdesk_image_three;
}

$form_action = ($HTTP_GET_VARS['pID']) ? 'update_product' : 'insert_product';

echo tep_draw_form($form_action, FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $HTTP_GET_VARS['pID'] . '&action=' . $form_action, 'post', 'enctype="multipart/form-data"');

$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
if ($HTTP_GET_VARS['read'] == 'only') {
	$pInfo->newsdesk_article_name = newsdesk_get_newsdesk_article_name($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_article_description = newsdesk_get_newsdesk_article_description($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_article_shorttext = newsdesk_get_newsdesk_article_shorttext($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_article_url = newsdesk_get_newsdesk_article_url($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_article_url_name = newsdesk_get_newsdesk_article_url_name($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_image_text = newsdesk_get_newsdesk_image_text($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_image_text_two = newsdesk_get_newsdesk_image_text_two($pInfo->newsdesk_id, $languages[$i]['id']);
	$pInfo->newsdesk_image_text_three = newsdesk_get_newsdesk_image_text_three($pInfo->newsdesk_id, $languages[$i]['id']);
} else {
	$pInfo->newsdesk_article_name = tep_db_prepare_input($newsdesk_article_name[$languages[$i]['id']]);
	$pInfo->newsdesk_article_description = tep_db_prepare_input($newsdesk_article_description[$languages[$i]['id']]);
	$pInfo->newsdesk_article_shorttext = tep_db_prepare_input($newsdesk_article_shorttext[$languages[$i]['id']]);
	$pInfo->newsdesk_article_url = tep_db_prepare_input($newsdesk_article_url[$languages[$i]['id']]);
	$pInfo->newsdesk_article_url_name = tep_db_prepare_input($newsdesk_article_url_name[$languages[$i]['id']]);
	$pInfo->newsdesk_image_text = tep_db_prepare_input($newsdesk_image_text[$languages[$i]['id']]);
	$pInfo->newsdesk_image_text_two = tep_db_prepare_input($newsdesk_image_text_two[$languages[$i]['id']]);
	$pInfo->newsdesk_image_text_three = tep_db_prepare_input($newsdesk_image_text_three[$languages[$i]['id']]);
}
?>

	<tr>
		<td>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr>
		<td colspan="2">

<table border="0" width="100%" cellspacing="0" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent" width="5%">
<?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?>
		</td>
		<td class="headerBarContent"><?php echo $pInfo->newsdesk_article_name; ?></td>
	</tr>
</table>

		</td>
	</tr>
	<tr>
		<td width="50%" valign="top">

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_SUMMARY; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo $pInfo->newsdesk_article_shorttext; ?>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_CONTENT; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo $pInfo->newsdesk_article_description; ?>
		</td>
	</tr>
</table>


		</td>
		<td width="50%" valign="top">


<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_IMAGE_PREVIEW_ONE; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php
// BEGIN >> code change by Peter
echo (($newsdesk_image_name) ? tep_image(DIR_WS_CATALOG_IMAGES . $newsdesk_image_name, $pInfo->newsdesk_article_name, '', '',
'align="right" hspace="5" vspace="5"') : '') .'';
// END >> code change by Peter
?>
		</td>
	</tr>
	<tr>
		<td><?php echo $pInfo->newsdesk_image_text; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_IMAGE_PREVIEW_TWO; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php
// BEGIN >> code change by Peter
echo (($newsdesk_image_name_two) ? tep_image(DIR_WS_CATALOG_IMAGES . $newsdesk_image_name_two, $pInfo->newsdesk_article_name, '', '',
'align="right" hspace="5" vspace="5"') : '') .'';
// END >> code change by Peter
?>
		</td>
	</tr>
	<tr>
		<td><?php echo $pInfo->newsdesk_image_text_two; ?></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_IMAGE_PREVIEW_THREE; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php
// BEGIN >> code change by Peter
echo (($newsdesk_image_name_three) ? tep_image(DIR_WS_CATALOG_IMAGES . $newsdesk_image_name_three, $pInfo->newsdesk_article_name, '', '',
'align="right" hspace="5" vspace="5"') : '') .'';
// END >> code change by Peter
?>
		</td>
	</tr>
	<tr>
		<td><?php echo $pInfo->newsdesk_image_text_three; ?></td>
	</tr>
</table>

<?php if ($pInfo->newsdesk_article_url) { ?>
<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_ADDED_LINK_HEADER; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php $newslink = ($pInfo->newsdesk_article_url_name); ?>
<?php echo sprintf('<a href="http://%s" target="blank"><u>' . $newslink . '</u></a>', $pInfo->newsdesk_article_url); ?>
		</td>
	</tr>
</table>
<?php
} // --------->>>>>>>> end of loop control for checking url
?>
<?php if ($pInfo->newsdesk_article_url_name) { ?>
<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_ADDED_LINK_HEADER_NAME; ?></td>
	</tr>
	<tr>
		<td class="main">
<?php echo $pInfo->newsdesk_article_url_name; ?>
		</td>
	</tr>
</table>
<?php
} // --------->>>>>>>> end of loop control for checking url name
?>
<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_DATE_ADDED; ?></td>
	</tr>
	<tr>
		<td class="main"><?php echo sprintf(tep_date_long($pInfo->newsdesk_date_added)); ?></td>
	</tr>
	<tr>
</table>

<table border="0" width="100%" cellspacing="3" cellpadding="3">
	<tr class="headerBar">
		<td class="headerBarContent"><?php echo TEXT_NEWSDESK_DATE_AVAILABLE; ?></td>
	</tr>
	<tr>
		<td class="main"><?php echo sprintf(tep_date_long($pInfo->newsdesk_date_available)); ?></td>
	</tr>
	<tr>
</table>


		</td>
	</tr>
</table>


<?php } // --------->>>>>>>> break time to run some code checks


if ($HTTP_GET_VARS['read'] == 'only') {
if ($HTTP_GET_VARS['origin']) {
	$pos_params = strpos($HTTP_GET_VARS['origin'], '?', 0);
	if ($pos_params != false) {
		$back_url = substr($HTTP_GET_VARS['origin'], 0, $pos_params);
		$back_url_params = substr($HTTP_GET_VARS['origin'], $pos_params + 1);
	} else {
		$back_url = $HTTP_GET_VARS['origin'];
		$back_url_params = '';
	}
	} else {
		$back_url = FILENAME_NEWSDESK;
		$back_url_params = 'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id;
	}
?>

	<tr>
		<td align="right">
<?php echo '<a href="' . tep_href_link($back_url, $back_url_params, 'NONSSL') . '">' . tep_image_button('button_back.gif', IMAGE_BACK) . '</a>'; ?>
		</td>
	</tr>

<?php
} else {  // --------->>>>>>>> were do we go from here
?>


	<tr>
		<td align="right" class="smallText">


<?php
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// Re-Post all POST'ed variables
// main table area that shows the catagories, the left box, and the counts at the bottom of the catagory area
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
reset($HTTP_POST_VARS);
while (list($key, $value) = each($HTTP_POST_VARS)) {
	if (!is_array($HTTP_POST_VARS[$key])) {
		echo tep_draw_hidden_field($key, htmlspecialchars(stripslashes($value)));
	}
}

$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
	echo tep_draw_hidden_field('newsdesk_article_name[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_article_name[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_article_description[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_article_description[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_article_shorttext[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_article_shorttext[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_article_url[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_article_url[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_article_url_name[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_article_url_name[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_image_text[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_image_text[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_image_text_two[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_image_text_two[$languages[$i]['id']])));
	echo tep_draw_hidden_field('newsdesk_image_text_three[' . $languages[$i]['id'] . ']', htmlspecialchars(stripslashes($newsdesk_image_text_three[$languages[$i]['id']])));
}

echo tep_draw_hidden_field('newsdesk_image', stripslashes($newsdesk_image_name));
echo tep_draw_hidden_field('newsdesk_image_two', stripslashes($newsdesk_image_name_two));
echo tep_draw_hidden_field('newsdesk_image_three', stripslashes($newsdesk_image_name_three));

echo tep_image_submit('button_back.gif', IMAGE_BACK, 'name="edit"') . '&nbsp;&nbsp;';

if ($HTTP_GET_VARS['pID']) {
	echo tep_image_submit('button_update.gif', IMAGE_UPDATE);
} else {
	echo tep_image_submit('button_insert.gif', IMAGE_INSERT);
}

echo '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $HTTP_GET_VARS['pID']) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>';
?>

		</td>
</form>
	</tr>

<?php
}
} else {
?>

	<tr>
		<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
		<td class="pageHeading" align="right"><?php echo tep_draw_separator('pixel_trans.gif', 1, HEADING_IMAGE_HEIGHT); ?></td>
		<td align="right"><table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
<?php echo tep_draw_form('search', FILENAME_NEWSDESK, '', 'get'); ?>
	<td class="smallText" align="right"><?php echo HEADING_TITLE_SEARCH . ' ' . tep_draw_input_field('search', $HTTP_GET_VARS['search']); ?></td>
</form>
	</tr>
	<tr>
<?php echo tep_draw_form('goto', FILENAME_NEWSDESK, '', 'get'); ?>
		<td class="smallText" align="right">
<?php echo HEADING_TITLE_GOTO . ' ' . tep_draw_pull_down_menu('cPath', newsdesk_get_category_tree(), $current_category_id, 'onChange="this.form.submit();"'); ?>
		</td>
</form>
	</tr>
</table>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
<table border="0" width="100%" cellspacing="0" cellpadding="2">
	<tr>
		<td class="smallText"></td>
		<td align="right" class="smallText">
<?php
/* 
if ($cPath) echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, $cPath_back . '&cID=' . $current_category_id) . '">' . 
tep_image_button('button_back.gif', IMAGE_BACK) . '</a>&nbsp;'; if (!$HTTP_GET_VARS['search']) echo '<a href="' . 
tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_category') . '">' . tep_image_button('button_new_category.gif', 
IMAGE_NEW_CATEGORY) . '</a>&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_product') . '">' . tep_image_button('button_new_news_item.gif', IMAGE_NEW_STORY) . '</a>'; 
*/
?>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td valign="top">
<table border="0" width="100%" cellspacing="0" cellpadding="2">
	<tr class="dataTableHeadingRow">
		<td class="dataTableHeadingContent"><?php echo TABLE_HEADING_CATEGORIES_NEWSDESK; ?></td>
		<td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_DATE; ?></td>
        	<td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_STATUS; ?></td>
		<td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_STICKY; ?></td>
		<td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION; ?>&nbsp;</td>
	</tr>

<?php
$categories_count = 0;
$rows = 0;

if ($HTTP_GET_VARS['search']) {
/*
	$categories_query = tep_db_query("select c.categories_id, cd.categories_name, c.categories_image, c.parent_id, c.sort_order, c.date_added, c.last_modified from " . TABLE_NEWSDESK_CATEGORIES . " c, " . TABLE_NEWSDESK_CATEGORIES_DESCRIPTION . " cd where c.categories_id = cd.categories_id and cd.language_id = '" . $languages_id . "' and cd.categories_name like '%" . $HTTP_GET_VARS['search'] . "%' order by c.sort_order, cd.categories_name");
} else {
	$categories_query = tep_db_query("select c.categories_id, cd.categories_name, c.categories_image, c.parent_id, c.sort_order, c.date_added, c.last_modified from " . TABLE_NEWSDESK_CATEGORIES . " c, " . TABLE_NEWSDESK_CATEGORIES_DESCRIPTION . " cd where c.parent_id = '" . $current_category_id . "' and c.categories_id = cd.categories_id and cd.language_id = '" . $languages_id . "' order by c.sort_order, cd.categories_name");
*/

	$categories_query = tep_db_query("select c.categories_id, cd.categories_name, c.categories_image, c.parent_id, c.sort_order, c.date_added, c.last_modified, c.catagory_status from " . TABLE_NEWSDESK_CATEGORIES . " c, " . TABLE_NEWSDESK_CATEGORIES_DESCRIPTION . " cd where c.categories_id = cd.categories_id and cd.language_id = '" . $languages_id . "' and cd.categories_name like '%" . $HTTP_GET_VARS['search'] . "%' order by c.sort_order, cd.categories_name");
} else {
	$categories_query = tep_db_query("select c.categories_id, cd.categories_name, c.categories_image, c.parent_id, c.sort_order, c.date_added, c.last_modified, c.catagory_status from " . TABLE_NEWSDESK_CATEGORIES . " c, " . TABLE_NEWSDESK_CATEGORIES_DESCRIPTION . " cd where c.parent_id = '" . $current_category_id . "' and c.categories_id = cd.categories_id and cd.language_id = '" . $languages_id . "' order by c.sort_order, cd.categories_name");}



while ($categories = tep_db_fetch_array($categories_query)) {
	$categories_count++;
	$rows++;
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// Get parent_id for subcategories if search 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_GET_VARS['search']) $cPath= $categories['parent_id'];

if ( ((!$HTTP_GET_VARS['cID']) && (!$HTTP_GET_VARS['pID']) || (@$HTTP_GET_VARS['cID'] == $categories['categories_id'])) && (!$cInfo) && (substr($HTTP_GET_VARS['action'], 0, 4) != 'new_') ) {
	$category_childs = array('childs_count' => newsdesk_childs_in_category_count($categories['categories_id']));
	$category_products = array('products_count' => newsdesk_products_in_category_count($categories['categories_id']));

	$cInfo_array = array_merge($categories, $category_childs, $category_products);
	$cInfo = new objectInfo($cInfo_array);
}

if ( (is_object($cInfo)) && ($categories['categories_id'] == $cInfo->categories_id) ) {
	echo '<tr class="dataTableRowSelected" onmouseover="this.style.cursor=\'hand\'" onclick="document.location.href=\'' . tep_href_link(FILENAME_NEWSDESK, newsdesk_get_path($categories['categories_id'])) . '\'">' . "\n";
} else {
	echo '<tr class="dataTableRow" onmouseover="this.className=\'dataTableRowOver\';this.style.cursor=\'hand\'" onmouseout="this.className=\'dataTableRow\'" onclick="document.location.href=\'' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $categories['categories_id']) . '\'">' . "\n";
}

?>

		<td class="dataTableContent"><?php echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, newsdesk_get_path($categories['categories_id'])) . '">' . tep_image(DIR_WS_ICONS . 'folder.gif', ICON_FOLDER) . '</a>&nbsp;<b>' . $categories['categories_name'] . '</b>'; ?></td>
		<td class="dataTableContent" align="center">
<?php
echo $products['newsdesk_date_added'];
?>
		</td>
		<td class="dataTableContent" align="center">

<?php
if ($categories['catagory_status'] == '1') {
echo tep_image(DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_GREEN, 10, 10) . '&nbsp;&nbsp;<a href="' 
. tep_href_link(FILENAME_NEWSDESK, 'action=setflag&flag=0&cID=' . $categories['categories_id'] . '&cPath=' . $cPath) . '">' 
. tep_image(DIR_WS_IMAGES . 'icon_status_red_light.gif', IMAGE_ICON_STATUS_RED_LIGHT, 10, 10) . '</a>';
} else {
echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'action=setflag&flag=1&cID=' . $categories['categories_id'] 
. '&cPath=' . $cPath) . '">' . tep_image(DIR_WS_IMAGES . 'icon_status_green_light.gif', IMAGE_ICON_STATUS_GREEN_LIGHT, 10, 10) 
. '</a>&nbsp;&nbsp;' . tep_image(DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_STATUS_RED, 10, 10);
}
?>

		</td>
		<td class="dataTableContent" align="right">&nbsp;</td>

		<td class="dataTableContent" align="right">
<?php
if ( (is_object($cInfo)) && ($categories['categories_id'] == $cInfo->categories_id) ) {
	echo tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', '');
} else {
echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $categories['categories_id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>';
}
?>

		&nbsp;</td>
	</tr>

<?php
}

$products_count = 0;
if ($HTTP_GET_VARS['search']) {
$products_query = tep_db_query("
select p.newsdesk_id, pd.newsdesk_article_name, p.newsdesk_image, p.newsdesk_image_two, p.newsdesk_image_three, p.newsdesk_date_added, 
p.newsdesk_last_modified, p.newsdesk_date_available, p.newsdesk_status, p.newsdesk_sticky, p2c.categories_id from " . TABLE_NEWSDESK . " p, " 
. TABLE_NEWSDESK_DESCRIPTION . " pd, " . TABLE_NEWSDESK_TO_CATEGORIES . " p2c where p.newsdesk_id = pd.newsdesk_id and pd.language_id = '" 
. $languages_id . "' and p.newsdesk_id = p2c.newsdesk_id and pd.newsdesk_article_name like '%" . $HTTP_GET_VARS['search'] . "%' 
order by p.newsdesk_date_added desc
");
} else {
$products_query = tep_db_query("
select p.newsdesk_id, pd.newsdesk_article_name, p.newsdesk_image, p.newsdesk_image_two, p.newsdesk_image_three, p.newsdesk_date_added, 
p.newsdesk_last_modified, p.newsdesk_date_available, p.newsdesk_status, p.newsdesk_sticky from " . TABLE_NEWSDESK . " p, " 
. TABLE_NEWSDESK_DESCRIPTION . " pd, " . TABLE_NEWSDESK_TO_CATEGORIES . " p2c where p.newsdesk_id = pd.newsdesk_id and pd.language_id = '" 
. $languages_id . "' and p.newsdesk_id = p2c.newsdesk_id and p2c.categories_id = '" . $current_category_id . "' order by 
p.newsdesk_date_added desc
");
}
while ($products = tep_db_fetch_array($products_query)) {
	$products_count++;
	$rows++;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// Get categories_id for product if search 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_GET_VARS['search']) $cPath=$products['categories_id'];
	if ( ((!$HTTP_GET_VARS['pID']) && (!$HTTP_GET_VARS['cID']) || (@$HTTP_GET_VARS['pID'] == $products['newsdesk_id'])) && (!$pInfo) && (!$cInfo) && (substr($HTTP_GET_VARS['action'], 0, 4) != 'new_') ) {
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// find out the rating average from customer reviews
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$reviews_query = tep_db_query("select (avg(reviews_rating) / 5 * 100) as average_rating from " . TABLE_REVIEWS . " where products_id = '" . $products['newsdesk_id'] . "'");
	$reviews = tep_db_fetch_array($reviews_query);
	$pInfo_array = array_merge($products, $reviews);
	$pInfo = new objectInfo($pInfo_array);
	}

	if ( (is_object($pInfo)) && ($products['newsdesk_id'] == $pInfo->newsdesk_id) ) {
		echo '<tr class="dataTableRowSelected" onmouseover="this.style.cursor=\'hand\'" onclick="document.location.href=\'' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $products['newsdesk_id'] . '&action=new_product_preview&read=only') . '\'">' . "\n";
	} else {
		echo '<tr class="dataTableRow" onmouseover="this.className=\'dataTableRowOver\';this.style.cursor=\'hand\'" onmouseout="this.className=\'dataTableRow\'" onclick="document.location.href=\'' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $products['newsdesk_id']) . '\'">' . "\n";
	}
?>
		<td class="dataTableContent">
<?php
echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $products['newsdesk_id'] . '&action=new_product_preview&read=only') . '">' . tep_image(DIR_WS_ICONS . 'preview.gif', ICON_PREVIEW) . '</a>&nbsp;' . $products['newsdesk_article_name'];
?>
		</td>
		<td class="dataTableContent" align="center">
<?php
echo $products['newsdesk_date_added'];
?>
		</td>
		<td class="dataTableContent" align="center">
<?php
if ($products['newsdesk_status'] == '1') {
	echo tep_image(DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_GREEN, 10, 10) . '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'action=setflag&flag=0&pID=' . $products['newsdesk_id'] . '&cPath=' . $cPath) . '">' . tep_image(DIR_WS_IMAGES . 'icon_status_red_light.gif', IMAGE_ICON_STATUS_RED_LIGHT, 10, 10) . '</a>';
} else {
	echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'action=setflag&flag=1&pID=' . $products['newsdesk_id'] . '&cPath=' . $cPath) . '">' . tep_image(DIR_WS_IMAGES . 'icon_status_green_light.gif', IMAGE_ICON_STATUS_GREEN_LIGHT, 10, 10) . '</a>&nbsp;&nbsp;' . tep_image(DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_STATUS_RED, 10, 10);
}
?>
		</td>
		<td class="dataTableContent" align="center">
<?php
if ($products['newsdesk_sticky'] == '1') {
	echo tep_image(DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_GREEN, 10, 10) . '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'action=setflag_sticky&flag_sticky=0&pID=' . $products['newsdesk_id'] . '&cPath=' . $cPath) . '">' . tep_image(DIR_WS_IMAGES . 'icon_status_red_light.gif', IMAGE_ICON_STATUS_RED_LIGHT, 10, 10) . '</a>';
} else {
	echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'action=setflag_sticky&flag_sticky=1&pID=' . $products['newsdesk_id'] . '&cPath=' . $cPath) . '">' . tep_image(DIR_WS_IMAGES . 'icon_status_green_light.gif', IMAGE_ICON_STATUS_GREEN_LIGHT, 10, 10) . '</a>&nbsp;&nbsp;' . tep_image(DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_STATUS_RED, 10, 10);
}
?>
		</td>
		<td class="dataTableContent" align="right">
<?php
if ( (is_object($pInfo)) && ($products['newsdesk_id'] == $pInfo->newsdesk_id) ) {
	echo tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', '');
} else {
	echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $products['newsdesk_id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>';
}
?>
		&nbsp;</td>
	</tr>
<?php
}

if ($cPath_array) {
	$cPath_back = '';
	for($i = 0, $n = sizeof($cPath_array) - 1; $i < $n; $i++) {
		if ($cPath_back == '') {
			$cPath_back .= $cPath_array[$i];
		} else {
			$cPath_back .= '_' . $cPath_array[$i];
		}
	}
}

    $cPath_back = ($cPath_back) ? 'cPath=' . $cPath_back : '';
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
//  Bottom to main page that has counts and new catagories and news items buttons
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
?>

	<tr>
		<td colspan="5">
<table border="0" width="100%" cellspacing="0" cellpadding="2">
	<tr>
		<td class="smallText"><?php echo TEXT_CATEGORIES . '&nbsp;' . $categories_count . '<br>' . TEXT_NEWSDESK . '&nbsp;' . $products_count; ?></td>
		<td align="right" class="smallText">
<?php 
/*
if ($cPath) echo '<a href="' . tep_href_link(FILENAME_NEWSDESK, $cPath_back . '&cID=' . $current_category_id) . '">' . 
tep_image_button('button_back.gif', IMAGE_BACK) . '</a>&nbsp;'; if (!$HTTP_GET_VARS['search']) echo '<a href="' . 
tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_category') . '">' . tep_image_button('button_new_category.gif', 
IMAGE_NEW_CATEGORY) . '</a>&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_product') . '">' . tep_image_button('button_new_news_item.gif', IMAGE_NEW_STORY) . '</a>'; 
*/
?>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
		</td>

<?php
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// types of actions and the text based informatioin declaration area
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$heading = array();
$contents = array();
switch ($HTTP_GET_VARS['action']) {

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'new_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_NEW_CATEGORY . '</b>');

$contents = array('form' => tep_draw_form('newcategory', FILENAME_NEWSDESK, 'action=insert_category&cPath=' . $cPath, 'post', 'enctype="multipart/form-data"'));
$contents[] = array('text' => TEXT_NEW_CATEGORY_INTRO);

$category_inputs_string = '';
$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
	$category_inputs_string .= '<br>' . tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']) . '&nbsp;' . tep_draw_input_field('categories_name[' . $languages[$i]['id'] . ']');
}

$contents[] = array('text' => '<br>' . TEXT_CATEGORIES_NAME . $category_inputs_string);
$contents[] = array('text' => '<br>' . TEXT_CATEGORIES_IMAGE . '<br>' . tep_draw_file_field('categories_image'));
$contents[] = array('text' => '<br>' . TEXT_SORT_ORDER . '<br>' . tep_draw_input_field('sort_order', '', 'size="2"'));
//$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
$contents[] = array('text' => '<br>' . TEXT_SHOW_STATUS . '<br>' . tep_draw_input_field('catagory_status', $cInfo->catagory_status, 'size="2"') . '1=W??czone 0=Wy??czone');
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'edit_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_EDIT_CATEGORY . '</b>');
$contents = array(
	'form' => tep_draw_form('categories', FILENAME_NEWSDESK, 'action=update_category&cPath=' . $cPath, 'post', 'enctype="multipart/form-data"') . tep_draw_hidden_field('categories_id', $cInfo->categories_id)
);
$contents[] = array('text' => TEXT_EDIT_INTRO);

$category_inputs_string = '';
$languages = tep_get_languages();
for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
	$category_inputs_string .= '<br>' . tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']) . '&nbsp;' . tep_draw_input_field('categories_name[' . $languages[$i]['id'] . ']', newsdesk_get_category_name($cInfo->categories_id, $languages[$i]['id']));
}

$contents[] = array('text' => '<br>' . TEXT_EDIT_CATEGORIES_NAME . $category_inputs_string);
$contents[] = array(
	'text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES . $cInfo->categories_image, $cInfo->categories_name) . '<br>' . DIR_WS_CATALOG_IMAGES . '<br><b>' . $cInfo->categories_image . '</b>'
);
$contents[] = array('text' => '<br>' . TEXT_EDIT_CATEGORIES_IMAGE . '<br>' . tep_draw_file_field('categories_image'));
$contents[] = array('text' => '<br>' . TEXT_EDIT_SORT_ORDER . '<br>' . tep_draw_input_field('sort_order', $cInfo->sort_order, 'size="2"'));
/*
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
*/
$contents[] = array('text' => '<br>' . TEXT_SHOW_STATUS . '<br>' . tep_draw_input_field('catagory_status', $cInfo->catagory_status, 'size="2"') . '1=Enabled 0=Disabled');
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');


break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'delete_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_DELETE_CATEGORY . '</b>');

$contents = array('form' => tep_draw_form('categories', FILENAME_NEWSDESK, 'action=delete_category_confirm&cPath=' . $cPath) . tep_draw_hidden_field('categories_id', $cInfo->categories_id));
$contents[] = array('text' => TEXT_DELETE_CATEGORY_INTRO);
$contents[] = array('text' => '<br><b>' . $cInfo->categories_name . '</b>');
if ($cInfo->childs_count > 0) $contents[] = array('text' => '<br>' . sprintf(TEXT_DELETE_WARNING_CHILDS, $cInfo->childs_count));
if ($cInfo->products_count > 0) $contents[] = array('text' => '<br>' . sprintf(TEXT_DELETE_WARNING_NEWSDESK, $cInfo->products_count));
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_DELETE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'move_category':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_MOVE_CATEGORY . '</b>');

$contents = array('form' => tep_draw_form('categories', FILENAME_NEWSDESK, 'action=move_category_confirm') . tep_draw_hidden_field('categories_id', $cInfo->categories_id));
$contents[] = array('text' => sprintf(TEXT_MOVE_CATEGORIES_INTRO, $cInfo->categories_name));
$contents[] = array('text' => '<br>' . sprintf(TEXT_MOVE, $cInfo->categories_name) . '<br>' . tep_draw_pull_down_menu('move_to_category_id', newsdesk_get_category_tree('0', '', $cInfo->categories_id), $current_category_id));
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_move.gif', IMAGE_MOVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
case 'delete_product':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_DELETE_NEWS . '</b>');

$contents = array('form' => tep_draw_form('products', FILENAME_NEWSDESK, 'action=delete_product_confirm&cPath=' . $cPath) . tep_draw_hidden_field('newsdesk_id', $pInfo->newsdesk_id));
$contents[] = array('text' => TEXT_DELETE_PRODUCT_INTRO);
$contents[] = array('text' => '<br><b>' . $pInfo->newsdesk_article_name . '</b>');

$product_categories_string = '';
$product_categories = newsdesk_generate_category_path($pInfo->newsdesk_id, 'product');
for ($i = 0, $n = sizeof($product_categories); $i < $n; $i++) {
	$category_path = '';
	for ($j = 0, $k = sizeof($product_categories[$i]); $j < $k; $j++) {
		$category_path .= $product_categories[$i][$j]['text'] . '&nbsp;&gt;&nbsp;';
	}
	$category_path = substr($category_path, 0, -16);
	$product_categories_string .= tep_draw_checkbox_field('product_categories[]', $product_categories[$i][sizeof($product_categories[$i])-1]['id'], true) . '&nbsp;' . $category_path . '<br>';
}

$product_categories_string = substr($product_categories_string, 0, -4);

$contents[] = array('text' => '<br>' . $product_categories_string);

$contents[] = array('text' => '<br>' . TEXT_DELETE_IMAGE_INTRO);

$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_DELETE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
      case 'move_product':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_MOVE_PRODUCT . '</b>');

$contents = array('form' => tep_draw_form('products', FILENAME_NEWSDESK, 'action=move_product_confirm&cPath=' . $cPath) . tep_draw_hidden_field('newsdesk_id', $pInfo->newsdesk_id));
$contents[] = array('text' => sprintf(TEXT_MOVE_NEWSDESK_INTRO, $pInfo->newsdesk_article_name));
$contents[] = array('text' => '<br>' . TEXT_INFO_CURRENT_CATEGORIES . '<br><b>' . newsdesk_output_generated_category_path($pInfo->newsdesk_id, 'product') . '</b>');
$contents[] = array('text' => '<br>' . sprintf(TEXT_MOVE, $pInfo->newsdesk_article_name) . '<br>' . tep_draw_pull_down_menu('move_to_category_id', newsdesk_get_category_tree(), $current_category_id));
$contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_move.gif', IMAGE_MOVE) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
      case 'copy_to':
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

$heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_COPY_TO . '</b>');

$contents = array(
	'form' => tep_draw_form('copy_to', FILENAME_NEWSDESK, 'action=copy_to_confirm&cPath=' . $cPath) . 
			tep_draw_hidden_field('newsdesk_id', $pInfo->newsdesk_id)
		);
$contents[] = array('text' => TEXT_INFO_COPY_TO_INTRO);
$contents[] = array(
	'text' => '<br>' . TEXT_INFO_CURRENT_CATEGORIES . '<br><b>' . newsdesk_output_generated_category_path($pInfo->newsdesk_id, 'product') 
			. '</b>'
		);
$contents[] = array(
	'text' => '<br>' . TEXT_CATEGORIES . '<br>' . tep_draw_pull_down_menu('categories_id', newsdesk_get_category_tree(), $current_category_id)
		);
$contents[] = array(
	'text' => '<br>' . TEXT_HOW_TO_COPY . '<br>' . tep_draw_radio_field('copy_as', 'link', true) . ' ' . TEXT_COPY_AS_LINK . '<br>' 
			. tep_draw_radio_field('copy_as', 'duplicate') . ' ' . TEXT_COPY_AS_DUPLICATE
		);
$contents[] = array(
	'align' => 'center', 'text' => '<br>' . tep_image_submit('button_copy.gif', IMAGE_COPY) . ' <a href="' . tep_href_link(FILENAME_NEWSDESK, 
			'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>'
		);
break;

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
default:
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
//  right box that runs the buttons and what not
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($rows > 0) {
if (is_object($cInfo)) { // category info box contents
	$heading[] = array('text' => '<b>' . $cInfo->categories_name . '</b>');
// Wolfen added buttons BOF
if ($cPath) $contents[] = array(
		'align' => 'center',
		'text' => '<a href="' . tep_href_link(FILENAME_NEWSDESK, $cPath_back . '&cID=' . $current_category_id) . '">' . 
tep_image_button('button_back.gif', IMAGE_BACK) . '</a>&nbsp;');
if (!$HTTP_GET_VARS['search']) $contents[] = array(
		'align' => 'center',
		'text' =>'<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_category') . '">' . tep_image_button('button_new_category.gif', 
IMAGE_NEW_CATEGORY) . '</a>&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_product') . '">' . tep_image_button('button_new_news_item.gif', IMAGE_NEW_STORY) . '</a>'); 
// Wolfen added buttons EOF
	$contents[] = array(
		'align' => 'center',
		'text' => '
<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id . '&action=edit_category') . '">' . 
tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . 
$cInfo->categories_id . '&action=delete_category') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a> <a href="' . 
tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&cID=' . $cInfo->categories_id . '&action=move_category') . '">' . 
tep_image_button('button_move.gif', IMAGE_MOVE) . '</a>'
	);
	$contents[] = array('text' => '<br>' . TEXT_DATE_ADDED . ' ' . tep_date_short($cInfo->date_added));

	if (tep_not_null($cInfo->last_modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . ' ' . tep_date_short($cInfo->last_modified));
		$contents[] = array(
			'text' => '<br>' . tep_info_image($cInfo->categories_image, $cInfo->categories_name, HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT) . '<br>' . $cInfo->categories_image
		);
		$contents[] = array('text' => '<br>' . TEXT_SUBCATEGORIES . ' ' . $cInfo->childs_count . '<br>' . TEXT_NEWSDESK . ' ' . $cInfo->products_count);
	} elseif (is_object($pInfo)) { // news info box contents
		$heading[] = array('text' => '<b>' . newsdesk_get_newsdesk_article_name($pInfo->newsdesk_id, $languages_id) . '</b>');
// Wolfen added buttons BOF
		if ($cPath) $contents[] = array(
		'align' => 'center',
		'text' => '<a href="' . tep_href_link(FILENAME_NEWSDESK, $cPath_back . '&cID=' . $current_category_id) . '">' . 
tep_image_button('button_back.gif', IMAGE_BACK) . '</a>&nbsp;');
if (!$HTTP_GET_VARS['search']) $contents[] = array(
		'align' => 'center',
		'text' =>'<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_category') . '">' . tep_image_button('button_new_category.gif', 
IMAGE_NEW_CATEGORY) . '</a>&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_product') . '">' . tep_image_button('button_new_news_item.gif', IMAGE_NEW_STORY) . '</a>');
// Wolfen added buttons EOF
		$contents[] = array(
			'align' => 'center',
			'text' => '<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id . '&action=new_product') . 
'">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . 
$pInfo->newsdesk_id . '&action=delete_product') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a> <a href="' . 
tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . $pInfo->newsdesk_id . '&action=move_product') . '">' . 
tep_image_button('button_move.gif', IMAGE_MOVE) . '</a> <a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&pID=' . 
$pInfo->newsdesk_id . '&action=copy_to') . '">' . tep_image_button('button_copy_to.gif', IMAGE_COPY_TO) . '</a>'
		);
		$contents[] = array('text' => '<br>' . TEXT_DATE_ADDED . ' ' . tep_date_short($pInfo->newsdesk_date_added));
		if (tep_not_null($pInfo->newsdesk_last_modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . ' ' . tep_date_short($pInfo->newsdesk_last_modified));
			if (date('Y-m-d') < $pInfo->newsdesk_date_available) $contents[] = array('text' => TEXT_DATE_AVAILABLE . ' ' . tep_date_short($pInfo->newsdesk_date_available));
				$contents[] = array(
					'text' => '
<br>' . tep_info_image($pInfo->newsdesk_image, $pInfo->newsdesk_article_name, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '<br>' . $pInfo->newsdesk_image .
'<br>' . tep_info_image($pInfo->newsdesk_image_two, $pInfo->newsdesk_article_name, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '<br>' . $pInfo->newsdesk_image_two .
'<br>' . tep_info_image($pInfo->newsdesk_image_three, $pInfo->newsdesk_article_name, SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '<br>' . $pInfo->newsdesk_image_three
				);
				$contents[] = array('text' => '<br>' . TEXT_NEWSDESK_AVERAGE_RATING . ' ' . number_format($pInfo->average_rating, 2) . '%');
			}
		} else { // create category/news info
			$heading[] = array('text' => '<b>' . EMPTY_CATEGORY . '</b>');
// Wolfen added buttons BOF
		if ($cPath) $contents[] = array(
		'align' => 'center',
		'text' => '<a href="' . tep_href_link(FILENAME_NEWSDESK, $cPath_back . '&cID=' . $current_category_id) . '">' . 
tep_image_button('button_back.gif', IMAGE_BACK) . '</a>&nbsp;');
if (!$HTTP_GET_VARS['search']) $contents[] = array(
		'align' => 'center',
		'text' =>'<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_category') . '">' . tep_image_button('button_new_category.gif', 
IMAGE_NEW_CATEGORY) . '</a>&nbsp;<a href="' . tep_href_link(FILENAME_NEWSDESK, 'cPath=' . $cPath . '&action=new_product') . '">' . tep_image_button('button_new_news_item.gif', IMAGE_NEW_STORY) . '</a>');
// Wolfen added buttons EOF
			$contents[] = array('text' => sprintf(TEXT_NO_CHILD_CATEGORIES_OR_story, $parent_categories_name));
		}

		break;

	}

	if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
		echo '<td width="25%" valign="top">' . "\n";
		$box = new box;
		echo $box->infoBox($heading, $contents);
		echo '</td>' . "\n";
	}
?>

	</tr>
</table>
		</td>
	</tr>

<?php
}
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// end of file area .... FOOTER code
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
</table>
		</td>
<!-- body_text_eof //-->
	<td height="4"></tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
<?php
/*

	osCommerce, Open Source E-Commerce Solutions ---- http://www.oscommerce.com
	Copyright (c) 2002 osCommerce
	Released under the GNU General Public License

	IMPORTANT NOTE:

	This script is not part of the official osC distribution but an add-on contributed to the osC community.
	Please read the NOTE and INSTALL documents that are provided with this file for further information and installation notes.
	
	script name:			NewsDesk
	version:        		1.48.2
	date:       			22-06-2004 (dd/mm/yyyy)
	author:				Carsten aka moyashi
	web site:			www..com
	modified code by:		Wolfen aka 241
*/
?>