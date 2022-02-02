<?php
    $url='localhost';
    $username='root';
    $password='';
    $conn=mysqli_connect($url,$username,$password,"sim_si_hospitalier");
    if(!$conn){
        die('Could not Connect My Sql:' .mysql_error());
    }else{
    	//echo "OK,successfully connected to the server";
    }
?>