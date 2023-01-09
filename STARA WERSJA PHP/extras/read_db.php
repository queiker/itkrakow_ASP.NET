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




//read_table.php
//Skrypt napisany przez Grzegorza Płonkę
//Data 13.05.2018
//dodany do projektu 10.07.2022


$db_host = "localhost";
$db_user = "queiker_extras";
$db_password = "queiker_extras";
$db_to_connect = "queiker_extras";

$db_link = @mysql_connect($db_host, $db_user, $db_password) or die("Nie można połączyć z serwerem mysql " . mysql_errno() . "Opis błędu " . mysql_error());

mysql_select_db($db_to_connect, $db_link) or die("Nie można połączyć do  bazy danych mysql " . mysql_errno() . "Opis błędu " . mysql_error());

$zapytanie = "SELECT * FROM klienci";

if ($rezultat = mysql_query($zapytanie, $db_link))
{
print "<table>";


while(list($id_klienta, $email, $imie_i_nazwisko, $telefon, $adres_lokalu, $opis_problemu, $czas) = mysql_fetch_row($rezultat))
{
print "<tr><td>$id_klienta </td><td> $email </td><td> $imie_i_nazwisko </td><td> $telefon </td><td> $adres_lokalu </td><td> $opis_problemu</td><td> $czas </td></tr>";

}

print "</table>";

}


mysql_close();





//######################################################################
    print("</td></tr>");
    
    print("</table>");

footer();

?>