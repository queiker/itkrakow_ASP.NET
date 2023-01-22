<?php
include("functions.php");
bootstrap();

session_start();

    $_SESSION['logged'] = 0;
    header('Location: index.php');


?>