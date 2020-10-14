{include file="header.tpl"}
{include file="sidebarMaterias.tpl"}
<div class="container">
    <div class="col-9">
        <div>
            <h4>Editar Fila</h4>
        </div>

        <!-- Modal Cuerpo -->
        <div class="modal-body">
            <form action="Editar" method="POST">
                <!--REVISAR FORM ACTION-->
                <div class="form-group">
                    <input type="hidden" name="id_materia" value="{$materia_id}">
                </div>
                <div class="form-group">
                    <label for="materia">Materia:</label>
                    <input type="text" class="form-control" id="materia" name="edit_materia" placeholder="Nombre de la Materia">
                </div>
                <div class="form-group">
                    <label for="profesor">Profesor:</label>
                    <input type="text" class="form-control" id="profesor" name="edit_profesor" placeholder="Profesor">
                </div>
                <div class="form-group">
                    <label for="curso">Curso:</label>
                    <input type="text" class="form-control" id="curso" name="edit_curso" placeholder="Curso">
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
                    <th>Materia</th>
                    <th>Profesor</th>
                    <th>Curso</th>
                    {if isset($smarty.session.nombre_usuario)}
                    <th>Editar</th>
                    <th>Borrar</th>
                    {/if}
                </tr>
            </thead>
            <tbody>

                {foreach from=$asignatura_s item= materia}
                    <tr>
                        <td>{$materia->nombre_materia}</td>
                        <td>{$materia->profesor}</td>
                        <td>{$materia->curso}</td>
                        {if isset($smarty.session.nombre_usuario)}
                        <td> <button type="button" class="btn btn-warning"><a class="text-white text-decoration-none" href="Editar/{$materia->id_materia}">Menu</a></button></td>
                        <td> <button type="button" class="btn btn-danger"><a class="text-white text-decoration-none" href="Borrar/{$materia->id_materia}">Borrar</a></button></td>
                        {/if}
                        <br>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
{include file="footer.tpl"}