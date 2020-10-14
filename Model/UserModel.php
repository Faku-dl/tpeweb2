<?php
require_once "RouterAvanzado.php";
require_once "Controller/UserControlador.php";


class UserModel
{

    private $db;


    public function __construct()
    {

        $this->db = new PDO('mysql:host=localhost;' . 'dbname=escuela;charset=utf8', 'root', '');
    }

    function TraerUsuario($user){
        $sentencia = $this->db->prepare("SELECT * FROM usuario WHERE email=?");
        $sentencia->execute(array($user));
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }
      
    function CrearUsuario($nombre,$email,$password)
    {
        $sentencia = $this->db->prepare('INSERT INTO usuario (nombre_usuario,email, password_u) VALUES(?,?,?)');
        $sentencia->execute(array($nombre,$email,$password));
    }


};
