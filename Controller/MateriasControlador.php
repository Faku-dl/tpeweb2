<?php
require_once "./RouterAvanzado.php";
require_once "Model/MateriaModel.php";
require_once "View/MateriasView.php";
require_once "UserControlador.php";

class MateriasControlador
{

    private $view;
    private $model;
    private $Titulo = "Todas las Materias";


    public function __construct()
    {
        $this->view = new MateriasView();
        $this->model = new MateriaModel();
    }

    private function comprobarSiHayUsuario()
    {
        session_start();
        if (empty($_SESSION['nombre_usuario'])) {
            //Existe un usuario logueado
        } else {
            if (!empty($_SESSION['navegando']) && (time() - $_SESSION['navegando'] > 50)) {

                header("Location: " . LOGOUT);
            }
        }
        $_SESSION['navegando'] = time();
    }
    function getAll()
    {
        $this->comprobarSiHayUsuario();
        $Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarTablaMateria($this->Titulo, $Asignatura);
    }

    function getMateriasPorAsig()
    {
        $this->comprobarSiHayUsuario();
        if ($_GET['select_materia'] != "Todas") {
            $Asignatura = $this->model->getMateriasPorAsig($_GET['select_materia']);
            $this->view->MostrarTablaMateria($this->Titulo, $Asignatura);
        } else {
            $this->view->showTablaMaterias();
        }
    }
    function InsertarMateria()
    {
        $this->comprobarSiHayUsuario();
        $this->model->InsertarMateria($_POST['input_materia'], $_POST['input_profesor'], $_POST['input_curso']);
        $this->view->showTablaMaterias();
    }
    function tablaMaterias()
    {
        $this->comprobarSiHayUsuario();
        $this->Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarTablaMateria($this->Titulo, $this->Asignatura);
    }
    function Home()
    {
        $this->comprobarSiHayUsuario();
        $this->view->MostrarHome();
    }
    //TERMINADA LA FUNCION BORRAR
    function DeleteMateria($params = null)
    {
        $id_materia = $params[':ID'];
        $this->model->deleteMateria($id_materia);
        $this->view->showTablaMaterias($id_materia);
    }

    function EditarID($params = null)
    {

        $id_materia = $params[':ID'];
        $Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarEditarTabla($this->Titulo, $Asignatura, $id_materia);
    }
    function EditarMateria()
    {
        $id_materia = $_POST['id_materia'];
        $materia = $_POST['edit_materia'];
        $profesor = $_POST['edit_profesor'];
        $curso = $_POST['edit_curso'];

        $this->model->editMateria($id_materia, $materia, $profesor, $curso);
        $this->view->showTablaMaterias();
    }
    function DetalleMateria($params = null)
    {

        $id_detalle = $params[':ID'];
        $Asignatura = $this->model->MostrarMateria($id_detalle);
        $this->view->showDetalles($Asignatura);
    }


    //////////////////////////////////ALUMNOS/////////////////////////////////////

    function getAllAlumnos()
    {
        //$this->comprobarSiHayUsuario();
        $Alumnos = $this->model->getTodosLosAlumnos();
        $Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarTablaAlumnos($this->Titulo, $Alumnos, $Asignatura);
    }

    function getAlumnosPorAsig()
    {
        // $Asignatura = $_GET['action'];
        $this->comprobarSiHayUsuario();
        if ($_GET['select_materia'] != "Todas") {
            $Alumnos = $this->model->getAlumnosporAsig($_GET['select_materia']);
            $Titulo = "Materia:" . $_GET['select_materia'];
            $Asignatura = $this->model->getTodasLasMaterias();
            $this->view->MostrarTablaAlumnos($Titulo, $Alumnos, $Asignatura);
        } else {
            $this->view->showTablaAlumnos();
        }
    }
    function InsertarAlumno()
    {
        $this->comprobarSiHayUsuario();
        $this->model->InsertarAlumno($_POST['input_alumno'], $_POST['input_email'], $_POST['input_conducta'], $_POST['input_calificacion'], $_POST['select_materia']);
        $this->view->showTablaAlumnos();
    }
    function tablaAlumnos()
    {
        $this->comprobarSiHayUsuario();
        $Alumnos = $this->model->getTodosLosAlumnos();
        $Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarTablaAlumnos($this->Titulo, $Alumnos, $Asignatura);
    }

    function DeleteAlumno($params = null)
    {
        $this->comprobarSiHayUsuario();
        $id_alumno = $params[':ID'];
        $this->model->deleteAlumno($id_alumno);
        $this->view->showTablaAlumnos($id_alumno);
    }

    function EditarIdAlumno($params = null)
    {
        $this->comprobarSiHayUsuario();
        $id_alumno = $params[':ID'];
        $Alumnos = $this->model->getTodosLosAlumnos();
        $Asignatura = $this->model->getTodasLasMaterias();
        $this->view->MostrarEditarTablaAlumnos($this->Titulo, $Alumnos, $id_alumno, $Asignatura);
    }
    function EditarAlumno()
    {
        $this->comprobarSiHayUsuario();
        $id_alumno = $_POST['id_alumno'];
        $alumno = $_POST['edit_alumno'];
        $email = $_POST['edit_email'];
        $conducta = $_POST['edit_conducta'];
        $calificacion = $_POST['edit_calificacion'];
        $materia = $_POST['select_materia'];
        $this->model->editAlumno($id_alumno, $alumno, $email, $conducta, $calificacion, $materia);
        $this->view->showTablaAlumnos();
    }
    function DetalleAlumno($params = null)
    {

        $this->comprobarSiHayUsuario();
        $id_detalle = $params[':ID'];
        $Alumnos = $this->model->MostrarAlumno($id_detalle);
        $nombre_materia = $Alumnos->materia;
        $Asignatura = $this->model->getMateriaPorNombre($nombre_materia);
        $this->view->showDetallesAlumno($Alumnos, $Asignatura);
    }
}
