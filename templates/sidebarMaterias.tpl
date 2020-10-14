<nav class="col-3">
    <div class="container">
        <!-- Modal Ordenar -->
        <h4>Filtrar por Materia</h4>
        <form action="Select" method="GET">
            <label for="validationCustom04">Seleccione la Materia a filtrar:</label>
            <select class="custom-select" id="validationCustom04" name="select_materia">
                <option>Todas</option>
                {foreach from=$asignatura_s item= materia}
    
                    <option>{$materia->nombre_materia}</option>
    
                {/foreach}
            </select>
            <div class="invalid-feedback">
                <h4>Ingrese una materia</h4>
            </div>
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary">Mostrar</button>
            </div>
        </form>
    </div>
    <div style="height: 15px;">
    </div>
    <!-- Modal Ingresar Fila Materia-->
    {if isset($smarty.session.nombre_usuario)}
    <div class="d-flex justify-content-center">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal3">Insertar Materia</button>
    </div>
    {/if}
    <div class="modal" id="myModal3">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Título -->
                <div class="modal-header">
                    <h4 class="modal-title">Insertar Nueva Materia</h4>
                </div>
                <!-- Modal Cuerpo -->
                <div class="modal-body">
                    <div class="form-group">
                        <form action="Insertar" method="POST">
                            <div class="form-group">
                                <label for="title">Materia</label>
                                <input class="form-control" id="materia" name="input_materia" aria-describedby="emailHelp" placeholder="Titulo de la Materia">
                            </div>
                            <div class="form-group">
                                <label for="description">Profesor</label>
                                <input class="form-control" id="profesor" name="input_profesor" placeholder="Profesor que dicta la catedra">
                            </div>
                            <div class="form-group">
                                <label for="description">Curso</label>
                                <input class="form-control" id="curso" name="input_curso" placeholder="División de los pequeños angelitos">
                            </div>
                            <button type="submit" class="btn btn-info">Crear Curso</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>