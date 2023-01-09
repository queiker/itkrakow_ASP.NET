<?php
include("functions.php");

bootstrap();



session_start();
if( isset($_SESSION['logged'])&& $_SESSION['logged']== 1){
you_are_logged_in();


head();


//body();


   

print("<table>");
    print("<tr><td>");
    
    menu();
    
    print("</td><td>");
//######################################################################


    print("Witaj na stronie TRADECOMP BIZNES");



//######################################################################
    print("</td></tr>");
    
    print("</table>");




footer();


}else{

    login();

}
?>







