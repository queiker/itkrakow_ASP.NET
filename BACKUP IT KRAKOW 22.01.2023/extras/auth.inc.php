<?php
session_start();
if( isset($_SESSION['logged'])&& $_SESSION['logged']== 1){

}else{
    $redirect = $_SERVER['PHP_SELF'];
    echo "Dostęp zabroniony";
    die();


}








?>