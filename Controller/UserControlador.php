<?php
require_once "./RouterAvanzado.php";
require_once "Model/UserModel.php";
require_once "View/UserView.php";
class UserControlador
{
    private $view;
    private $model;
    function __construct()
    {
        $this->view = new UserView();
        $this->model = new UserModel();
    }

    function cerrarSesion()
    {
        session_start();
        session_destroy();
        header("Location: " . LOGIN);
    }

    function login()
    {
        $this->view->ShowLogin();
    }

    function CrearUsuario()
    {
        $hash = password_hash($_POST['crear_password'], PASSWORD_DEFAULT);
        $this->model->CrearUsuario($_POST['crear_nombre'], $_POST['crear_email'], $hash);
        $this->view->ShowLogin();
    }


    function VerificarUsuario()
    {
        $user = $_POST["validar_email"];
        $pass = $_POST["validad_password"];

        if (!empty($user)) {
            $userFromDB = $this->model->TraerUsuario($user);

            if (isset($userFromDB) && $userFromDB) {
                // Existe el usuario

                if (password_verify($pass, $userFromDB->password_u)) {

                    session_start();
                    $_SESSION['nombre_usuario'] = $userFromDB->nombre_usuario;
                    $_SESSION['navegando'] = time();

                    header("Location: " . BASE_URL . "Home");
                } else {
                    $this->view->ShowLogin("Contraseña incorrecta");
                }
            } else {
                // No existe el user en la DB
                $this->view->ShowLogin("El usuario no existe");
            }
        }
    }

    function entrarSinUsuario(){
        session_start();
        $_SESSION['nombre_usuario'] = "admin";
        header("Location: " . BASE_URL . "Home");
    }
}
