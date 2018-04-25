<?php


$link = mysql_connect('meblaks.mysql.ukraine.com.ua', 'meblaks_db', 'GTHYCUeS');
if (!$link) {
    die('Ошибка соединения: ' . mysql_error());
}
echo 'Успешно соединились';

$db_selected = mysql_select_db('meblaks_db', $link);
if (!$db_selected) {
    die ('Не удалось выбрать базу foo: ' . mysql_error());
}
mysql_query("SET NAMES 'utf8'");

$query = mysql_query("select model, product_id from oc_product");
while($row = mysql_fetch_assoc($query)) {
	$check = mysql_fetch_assoc(mysql_query("select * from oc_url_alias where query='product_id=".$row['product_id']."'"));
	if(!$check) {
		mysql_query("insert into oc_url_alias set query='product_id=".$row['product_id']."', keyword='".translitIt($row['model'])."'");
		#echo $row['product_id']; exit;
	}
}


function translitIt($str){
    $tr = array(
        "А"=>"a","Б"=>"b","В"=>"v","Г"=>"g","Д"=>"d",
        "Е"=>"e","Ё"=>"yo","Ж"=>"j","З"=>"z","И"=>"i",
        "Й"=>"y","К"=>"k","Л"=>"l","М"=>"m","Н"=>"n",
        "О"=>"o","П"=>"p","Р"=>"r","С"=>"s","Т"=>"t",
        "У"=>"u","Ф"=>"f","Х"=>"h","Ц"=>"c","Ч"=>"ch",
        "Ш"=>"sh","Щ"=>"sch","Ъ"=>"","Ы"=>"yi","Ь"=>"",
        "Э"=>"e","Ю"=>"yu","Я"=>"ya","а"=>"a","б"=>"b",
        "в"=>"v","г"=>"g","д"=>"d","е"=>"e","ё"=>"yo","ж"=>"j",
        "з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l",
        "м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
        "с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
        "ц"=>"c","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"y",
        "ы"=>"y","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya",
        " "=> "_", "."=> "", "/"=> "_"
    );
    return strtr($str,$tr);
}

