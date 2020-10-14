{include file="header.tpl"}
<ul class="list-group">
    <li class="list-group-item">Nombre del Alumno: {$alumno_s->nombre_alumno}</li>
    <li class="list-group-item">Email: {$alumno_s->email} </li>
    <li class="list-group-item">Conducta: {$alumno_s->conducta}</li>
    <li class="list-group-item">Calificación: {$alumno_s->calificacion}</li>
    <li class="list-group-item">Materia: {$asignatura_s->nombre_materia} </li>
    <li class="list-group-item">Titular a cargo: {$asignatura_s->profesor}</li>
    <li class="list-group-item">Curso: {$asignatura_s->curso}</li>
</ul>
{include file="footer.tpl"}