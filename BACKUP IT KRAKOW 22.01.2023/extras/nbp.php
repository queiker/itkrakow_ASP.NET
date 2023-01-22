<?php 
include("functions.php");
include("auth.inc.php");
bootstrap();
you_are_logged_in();
head();


function convert($text) {
    // Zmień na żądane kodowanie znaków - puste pozostawia UTF-8
    $charset = '';
    
    if($charset && function_exists('iconv')) {
        return iconv('utf-8', $charset, $text);
    }
    elseif($charset && function_exists('recode_string')) {
        return recode_string('utf8...'.$charset, $text);
    }
    else
    {
        return $text;
    }
}

class kursy {
    /* zawartość arkusza XML z kursami */
    private $contents = '';
    
    function __construct($url, $cache = 'kursy_cache.txt',
                    $lastupdate = '12:16 -1 day', $thisupdate = '12:16') {
        // Plik z cache:
        // $cache
        // Czy dane w cache w cache aktualne?
        $recent = TRUE;
        
        // Daty ostatnich aktualizacji
        $lastupdate = strtotime($lastupdate);
        $thisupdate = strtotime($thisupdate);
        
        // Sprawdzenie możliwości zapisania kursów
        if( ( !file_exists($cache) AND !is_writable(dirname($cache)) )
            OR ( file_exists($cache) AND !(is_writable($cache)) ) ) {
            // Plik cache "nie działa"
            $cache = '';
        }
        else
        {
            // Dane są aktualne?
            if(@filemtime($cache) < $lastupdate) {
                $recent = FALSE;
            }
            elseif(time() > $thisupdate && @filemtime($cache) < $thisupdate) {
                $recent = FALSE;
            }
        }
        
        // Nie istnieje możliwość zapisu w cache lub dane są nieaktualne
        if($cache == '' OR !$recent) {
            // Link do arkusza XML
            $this->contents = file_get_contents($url);
            if($this->contents == FALSE) {
                throw new Exception('Nie udało się pobrać kursów walut.');
            }
            
            // Można zapisać do cache'a
            if($cache != '') {
                // Zapamiętujemy arkusz
                file_put_contents($cache, $this->contents);
            }
        }
        else
        {
            // Ładujemy zapisane dane
            $this->contents = file_get_contents($cache);
        }
    }
    
    function znajdz($fields) {
        if(!is_array($fields)) {
            $fields = array($fields);
        }
        
        $last = libxml_use_internal_errors(TRUE);
        $info = new SimpleXMLElement($this->contents);
        libxml_use_internal_errors($last);
        
        /* tablica wypełniana kursami */
        $rates = array(
            'numer_tabeli' => (string)$info->numer_tabeli,
            'data_publikacji' => (string)$info->data_publikacji
        );
        
        foreach($info->pozycja as $v) {
            $kod = (string)$v->kod_waluty;
            $rates[$kod] = array(
                'nazwa' => convert((string)$v->nazwa_waluty),
                'ilosc' => (string)$v->przelicznik
            );
            foreach($fields as $field) {
                $rates[$kod][$field] = (string)$v->$field;
            };
        }
        
        return $rates;
    }
}



print("<table>");
    print("<tr><td>");
    
    menu();
    
    print("</td><td>");

    


try {
    // adres do kursów, plik do cache'owania, poprzednia aktualizacja, najbliższa aktualizacja
    $kursy = new kursy('http://nbp.pl/kursy/xml/LastA.xml', 'kursy_cache.txt', '12:16 -1 day', '12:16');
    $waluta = $kursy->znajdz(array('kurs_sredni'));
    
    echo $waluta['USD']['ilosc'].' USD: '.$waluta['USD']['kurs_sredni'].'<br />
'.$waluta['EUR']['ilosc'].' EUR: '.$waluta['EUR']['kurs_sredni'].'';
}
catch(Exception $e) {
    echo 'Błąd przy wyświetlaniu kursów walut.';
    // Aby pokazać błąd, odkomentuj poniższą linię:
    // var_dump($e);
}



    print("</td></tr>");
    
    print("</table>");


footer();

?>












