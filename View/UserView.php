<?php

require_once "./libs/smarty/Smarty.class.php";

class UserView{

    private $title;
    

    function __construct(){
        $this->title = "Login";
    }

    function ShowLogin($mensaje = null){

        $smarty = new Smarty();
        $smarty->assign('titulo', $this->title);
        $smarty->assign('mensaje', $mensaje);

        $smarty->display('templates/login.tpl');
    }

}


?>
