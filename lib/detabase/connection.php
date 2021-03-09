<?php
$dns = ‘mysql:host=localhost;dbname=id15879432_flutterdatabase’;
$user = ‘id15879432_admin’;
$password = ‘5NVxCg?(?Z9[0lpg’;
try{
 $db = new PDO ($dns, $user, $pass);
}catch( PDOException $e){
 $error = $e->getMessage();
 echo $error;
}
?>