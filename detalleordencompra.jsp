<%@page import="modelo.Productos"%>
<%@page import="modelo.OrdenCompra"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Formulario de Detalle de Orden de Compra</title>
        
        
            <style>
        body {
            background-image: url('Fondo de Paginas3.jpg');
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .navbar {
            background-color: transparent;
            border: 2px solid #333;
        }

        .navbar-dark .navbar-nav .nav-link {
            font-family: 'Your-Fancy-Font', sans-serif;
            color: white;
        }

        .navbar-dark .navbar-toggler-icon {
            background-color: white;
        }

        .navbar-dark .navbar-toggler {
            border: 2px solid white;
        }

        .dropdown-menu {
            background-color: #555;
            border: 2px solid #fff;
        }

        .dropdown-menu a {
            color: white;
        }

        .dropdown-menu a:hover {
            background-color: #333;
        }

        .navbar-nav li.active {
            background-color: #55555; /* Cambia el fondo al seleccionar */
            border: 2px solid white; /* Borde blanco neon al seleccionar */
        }
    </style>
    </head>
    <body>
        
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" style="font-family: Arial; color: white; font-size: 1.5em;" href="home.jsp">
                <img src="LogoPrincipal.png" alt="Texto descr   iptivo de la imagen" width="60" height="40" >
            </a>



                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <button type="button" class="btn btn-outline-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg> </button>  
                        </a>
                        
                        <div class="dropdown-menu" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="index.jsp">Cerrar Sesión</a>
                        </div>
                    </li>
                </ul>

            </div>
        </nav>
        
        
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <h2>Formulario de Detalle de Orden de Compra</h2>
                    <form action="sr_detalle_orden_compra" method="post" class="bg-white rounded p-4">
                        <div class="mb-3">
                            <label for="IDOrdenCompra" class="form-label">ID Orden de Compra</label>
                            <select id="IDOrdenCompra" name="IDOrdenCompra" class="form-control" readonly>
                                <%
                                    OrdenCompra orden = new OrdenCompra();
                                    HashMap<String, String> dropOrden = orden.drop_sangre();
                                    for (String i : dropOrden.keySet()) {
                                        out.println("<option value='" + i + "'>" + dropOrden.get(i) + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        
                        <table class="table table-bordered" id="productsTable">
                            <thead>
                                <tr>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="productRow">
                                    <td>
                                        <select name="IDProducto[]" class="form-control">
                                            <%
                                                Productos producto = new Productos();
                                                HashMap<String, String> dropProducto = producto.drop_sangre();
                                                for (String i : dropProducto.keySet()) {
                                                    out.println("<option value='" + i + "'>" + dropProducto.get(i) + "</option>");
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td><input type="number" class="form-control Cantidad" name="Cantidad[]" value="0" oninput="calcularTotal()"></td>
                                    <td><input type="text" class="form-control PrecioUnitario" name="PrecioUnitario[]" value="0" oninput="calcularTotal()"></td>
                                    <td><input type="text" class="form-control SubTotal" name="SubTotal[]" value="0" readonly></td>
                                </tr>
                            </tbody>
                        </table>

                        <button type="button" class="btn btn-secondary mb-3" onclick="addProduct()">Añadir más productos</button>

                        <div class="mb-3">
                            <label for="Total" class="form-label">Total</label>
                            <input type="text" class="form-control" id="Total" name="Total" placeholder="Total" readonly>
                        </div>

                        <button name="btn_agregar" id="btn_agregar" value="agregar" type="submit" class="btn btn-primary">Ingresar Datos</button>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function addProduct() {
                var newRow = document.querySelector('.productRow').cloneNode(true);
                newRow.querySelector('.Cantidad').value = 0;
                newRow.querySelector('.PrecioUnitario').value = 0;
                newRow.querySelector('.SubTotal').value = 0;
                document.getElementById('productsTable').tBodies[0].appendChild(newRow);
            }

            function calcularTotal() {
                var total = 0;
                var rows = document.querySelectorAll('.productRow');
                rows.forEach(function(row) {
                    var cantidad = parseFloat(row.querySelector('.Cantidad').value) || 0;
                    var precioUnitario = parseFloat(row.querySelector('.PrecioUnitario').value) || 0;
                    var subtotal = cantidad * precioUnitario;
                    row.querySelector('.SubTotal').value = subtotal.toFixed(2);
                    total += subtotal;
                });
                document.getElementById('Total').value = total.toFixed(2);
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
</html>
