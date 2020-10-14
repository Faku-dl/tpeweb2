<?php
require_once "RouterAvanzado.php";
require_once "Controller/MateriasControlador.php";


class MateriaModel
{

    private $db;


    public function __construct()
    {

        $this->db = new PDO('mysql:host=localhost;' . 'dbname=escuela;charset=utf8', 'root', '');
    }

    function getTodasLasMaterias()
    {

        $sentencia = $this->db->prepare('SELECT * FROM materia ORDER BY nombre_materia ASC');
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getMateriasPorAsig($Asignatura)
    {
        $sentencia = $this->db->prepare('SELECT * FROM materia WHERE nombre_materia=? ORDER BY nombre_materia ASC');
        $sentencia->execute([$Asignatura]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function InsertarMateria($materia, $profesor, $curso)
    {

        $sentencia = $this->db->prepare('INSERT INTO materia(nombre_materia,profesor,curso) VALUES(?,?,?) ');
        $sentencia->execute(array($materia, $profesor, $curso));
    }
    function deleteMateria($id_materia = null)
    {

        $sentencia = $this->db->prepare('DELETE FROM materia WHERE id_materia=?');
        $sentencia->execute(array($id_materia));
    }
    function editMateria($id_materia, $materia, $profesor, $curso)
    {

        $sentencia = $this->db->prepare('UPDATE materia  SET nombre_materia=?, profesor=?, curso=? WHERE id_materia=?');
        $sentencia->execute(array($materia, $profesor, $curso, $id_materia));
    }

    function MostrarMateria($id_materia)
    {
        $sentencia = $this->db->prepare('SELECT * FROM materia WHERE id_materia=?');
        $sentencia->execute([$id_materia]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }
    function getMateriaPorNombre($nombre_materia)
    {
        $sentencia = $this->db->prepare('SELECT * FROM materia WHERE nombre_materia=?');
        $sentencia->execute([$nombre_materia]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }


    //////////ALUMNO///////////////////////
    
    
    function getTodosLosAlumnos()
    {

        $sentencia = $this->db->prepare('SELECT * FROM alumno ORDER BY nombre_alumno ASC');
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function getAlumnosporAsig($Asignatura)
    {
        $sentencia = $this->db->prepare('SELECT * FROM alumno WHERE materia=? ORDER BY nombre_alumno ASC');
        $sentencia->execute([$Asignatura]);
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    function InsertarAlumno($alumno, $email, $conducta,$calificacion,$materia)
    {
        $sentencia = $this->db->prepare('INSERT INTO alumno (nombre_alumno,email,conducta,calificacion, materia) VALUES(?,?,?,?,?) ');
        $sentencia->execute(array($alumno, $email, $conducta,$calificacion,$materia));
    }
    function deleteAlumno($id_alumno = null)
    {

        $sentencia = $this->db->prepare('DELETE FROM alumno WHERE id_alumno=?');
        $sentencia->execute(array($id_alumno));
    }
    function editAlumno($id_alumno, $alumno, $email,$conducta,$calificacion, $materia)
    {

        $sentencia = $this->db->prepare('UPDATE alumno  SET nombre_alumno=?, email=?, conducta=?, calificacion=?, materia=? WHERE id_alumno=?');
        $sentencia->execute(array($alumno, $email,$conducta,$calificacion, $materia, $id_alumno));
    }

    function MostrarAlumno($id_materia)
    {
        $sentencia = $this->db->prepare('SELECT * FROM alumno WHERE id_alumno=?');
        $sentencia->execute([$id_materia]);
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

};
