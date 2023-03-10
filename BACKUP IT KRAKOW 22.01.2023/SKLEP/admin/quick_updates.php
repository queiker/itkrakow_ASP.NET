<?php
/*
  $Id: quick_updates.php,v 2.3 2003/06/04 11:44:34 HRB Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Based on the original script contributed by Burt (burt@xwww.co.uk)
        and by Henri Bredehoeft (hrb@nermica.net)

  This version was contributed by Mathieu (contact@mathieueylert.com)

  (http://www.oscommerce-fr.info/forums)

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

reset($HTTP_GET_VARS);
foreach($HTTP_GET_VARS as $key => $value) {
	if(!is_array($key)) {
		$$key = $value;
	}
}

$action = tep_db_prepare_input($HTTP_GET_VARS['action']);
$page = tep_db_prepare_input($HTTP_GET_VARS['page']);
$sort_by = tep_db_prepare_input($HTTP_GET_VARS['sort_by']);
$row_by_page = tep_db_prepare_input($HTTP_GET_VARS['row_by_page']);
$manufacturer = tep_db_prepare_input($HTTP_GET_VARS['manufacturer']);

 ($row_by_page) ? define('MAX_DISPLAY_ROW_BY_PAGE' , $row_by_page ) : $row_by_page = MAX_DISPLAY_SEARCH_RESULTS; define('MAX_DISPLAY_ROW_BY_PAGE' , MAX_DISPLAY_SEARCH_RESULTS );

//// Tax Row
    $tax_class_array = array(array('id' => '0', 'text' => NO_TAX_TEXT));
    $tax_class_query = tep_db_query("select tax_class_id, tax_class_title from " . TABLE_TAX_CLASS . " order by tax_class_title");
    while ($tax_class = tep_db_fetch_array($tax_class_query)) {
      $tax_class_array[] = array('id' => $tax_class['tax_class_id'],
                                 'text' => $tax_class['tax_class_title']);
    }

////Info Row pour le champ fabriquant
        $manufacturers_array = array(array('id' => '0', 'text' => NO_MANUFACTURER));
        $manufacturers_query = tep_db_query("select manufacturers_id, manufacturers_name from " . TABLE_MANUFACTURERS . " order by manufacturers_name");
        while ($manufacturers = tep_db_fetch_array($manufacturers_query)) {
                $manufacturers_array[] = array('id' => $manufacturers['manufacturers_id'],
                'text' => $manufacturers['manufacturers_name']);
        }

// Display the list of the manufacturers
if(!function_exists('manufacturers_list')) {
	function manufacturers_list(){
        global $manufacturer;

        $manufacturers_query = tep_db_query("select m.manufacturers_id, m.manufacturers_name from " . TABLE_MANUFACTURERS . " m order by m.manufacturers_name ASC");
        $return_string = '<select name="manufacturer" onChange="this.form.submit();">';
        $return_string .= '<option value="' . 0 . '">' . TEXT_ALL_MANUFACTURERS . '</option>';
        while($manufacturers = tep_db_fetch_array($manufacturers_query)){
                $return_string .= '<option value="' . $manufacturers['manufacturers_id'] . '"';
                if($manufacturer && $manufacturers['manufacturers_id'] == $manufacturer) $return_string .= ' SELECTED';
                $return_string .= '>' . $manufacturers['manufacturers_name'] . '</option>';
        }
        $return_string .= '</select>';
        return $return_string;
	}
}

##// Uptade database
  switch ($HTTP_GET_VARS['action']) {
    case 'update' :
      $count_update=0;
      $item_updated = array();
                  if($HTTP_POST_VARS['product_new_model']){
                   foreach($HTTP_POST_VARS['product_new_model'] as $id => $new_model) {
                         if (trim($HTTP_POST_VARS['product_new_model'][$id]) != trim($HTTP_POST_VARS['product_old_model'][$id])) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_model='" . tep_db_input($new_model) . "' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                  if($HTTP_POST_VARS['product_new_name']){
                   foreach($HTTP_POST_VARS['product_new_name'] as $id => $new_name) {
                         if (trim($HTTP_POST_VARS['product_new_name'][$id]) != trim($HTTP_POST_VARS['product_old_name'][$id])) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS_DESCRIPTION . " SET products_name='" . tep_db_input($new_name) . "' WHERE products_id=$id and language_id=" . (int)$languages_id);
                         }
                   }
                }
                  if($HTTP_POST_VARS['product_new_price']){
                   foreach($HTTP_POST_VARS['product_new_price'] as $id => $new_price) {
                         if ($HTTP_POST_VARS['product_new_price'][$id] != $HTTP_POST_VARS['product_old_price'][$id] && $HTTP_POST_VARS['update_price'][$id] == 'yes') {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_price='".$new_price."' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                if($HTTP_POST_VARS['product_new_weight']){
                   foreach($HTTP_POST_VARS['product_new_weight'] as $id => $new_weight) {
                         if ($HTTP_POST_VARS['product_new_weight'][$id] != $HTTP_POST_VARS['product_old_weight'][$id]) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_weight='".(int)$new_weight."' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                if($HTTP_POST_VARS['product_new_quantity']){
                   foreach($HTTP_POST_VARS['product_new_quantity'] as $id => $new_quantity) {
                         if ($HTTP_POST_VARS['product_new_quantity'][$id] != $HTTP_POST_VARS['product_old_quantity'][$id]) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_quantity='".(int)$new_quantity."' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                if($HTTP_POST_VARS['product_new_manufacturer']){
                   foreach($HTTP_POST_VARS['product_new_manufacturer'] as $id => $new_manufacturer) {
                         if ($HTTP_POST_VARS['product_new_manufacturer'][$id] != $HTTP_POST_VARS['product_old_manufacturer'][$id]) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET manufacturers_id='".(int)$new_manufacturer."' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                if($HTTP_POST_VARS['product_new_image']){
                   foreach($HTTP_POST_VARS['product_new_image'] as $id => $new_image) {
                         if (trim($HTTP_POST_VARS['product_new_image'][$id]) != trim($HTTP_POST_VARS['product_old_image'][$id])) {
                           $count_update++;
                           $item_updated[$id] = 'updated';
                           mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_image='" . tep_db_input($new_image) . "' WHERE products_id='".(int)$id."'");
                         }
                   }
                }
                   if($HTTP_POST_VARS['product_new_status']){
                           foreach($HTTP_POST_VARS['product_new_status'] as $id => $new_status) {
                                 if ($HTTP_POST_VARS['product_new_status'][$id] != $HTTP_POST_VARS['product_old_status'][$id]) {
                                   $count_update++;
                                   $item_updated[$id] = 'updated';
                                   tep_set_product_status($id, $new_status);
                                 }
                           }
                }
                   if($HTTP_POST_VARS['product_new_tax']){
                           foreach($HTTP_POST_VARS['product_new_tax'] as $id => $new_tax_id) {
                                 if ($HTTP_POST_VARS['product_new_tax'][$id] != $HTTP_POST_VARS['product_old_tax'][$id]) {
                                   $count_update++;
                                   $item_updated[$id] = 'updated';
                                   mysql_query("UPDATE " . TABLE_PRODUCTS . " SET products_tax_class_id='".(int)$new_tax_id."' WHERE products_id='".(int)$id."'");
                                 }
                           }
                }
     $count_item = array_count_values($item_updated);
     if ($count_item['updated'] > 0) $messageStack->add($count_item['updated'].' '.TEXT_PRODUCTS_UPDATED . " $count_update " . TEXT_QTY_UPDATED, 'success');
     break;

     case 'calcul' :
      if ($HTTP_POST_VARS['spec_price']) $preview_global_price = 'true';
     break;
 }

//// explode string parameters from preview product
     if($info_back && $info_back!="-") {
       $infoback = explode('-',$info_back);
       $sort_by = $infoback[0];
       $page =  $infoback[1];
       $current_category_id = $infoback[2];
       $row_by_page = $infoback[3];
           $manufacturer = $infoback[4];
     }

//// define the step for rollover lines per page
   $row_bypage_array = array(array());
   for ($i = 10; $i <=100 ; $i=$i+5) {
      $row_bypage_array[] = array('id' => $i,
                                  'text' => $i);
   }

##// Let's start displaying page with forms
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<script language="javascript" src="includes/general.js"></script>
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<script language="javascript">
<!--
var browser_family;
var up = 1;

if (document.all && !document.getElementById)
  browser_family = "dom2";
else if (document.layers)
  browser_family = "ns4";
else if (document.getElementById)
  browser_family = "dom2";
else
  browser_family = "other";

function display_ttc(action, prix, taxe, up){
  if(action == 'display'){
          if(up != 1)
          valeur = Math.round((prix + (taxe / 100) * prix) * 100) / 100;
  }else{
          if(action == 'keyup'){
                valeur = Math.round((parseFloat(prix) + (taxe / 100) * parseFloat(prix)) * 100) / 100;
        }else{
         valeur = '0';
        }
  }
  switch (browser_family){
    case 'dom2':
          document.getElementById('descDiv').innerHTML = '<?php echo TOTAL_COST; ?> : '+valeur;
      break;
    case 'ie4':
      document.all.descDiv.innerHTML = '<?php echo TOTAL_COST; ?> : '+valeur;
      break;
    case 'ns4':
      document.descDiv.document.descDiv_sub.document.write(valeur);
      document.descDiv.document.descDiv_sub.document.close();
      break;
    case 'other':
      break;
  }
}
-->
</script>

<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
<!-- body_text //-->

<td width="100%" valign="top">
  <table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td>
         <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
             <td class="pageHeading" colspan="3" valign="top"><?php echo HEADING_TITLE; ?></td>
                         <td class="pageHeading" align="right">
                         <?php
                     //            if($current_category_id != 0){
                       //                 $image_query = tep_db_query("select c.categories_image from " . TABLE_CATEGORIES . " c where c.categories_id=" . $current_category_id);
                         //               $image = tep_db_fetch_array($image_query);
                           //             echo tep_image(DIR_WS_CATALOG . DIR_WS_IMAGES . $image['categories_image'], '', 40);
                             //   }else{
                               //         if($manufacturer){
                                 //               $image_query = tep_db_query("select manufacturers_image from " . TABLE_MANUFACTURERS . " where manufacturers_id=" . $manufacturer);
                                   //             $image = tep_db_fetch_array($image_query);
                                     //           echo tep_image(DIR_WS_CATALOG . DIR_WS_IMAGES . $image['manufacturers_image'], '', 40);
                                       // }
                                //}
                        ?>
                   </td></tr>
                 </table></td></tr>
      <tr><td align="center">
                   <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff" bordercolor="#c0c0c0" height="100"><tr align="left"><td valign="middle">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tr><td height="5"></td></tr>
                                        <tr align="center">
                                                <td class="smalltext"><?php echo tep_draw_form('row_by_page', FILENAME_QUICK_UPDATES, '', 'get'); echo tep_draw_hidden_field( 'manufacturer', $manufacturer); echo tep_draw_hidden_field( 'cPath', $current_category_id);?></td>
                                                <td class="smallText"><?php echo TEXT_MAXI_ROW_BY_PAGE . '&nbsp;&nbsp;' . tep_draw_pull_down_menu('row_by_page', $row_bypage_array, $row_by_page, 'onChange="this.form.submit();"'); ?></form></td>
                                                <?php echo tep_draw_form('categorie', FILENAME_QUICK_UPDATES, '', 'get'); echo tep_draw_hidden_field( 'row_by_page', $row_by_page); echo tep_draw_hidden_field( 'manufacturer', $manufacturer); ?>
                                                <td class="smallText" align="center" valign="top"><?php echo DISPLAY_CATEGORIES . '&nbsp;&nbsp;' . tep_draw_pull_down_menu('cPath', tep_get_category_tree(), $current_category_id, 'onChange="this.form.submit();"'); ?></td></form>
                                                <?php echo tep_draw_form('manufacturers', FILENAME_QUICK_UPDATES, '', 'get'); echo tep_draw_hidden_field( 'row_by_page', $row_by_page); echo tep_draw_hidden_field( 'cPath', $current_category_id);?>
                                                <td class="smallText" align="center" valign="top"><?php echo DISPLAY_MANUFACTURERS . '&nbsp;&nbsp' . manufacturers_list(); ?></td></form>
                                        </tr>
                                </table>
                                
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tr align="center">
                                                <td align="center">
                                                          <table border="0" cellspacing="0">
                                                           <form name="spec_price" <?php echo 'action="' . tep_href_link(FILENAME_QUICK_UPDATES, tep_get_all_get_params(array('action', 'info', 'pID')) . "action=calcul&page=$page&sort_by=$sort_by&cPath=$current_category_id&row_by_page=$row_by_page&manufacturer=$manufacturer" , 'NONSSL') . '"'; ?> method="post">
                                                                         <tr>
                                                                                   <td class="main"  align="center" valign="middle" nowrap> <?php echo TEXT_INPUT_SPEC_PRICE; ?></td>
                                                                                   <td align="center" valign="middle"> <?php echo tep_draw_input_field('spec_price',0,'size="5"'); ?> </td>
                                                                                   <td class="smalltext" align="center" valign="middle"><?php
                                                                                 if ($preview_global_price != 'true') {
                                                                                                echo '&nbsp;&nbsp;' . tep_image_submit('button_preview.gif', IMAGE_PREVIEW, "page=$page&sort_by=$sort_by&cPath=$current_category_id&row_by_page=$row_by_page&manufacturer=$manufacturer");
                                                                                 } else echo '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_QUICK_UPDATES, "page=$page&sort_by=$sort_by&cPath=$current_category_id&row_by_page=$row_by_page&manufacturer=$manufacturer") . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>';?></td>
                                                                                  <?php if(ACTIVATE_COMMERCIAL_MARGIN == 'true'){ echo '<td class="smalltext" align="center" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;' . tep_draw_checkbox_field('marge','yes','','no') . '&nbsp;' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', TEXT_MARGE_INFO) . '</td>';}?>
                                                                         </tr>
                                                                         <tr>
                                                                                   <td class="smalltext" align="center" valign="middle" colspan="3" nowrap>
                                                                                        <?php if ($preview_global_price != 'true') {
                                                                                                                 echo TEXT_SPEC_PRICE_INFO1 ;
                                                                                                  } else echo TEXT_SPEC_PRICE_INFO2;?>
                                                                                   </td>
                                                                         </tr>
                                                                </form>
                                                        </table>
                                                </td>
                                        </tr>
                                        <tr><td height="5"></td></tr>
                        </td></tr>
                        <br>
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tr align="center">
                                                <form name="update" method="POST" action="<?php echo "$PHP_SELF?action=update&page=$page&sort_by=$sort_by&cPath=$current_category_id&row_by_page=$row_by_page&manufacturer=$manufacturer"; ?>">
                                                <td class="smalltext" align="middle"><?php echo WARNING_MESSAGE; ?> </td>
                                                <?php echo "<td class=\"pageHeading\" align=\"right\">" . '<script language="javascript"><!--
                                                        switch (browser_family)
                                                        {
                                                        case "dom2":
                                                        case "ie4":
                                                         document.write(\'<div id="descDiv">\');
                                                         break;
                                                        default:
                                                         document.write(\'<ilayer id="descDiv"><layer id="descDiv_sub">\');
                                                              break;
                                                        }
                                                        -->
                                                        </script>' . "</td>\n";
                                                ?>
                                                <td align="right" valign="middle"><?php echo tep_image_submit('button_update.gif', IMAGE_UPDATE, "action=update&cPath=$current_category_id&page=$page&sort_by=$sort_by&row_by_page=$row_by_page");?></td>
                                        </tr>
                        </table>
                </td>
      </tr>
          <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent" align="left" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="left" valign="middle">
                     <?php if(DISPLAY_MODEL == 'true') echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_model ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_MODEL . ' ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_model DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_MODEL . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>"  .TABLE_HEADING_MODEL . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                <td class="dataTableHeadingContent" align="left" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="left" valign="middle">
                     <?php echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=pd.products_name ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_PRODUCTS . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=pd.products_name DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_PRODUCTS . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>"  .TABLE_HEADING_PRODUCTS . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                <td class="dataTableHeadingContent" align="center" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="center" valign="middle">
                     <?php if(DISPLAY_STATUT == 'true')echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_status ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . 'OFF ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_status DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . 'ON ' . TEXT_ASCENDINGLY)."</a>
                     <br>wy? / w?</td>" ; ?>
                    </tr>
                  </table>
                </td>
                <td class="dataTableHeadingContent" align="center" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="center" valign="middle">
                     <?php if(DISPLAY_WEIGHT == 'true')echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_weight ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_WEIGHT . ' ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_weight DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_WEIGHT . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>" . TABLE_HEADING_WEIGHT . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                <td class="dataTableHeadingContent" align="center" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="center" valign="middle" width="50">
                     <?php if(DISPLAY_QUANTITY == 'true')echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_quantity ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_QUANTITY . ' ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_quantity DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_QUANTITY . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>" . TABLE_HEADING_QUANTITY . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                  <td class="dataTableHeadingContent" align="left" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="left" valign="middle">
                     <?php if(DISPLAY_IMAGE == 'true')echo "&nbsp; <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_image ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_IMAGE . ' ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_image DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_IMAGE . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>&nbsp; " . TABLE_HEADING_IMAGE . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                  <td class="dataTableHeadingContent" align="left" valign="middle">
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr class="dataTableHeadingRow">
                     <td class="dataTableHeadingContent" align="left" valign="middle">
                     <?php if(DISPLAY_MANUFACTURER == 'true')echo "&nbsp;&nbsp; <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=manufacturers_id ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_MANUFACTURERS . ' ' . TEXT_ASCENDINGLY)."</a>
                     <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=manufacturers_id DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_MANUFACTURERS . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>&nbsp;&nbsp; " . TABLE_HEADING_MANUFACTURERS . "</td>" ; ?>
                    </tr>
                  </table>
                </td>
                  <td class="dataTableHeadingContent" align="left" valign="middle">
                   <?php echo "&nbsp;&nbsp;&nbsp; <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_price ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer) ."\" >".tep_image(DIR_WS_IMAGES . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_PRICE . ' ' . TEXT_ASCENDINGLY)."</a>
                    <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_price DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer) ."\" >".tep_image(DIR_WS_IMAGES . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_PRICE . ' ' . TEXT_DESCENDINGLY)."</a>
                     <br>&nbsp;&nbsp;&nbsp; " . TABLE_HEADING_PRICE . "</td>";?>
                     
                  <td class="dataTableHeadingContent" align="left" valign="middle">
                   <?php if(DISPLAY_TAX == 'true')echo " <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_tax_class_id ASC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES  . 'icon_up.gif', TEXT_SORT_ALL . TABLE_HEADING_TAX . ' ' . TEXT_ASCENDINGLY)."</a>
                    <a href=\"" . tep_href_link( FILENAME_QUICK_UPDATES, 'cPath='. $current_category_id .'&sort_by=p.products_tax_class_id DESC&page=' . $page.'&row_by_page=' . $row_by_page . '&manufacturer=' . $manufacturer)."\" >".tep_image(DIR_WS_IMAGES  . 'icon_down.gif', TEXT_SORT_ALL . TABLE_HEADING_TAX . ' ' . TEXT_DESCENDINGLY)."</a>
                    <br>" . TABLE_HEADING_TAX . " </td> " ; ?>
                 <td class="dataTableHeadingContent" align="center" valign="middle"></td>
                <td class="dataTableHeadingContent" align="center" valign="middle"></td>
                </tr><tr class="datatableRow">
<?php
//// get the specials products list
     $specials_array = array();
     $specials_query = tep_db_query("select p.products_id from " . TABLE_PRODUCTS . " p, " . TABLE_SPECIALS . " s where s.products_id = p.products_id");
     while ($specials = tep_db_fetch_array($specials_query)) {
       $specials_array[] = $specials['products_id'];
     }
//// control string sort page
     if ($sort_by && !ereg('order by',$sort_by)) $sort_by = 'order by '.$sort_by ;
//// define the string parameters for good back preview product
     $origin = FILENAME_QUICK_UPDATES."?info_back=$sort_by-$page-$current_category_id-$row_by_page-$manufacturer";
//// controle lenght (lines per page)
     $split_page = $page;
     if ($split_page > 1) $rows = $split_page * MAX_DISPLAY_ROW_BY_PAGE - MAX_DISPLAY_ROW_BY_PAGE;

////  select categories
  if ($current_category_id == 0){
          if($manufacturer){
            $products_query_raw = "select p.products_id, p.products_image, p.products_model, pd.products_name, p.products_status, p.products_weight, p.products_quantity, p.manufacturers_id, p.products_price, p.products_tax_class_id from  " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION .  " pd where p.products_id = pd.products_id and pd.language_id = '".(int)$languages_id."' and p.manufacturers_id = '" . (int)$manufacturer . "' ".$sort_by." ";
          }else{
                $products_query_raw = "select p.products_id, p.products_image, p.products_model, pd.products_name, p.products_status, p.products_weight, p.products_quantity, p.manufacturers_id, p.products_price, p.products_tax_class_id from  " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION .  " pd where p.products_id = pd.products_id and pd.language_id = '".(int)$languages_id."' ".$sort_by." ";
        }
  } else {
         if($manufacturer){
                 $products_query_raw = "select p.products_id, p.products_image, p.products_model, pd.products_name, p.products_status, p.products_weight, p.products_quantity, p.manufacturers_id, p.products_price, p.products_tax_class_id from  " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION .  " pd, " . TABLE_PRODUCTS_TO_CATEGORIES . " pc where p.products_id = pd.products_id and pd.language_id = '$languages_id' and p.products_id = pc.products_id and pc.categories_id = '" . (int)$current_category_id . "' and p.manufacturers_id = '" . (int)$manufacturer . "' ".$sort_by." ";
          }else{
                $products_query_raw = "select p.products_id, p.products_image, p.products_model, pd.products_name, p.products_status, p.products_weight, p.products_quantity, p.manufacturers_id, p.products_price, p.products_tax_class_id from  " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION .  " pd, " . TABLE_PRODUCTS_TO_CATEGORIES . " pc where p.products_id = pd.products_id and pd.language_id = '$languages_id' and p.products_id = pc.products_id and pc.categories_id = '" . (int)$current_category_id . "' ".$sort_by." ";
        }
  }

//// page splitter and display each products info
  $products_split = new splitPageResults($split_page, MAX_DISPLAY_ROW_BY_PAGE, $products_query_raw, $products_query_numrows);
  $products_query = tep_db_query($products_query_raw);
  while ($products = tep_db_fetch_array($products_query)) {
    $rows++;
    if (strlen($rows) < 2) {
      $rows = '0' . $rows;
    }
//// check for global add value or rates, calcul and round values rates
    if ($HTTP_POST_VARS['spec_price']){
      $flag_spec = 'true' ;
      if (substr($HTTP_POST_VARS['spec_price'],-1) == '%') {
                  if($HTTP_POST_VARS['marge'] && substr($HTTP_POST_VARS['spec_price'],0,1) != '-'){
                        $valeur = (1 - (ereg_replace("%", "", $HTTP_POST_VARS['spec_price']) / 100));
                        $price = sprintf("%01.2f", round($products['products_price'] / $valeur,2));
                }else{
                $price = sprintf("%01.2f", round($products['products_price'] + (($spec_price / 100) * $products['products_price']),2));
              }
          } else $price = sprintf("%01.2f", round($products['products_price'] + $spec_price,2));
    } else $price = round($products['products_price'],2) ;

//// Check Tax_rate for displaying TTC
        $tax_query = tep_db_query("select r.tax_rate, c.tax_class_title from " . TABLE_TAX_RATES . " r, " . TABLE_TAX_CLASS . " c where r.tax_class_id='" . (int)$products['products_tax_class_id'] . "' and c.tax_class_id='" . (int)$products['products_tax_class_id']."'");
        $tax_rate = tep_db_fetch_array($tax_query);
        if($tax_rate['tax_rate'] == '')$tax_rate['tax_rate'] = 0;
        
        if(MODIFY_MANUFACTURER == 'false'){
                $manufacturer_query = tep_db_query("select manufacturers_name from " . TABLE_MANUFACTURERS . " where manufacturers_id='" . (int)$products['manufacturers_id'] . "'");
                $manufacturer = tep_db_fetch_array($manufacturer_query);
        }
//// display infos per row
                if($flag_spec){echo '<tr class="dataTableRow" onmouseover="'; if(DISPLAY_TVA_OVER == 'true'){echo 'display_ttc(\'display\', ' . $price . ', ' . $tax_rate['tax_rate'] . ');';} echo 'this.className=\'dataTableRowOver\';this.style.cursor=\'hand\'" onmouseout="'; if(DISPLAY_TVA_OVER == 'true'){echo 'display_ttc(\'delete\');';} echo 'this.className=\'dataTableRow\'">'; }else{ echo '<tr class="dataTableRow" onmouseover="'; if(DISPLAY_TVA_OVER == 'true'){echo 'display_ttc(\'display\', ' . $products['products_price'] . ', ' . $tax_rate['tax_rate'] . ');';} echo 'this.className=\'dataTableRowOver\';this.style.cursor=\'hand\'" onmouseout="'; if(DISPLAY_TVA_OVER == 'true'){echo 'display_ttc(\'delete\', \'\', \'\', 0);';} echo 'this.className=\'dataTableRow\'">';}
                if(DISPLAY_MODEL == 'true'){if(MODIFY_MODEL == 'true')echo "<td class=\"smallText\" align=\"center\"><input type=\"text\" size=\"6\" name=\"product_new_model[".$products['products_id']."]\" value=\"".$products['products_model']."\"></td>\n";else echo "<td class=\"smallText\" align=\"left\">" . $products['products_model'] . "</td>\n";}else{ echo "<td class=\"smallText\" align=\"left\">";}
        if(MODIFY_NAME == 'true')echo "<td class=\"smallText\" align=\"center\"><input type=\"text\" size=\"30\" name=\"product_new_name[".$products['products_id']."]\" value=\"".$products['products_name']."\"></td>\n";else echo "<td class=\"smallText\" align=\"left\">".$products['products_name']."</td>\n";
//// Product status radio button
                if(DISPLAY_STATUT == 'true'){
                        if ($products['products_status'] == '1') {
                         echo "<td class=\"smallText\" align=\"center\"><input  type=\"radio\" name=\"product_new_status[".$products['products_id']."]\" value=\"0\" ><input type=\"radio\" name=\"product_new_status[".$products['products_id']."]\" value=\"1\" checked ></td>\n";
                        } else {
                         echo "<td class=\"smallText\" align=\"center\"><input type=\"radio\" style=\"background-color: #EEEEEE\" name=\"product_new_status[".$products['products_id']."]\" value=\"0\" checked ><input type=\"radio\" style=\"background-color: #EEEEEE\" name=\"product_new_status[".$products['products_id']."]\" value=\"1\"></td>\n";
                        }
                }else{
                        echo "<td class=\"smallText\" align=\"center\"></td>";
                }
        if(DISPLAY_WEIGHT == 'true')echo "<td class=\"smallText\" align=\"center\"><input type=\"text\" size=\"5\" name=\"product_new_weight[".$products['products_id']."]\" value=\"".$products['products_weight']."\"></td>\n";else echo "<td class=\"smallText\" align=\"center\"></td>";
        if(DISPLAY_QUANTITY == 'true')echo "<td class=\"smallText\" align=\"center\"><input type=\"text\" size=\"3\" name=\"product_new_quantity[".$products['products_id']."]\" value=\"".$products['products_quantity']."\"></td>\n";else echo "<td class=\"smallText\" align=\"center\"></td>";
                if(DISPLAY_IMAGE == 'true')echo "<td class=\"smallText\" align=\"center\"><input type=\"text\" size=\"8\" name=\"product_new_image[".$products['products_id']."]\" value=\"".$products['products_image']."\"></td>\n";else echo "<td class=\"smallText\" align=\"center\"></td>";
                if(DISPLAY_MANUFACTURER == 'true'){if(MODIFY_MANUFACTURER == 'true')echo "<td class=\"smallText\" align=\"center\">".tep_draw_pull_down_menu("product_new_manufacturer[".$products['products_id']."]\"", $manufacturers_array, $products['manufacturers_id'])."</td>\n";else echo "<td class=\"smallText\" align=\"center\">" . $manufacturer['manufacturers_name'] . "</td>";}else{ echo "<td class=\"smallText\" align=\"center\"></td>";}
//// check specials
        if ( in_array($products['products_id'],$specials_array)) {
            echo "<td class=\"smallText\" align=\"left\">&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" size=\"6\" name=\"product_new_price[".$products['products_id']."]\" value=\"".$products['products_price']."\" disabled >&nbsp;<a href=\"".tep_href_link (FILENAME_SPECIALS, 'sID='.$products['products_id'])."\">". tep_image(DIR_WS_IMAGES . 'icon_info.gif', TEXT_SPECIALS_PRODUCTS) ."</a></td>\n";
        } else {
            if ($flag_spec == 'true') {
                   echo "<td class=\"smallText\" align=\"left\">&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" size=\"6\" name=\"product_new_price[".$products['products_id']."]\" "; if(DISPLAY_TVA_UP == 'true'){ echo "onKeyUp=\"display_ttc('keyup', this.value" . ", " . $tax_rate['tax_rate'] . ", 1);\"";} echo " value=\"".$price ."\">".tep_draw_checkbox_field('update_price['.$products['products_id'].']','yes','checked','no')."</td>\n";
            } else { echo "<td class=\"smallText\" align=\"left\">&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" size=\"6\" name=\"product_new_price[".$products['products_id']."]\" "; if(DISPLAY_TVA_UP == 'true'){ echo "onKeyUp=\"display_ttc('keyup', this.value" . ", " . $tax_rate['tax_rate'] . ", 1);\"";} echo " value=\"".$price ."\">".tep_draw_hidden_field('update_price['.$products['products_id'].']','yes'). "</td>\n";}
        }
        if(DISPLAY_TAX == 'true'){if(MODIFY_TAX == 'true')echo "<td class=\"smallText\" align=\"left\">".tep_draw_pull_down_menu("product_new_tax[".$products['products_id']."]\"", $tax_class_array, $products['products_tax_class_id'])."</td>\n";else echo "<td class=\"smallText\" align=\"left\">" . $tax_rate['tax_class_title'] . "</td>";}else{ echo "<td class=\"smallText\" align=\"center\"></td>";}
//// links to preview or full edit
        if(DISPLAY_PREVIEW == 'true')echo "<td class=\"smallText\" align=\"left\"><a href=\"".tep_href_link (FILENAME_CATEGORIES, 'pID='.$products['products_id'].'&action=new_product_preview&read=only&sort_by='.$sort_by.'&page='.$split_page.'&origin='.$origin)."\">". tep_image(DIR_WS_IMAGES . 'icon_info.gif', TEXT_IMAGE_PREVIEW) ."</a></td>\n";
                if(DISPLAY_EDIT == 'true')echo "<td class=\"smallText\" align=\"left\"><a href=\"".tep_href_link (FILENAME_CATEGORIES, 'pID='.$products['products_id'].'&cPath='.$categories_products[0].'&action=new_product')."\">". tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', TEXT_IMAGE_SWITCH_EDIT) ."</a></td>\n";

//// Hidden parameters for cache old values
                if(MODIFY_NAME == 'true') echo tep_draw_hidden_field('product_old_name['.$products['products_id'].'] ',$products['products_name']);
        if(MODIFY_MODEL == 'true') echo tep_draw_hidden_field('product_old_model['.$products['products_id'].'] ',$products['products_model']);
                echo tep_draw_hidden_field('product_old_status['.$products['products_id'].']',$products['products_status']);
        echo tep_draw_hidden_field('product_old_quantity['.$products['products_id'].']',$products['products_quantity']);
                echo tep_draw_hidden_field('product_old_image['.$products['products_id'].']',$products['products_image']);
        if(MODIFY_MANUFACTURER == 'true')echo tep_draw_hidden_field('product_old_manufacturer['.$products['products_id'].']',$products['manufacturers_id']);
                echo tep_draw_hidden_field('product_old_weight['.$products['products_id'].']',$products['products_weight']);
        echo tep_draw_hidden_field('product_old_price['.$products['products_id'].']',$products['products_price']);
        if(MODIFY_TAX == 'true')echo tep_draw_hidden_field('product_old_tax['.$products['products_id'].']',$products['products_tax_class_id']);
//// hidden display parameters
        echo tep_draw_hidden_field( 'row_by_page', $row_by_page);
        echo tep_draw_hidden_field( 'sort_by', $sort_by);
        echo tep_draw_hidden_field( 'page', $split_page);
     }
    echo "</table>\n";

?>
          </td>
        </tr>
       </table></td>
      </tr>
<tr>
<td align="right">
<?php
                 //// display bottom page buttons
                echo '<a href="javascript:window.print()">' . tep_image_button('button_print.gif', PRINT_TEXT) . '</a>&nbsp;&nbsp;';
              echo tep_image_submit('button_update.gif', IMAGE_UPDATE);
              echo '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_QUICK_UPDATES,"row_by_page=$row_by_page") . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>';
?></td>
</tr>
</form>
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
                <td class="smallText" valign="top"><?php echo $products_split->display_count($products_query_numrows, MAX_DISPLAY_ROW_BY_PAGE, $split_page, TEXT_DISPLAY_NUMBER_OF_PRODUCTS);  ?></td>
                <td class="smallText" align="right"><?php echo $products_split->display_links($products_query_numrows, MAX_DISPLAY_ROW_BY_PAGE, MAX_DISPLAY_PAGE_LINKS, $split_page, '&cPath='. $current_category_id .'&sort_by='.$sort_by . '&manufacturer='.$manufacturer.'&row_by_page=' . $row_by_page); ?></td>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->
  </tr>
</table>

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>