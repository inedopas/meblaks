<?php
$start = microtime(true);

$time = microtime(true) - $start; 
echo $time;

echo 'Время выполнения скрипта: '.round(microtime(true) - $start, 4).' сек.';

?>
<?php phpinfo(); ?> 
