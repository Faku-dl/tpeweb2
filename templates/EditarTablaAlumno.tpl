{include file="header.tpl"}
{include file="sidebarAlumnos.tpl"}
<div class="container">
    <div class="col-9">
        <div>
            <h4>Editar Fila</h4>
        </div>

        <!-- Modal Cuerpo -->
        <div class="modal-body">
            <form action="EditarAlumno" method="POST">
                <!--REVISAR FORM ACTION-->
                <div class="form-group">
                    <input type="hidden" name="id_alumno" value="{$alumno_id}">
                </div>
                <div class="form-group">
                    <label for="alumno">Alumno:</label>
                    <input type="text" class="form-control" id="alumno" name="edit_alumno" placeholder="Nombre de la alumno">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="edit_email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="Conducta">Conducta:</label>
                    <input type="text" class="form-control" id="Conducta" name="edit_conducta" placeholder="Conducta">
                </div>
                <div class="form-group">
                    <label for="calificacion">Calificación:</label>
                    <input type="text" class="form-control" id="Calificacion" name="edit_calificacion" placeholder="Calificación">
                </div>
                <label for="validationCustom04">Seleccione la Materia a elegir:</label>
                <select class="custom-select" id="validationCustom04" name="select_materia">
                    {foreach from=$asignatura_s item= materia}
    
                        <option>{$materia->nombre_materia}</option>
    
                    {/foreach}
                </select>
                <div class="invalid-feedback">
                    <h4>Ingrese una materia</h4>
                </div>
                 <!-- Modal botón Editar -->
                <div>
                </div>
                <button type="submit" class="btn btn-warning">Editar</button>
            </form>
        </div>
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