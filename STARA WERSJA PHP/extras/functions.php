<?php

function head(){

    print("<br>");
    
    
    print("<div style=\"color:brown;text-align:center;font-size: 40px;\"> Witaj! </div>
    <hr>
    <br>
    ");
}

function footer(){

    print("
    <br>
    <hr>
    <br>
    ");
    
    print("<div style=\"color:orange;text-align:right\">Designed by Grzegorz Płonka 2022<div>");
    
    print("
    </br>
    ");
}

function login(){
    print("
    <center>
    <form method=\"POST\" action=\"login.php\">
    <input type=\"text\" name=\"username\" placeholder=\"Login\"><br>
    <input type=\"password\" name=\"password\"><br>
    <input type=\"submit\" name=\"submit\" value=\"Wyślij\"><br>
    </form>
    </center>
    
    ");
    
}



function you_are_logged_in()
{
print("<div style=\"color:orange;text-align:right;\" > Jesteś zalogowany&nbsp&nbsp<a href=\"/logout.php\">WYLOGUJ</a> </div>");

}

function menu(){
    print("<a href=\"/index.php\">Strona główna</a><br>");
    
    print("<a href=\"/nbp.php\">Exchange rates</a><br>");

    

    print("<a href=\"/read_db.php\">Odczyt bazy danych</a><br>");

    /*
    print("<a href=\"/empty.php\">empty2</a><br>");

    print("<a href=\"/empty.php\">empty3</a><br>");

*/
   
}












function bootstrap (){
    print("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">
    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\" crossorigin=\"anonymous\"></script>");
    

}



?>
