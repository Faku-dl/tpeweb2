{include file="header.tpl"}
<!-- VENTANA para Loguearse -->
<div>
    <div>
        <div>
            <!-- Encabezado de la ventana -->
            <div class="modal-header">
                <h4 class="modal-title">Ingresar</h4>
            </div>
            <!-- Cuerpo de la ventana -->
            <div class="container">
                <div class="modal-body">
                    <!-- REVISAR FORM ACTION-->
                    <form action="VerificarUsuario" method="POST" class="was-validated" valid-feedback>
                        <div class="form-group">
                            <label for="email">Usuario:</label>
                            <input type="email" class="form-control" placeholder="Ingrese un email" id="email" name="validar_email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Contraseña:</label>
                            <input type="password" class="form-control" placeholder="Ingrese password" id="pwd" name="validad_password">
                        </div>
                        <button type="submit" class="btn btn-success">Ingresar</button>
                    </form>
                    {if $mensaje!=""}
                        <p class="text-danger">{$mensaje}</p>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}