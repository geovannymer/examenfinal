<?php

class Connection{
    
    private $connection;
        
    public function __construct(){
        // 3. Setear el nombre de la base de datos 
        $dsn = "mysql:host=localhost;dbname=on_line_store";
        // 3. Setear el nombre del usuario de su gestor de base de datos
        $user ='root';
        // 3. Setear la contraseña de su gestor de base de datos
        $password = '19711217';
        $this->connection = new PDO($dsn, $user, $password);    
    }

    public function query($query){
        $result = $this->connection->query($query);
        if($result === false){
            return null;
        }

        $list = [];
        foreach($result as $item){
            $list[] = $item;
        }
        return $list;
    }
    
    public function getLastId(){
        return $this->connection->lastInsertId();
    }
}