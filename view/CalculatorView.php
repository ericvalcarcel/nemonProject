<?php 

class CalculatorView {
    public function render($result = null, $previousUser = null) {
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- Bootstrap CSS -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
            <!-- SweetAlert2 -->
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <style>
                body {
                background: linear-gradient(to right, rgba(135,206,235,0.5), rgba(25,25,112,0.5));
                }
                h1 {
                    font-family: Arial, sans-serif;
                    font-weight: bold;
                    font-size: 2.5em;
                }

                .mt-4, p {
                    font-family: Arial, sans-serif;
                    font-weight: bold;
                    font-size: 1.5em;
                }

                label {
                    font-weight: bold;
                    font-size: 1.2em;
                }
            </style>
            <title>Calculadora</title>
        </head>
        <body>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-6">
                        
                        <div class="form-group d-flex justify-content-center align-items-center">
                            <img src="assets/images/NEMON-LOGO.png" alt="Logo de la empresa">
                        </div>
                        <h1 class="text-center my-4">Calculadora</h1>
                        <form method="post">
                        <div class="form-group">
                            <label for="username">Nombre de usuario:</label>
                            <input type="text" id="username" name="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="operand1">Operando 1:</label>
                            <input type="text" id="operand1" name="operand1" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="operand2">Operando 2:</label>
                            <input type="text" id="operand2" name="operand2" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="operand3">Operando 3:</label>
                            <input type="text" id="operand3" name="operand3" class="form-control">
                        </div>
                        <input type="submit" value="Calcular" class="btn btn-primary">
                       </form>

                        <?php
                        if ($result !== null) {
                            echo "<p class='mt-4'>Resultado: $result</p>";
                            if ($previousUser !== null) {
                                echo "<p>Operación previamente realizada por: $previousUser</p>";
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
            <script>
                document.querySelector('form').addEventListener('submit', function(e) {
                    var username = document.getElementById('username').value;
                    var operand1 = document.getElementById('operand1').value;
                    var operand2 = document.getElementById('operand2').value;

                    var missingFields = [];
                    if (!username) missingFields.push('Nombre de usuario');
                    if (!operand1) missingFields.push('Operando 1');
                    if (!operand2) missingFields.push('Operando 2');

                    if (missingFields.length > 0) {
                        e.preventDefault();
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            html: 'Por favor, rellena los siguientes campos: <strong>' + missingFields.join(', ') + '</strong>'
                        });
                    }
                });
            </script>
        </body>
        </html>
        <?php
    }
}
?>