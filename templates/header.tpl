<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <base href="{BASE_URL}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="shortcut icon" href="./imgs/IconoPeron.jpg"> 
    <title>{$titulo}</title>
</head>

<body>
    <!-- BARRA DE NAVEGACIÓn -->
    <nav class="navbar navbar-expand-md bg-light navbar-light">
        <a class="navbar-brand" href="main">
            <img src="./imgs/Peron.jpg" alt="logo" style="width:55px;">
        </a>
        <a class="navbar-brand" href="home">Escuelita Virtual</a>
        <div class="container">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="btn btn-outline-success" href="#">Correo Local</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" href="#">Calendario</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Primer Trimestre</a>
                        <a class="dropdown-item" href="#">Segundo Trimestre</a>
                        <a class="dropdown-item" href="#">Tercer Trimestre</a>
                    </div>
                </li>
                </ul>
                {if isset($smarty.session.nombre_usuario)}
                    <h4>{$smarty.session.nombre_usuario}, El General te da la bienvenida</h4>
                {/if}
        </div>
        <!-- Navbar links -->
        <div class="container d-flex flex-row-reverse">
        <ul class="navbar-nav">
        {if isset($smarty.session.nombre_usuario)}
            <li class="nav-item">
            <button type="button" class="btn btn-primary"> <a href="logout" class="text-white show-decoration-none"> Cerrar sesión</a></button>
            </li>
            {else}
            <li class="nav-item">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal10" data-keyboard="true">Crear una cuenta</a>
            </li>
            <li class="nav-item">
                        <button type="button" class="btn btn-primary"> <a href="login" class="text-white show-decoration-none"> Ingresar</a></button>
                    </li>
                {/if}

                <!-- 
                    <li class="nav-item">
                        <button type="button" class="btn btn-primary"> <a href="logout" class="text-white show-decoration-none"> Cerrar sesión</a></button>
                    </li>
                -->

                <!-- VENTANA para CREAR CUENTA -->
                <div class="modal fade" id="myModal10">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <!-- Encabezado de la ventana -->
                            <div class="modal-header">
                                <h4 class="modal-title">Crear Cuenta</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <!-- Cuerpo de la ventana -->
                            <div class="container">
                            <h3>Perón te necesita</h3>
                                <div class="modal-body">
                                    <!-- REVISAR FORM ACTION-->
                                    <form action="CrearUsuario" method="POST" class="was-validated" valid-feedback>
                                        <div class="form-group">
                                            <P></P>
                                            <label for="pwd">Nombre de Usuario:</label>
                                            <input type="text" class="form-control" placeholder="Nombre corto plis" id="name" name="crear_nombre">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Usuario:</label>
                                            <input type="email" class="form-control" placeholder="Cree email" id="email" name="crear_email">
                                        </div>
                                        <div class="form-group">
                                            <label for="pwd">Contraseña:</label>
                                            <input type="password" class="form-control" placeholder="password: No vale 123456" id="pwd" name="crear_password">
                                        </div>
                                        <button type="submit" class="btn btn-success">Crear Usuario</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ul>
        </div>
    </nav>