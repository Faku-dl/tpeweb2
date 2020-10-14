{include file="header.tpl"}
{include file="sidebarAlumnos.tpl"}
<div class="container">
    <div class="col-9">
        <table class="table table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Alumno</th>
                    <th>Email</th>
                    <th>Conducta</th>
                    <th>Calificación</th>
                    <th>Materia</th>
                    {if isset($smarty.session.nombre_usuario)}
                    <th>Editar</th>
                    <th>Borrar</th>
                    {/if}
                </tr>
            </thead>
            <tbody>
                {foreach from=$alumnos_s item= alumno}
                    <tr>
                        <td><a href="DetalleAlumno/{$alumno->id_alumno}">{$alumno->nombre_alumno}</a></td>
                        <td>{$alumno->email}</td>
                        <td>{$alumno->conducta}</td>
                        <td>{$alumno->calificacion}</td>
                        <td>{$alumno->materia}</td>
                        {if isset($smarty.session.nombre_usuario)}
                        <td> <button type="button" class="btn btn-warning"><a class="text-white text-decoration-none" href="EditarAlumno/{$alumno->id_alumno}">Menu</a></button></td>
                        <td> <button type="button" class="btn btn-danger"><a class="text-white text-decoration-none" href="BorrarAlumno/{$alumno->id_alumno}">Borrar</a></button></td>
                        {/if}
                        <br>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
{include file="footer.tpl"}