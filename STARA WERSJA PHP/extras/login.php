<?php
include("secret.php");
include("functions.php");
bootstrap();

session_start();
$_SESSION['logged'] = 0;

if(isset($_POST['submit'])){
    if($_POST['username'] == $secret_login &&
    $_POST['password'] == $secret_password ){
        $_SESSION['logged']=1;
        header('Location: index.php');

    }
}else{
    echo "Zła kombinacja loginu i hasła";
}




?>