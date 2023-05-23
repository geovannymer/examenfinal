<?php
header("Access-Control-Allow-Origin:*");
require_once 'Connection.php';

$connection = new Connection();

$query = "SELECT * FROM products";

$products = $connection->query($query);

if($products === null){
    echo 'No se pudo cargar los productos';
    exit();
}

echo json_encode($products);