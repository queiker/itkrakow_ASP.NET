<?php
include("functions.php");
include("auth.inc.php");
bootstrap();
you_are_logged_in();

head();

print("<table>");
    print("<tr><td>");
    
    menu();
    
    print("</td><td>");
//######################################################################


    print("This is pasworded data <br>");



//######################################################################
    print("</td></tr>");
    
    print("</table>");

footer();

?>