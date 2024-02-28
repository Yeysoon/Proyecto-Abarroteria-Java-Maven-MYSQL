<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
        body {
            background-image: url('fondo.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
        }
        .center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background: transparent;
            border: 2px solid #fff;
            border-radius: 15px;
            box-shadow: 0 0 10px #fff;
        }
        .form-group label {
            font-family: 'Arial', sans-serif;
            color: white;
            animation: fadeIn 1s ease-in-out;
            text-align: center; /* Centra el texto "Usuario" y "Contraseña" */
        }
        .form-control {
            font-family: 'Arial', sans-serif;
            color: white;
            background: transparent;
            border: 2px solid #fff;
            border-radius: 10px;
            animation: fadeIn 1s ease-in-out;
        }
        .form-control::placeholder {
            color: white;
        }
        .btn {
            background: #888; /* Fondo gris */
            border: 2px solid #fff;
            border-radius: 10px;
            color: #fff; /* Texto blanco */
            display: inline-block; /* Coloca los botones en la misma línea */
        }
        .btn:hover {
            background: #555; /* Cambia el fondo al pasar el ratón */
        }
        .btn-primary {
            margin-right: 10px; /* Espacio entre los botones */
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container center">
        <div class="card" style="width: 18rem;">
            <div class="text-center">
                <img class="card-img-top" src="Logo White Letras.png" alt="Card image cap" style="width: 200px; height: 170px;">
            </div>

            <div class="card-body">
                <!-- Cambio en la acción del formulario para apuntar al servlet sr_login -->
                <form action="sr_login" method="POST"> 
                    <div class="form-group">
                        <label for="inputUsuario">Usuario</label>
                        <!-- Corrección del tipo de entrada y cambio del id y for para mejor legibilidad -->
                        <input type="text" name="usuario" class="form-control" id="inputUsuario" placeholder="Usuario" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputPassword">Contraseña</label>
                        <!-- Cambio del id y for para mejor legibilidad -->
                        <input type="password" name="contraseña" class="form-control" id="inputPassword" placeholder="Contraseña" required >
                        <small id="passwordHelp" class="form-text text-muted">Tu contraseña es tuya, cuídala y no la compartas con nadie</small>
                    </div>
                    
                    <div class="form-group text-center"> <!-- Centra los botones -->
                        <button type="submit" class="btn btn-primary">Ingresar</button>
                        <button type="button" class="btn btn-secondary">Solicitud</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
