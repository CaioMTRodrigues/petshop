<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aula1708";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$sql = "SELECT id, nome, especie, raca FROM animais";
$result = $conn->query($sql);

echo "<!DOCTYPE html>
<html lang='pt-BR'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Lista de Animais</title>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
</head>
<body>
    <div class='container mt-4'>
        <a href='/aula1708' class='btn btn-primary mb-3'>Voltar</a>
                <a href=\"cadastro_animais.html\" class='btn btn-primary mb-3'>Cadastrar Animais</a>

        <h2>Lista de Animais</h2>";

if ($result->num_rows > 0) {
    echo "<table class='table table-bordered'>
            <thead class='thead-light'>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Espécie</th>
                    <th>Raça</th>
                </tr>
            </thead>
            <tbody>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row["id"]) . "</td>
                <td>" . htmlspecialchars($row["nome"]) . "</td>
                <td>" . htmlspecialchars($row["especie"]) . "</td>
                <td>" . htmlspecialchars($row["raca"]) . "</td>
              </tr>";
    }

    echo "  </tbody>
        </table>";
} else {
    echo "<p class='alert alert-warning'>Nenhum resultado encontrado.</p>";
}

echo "</div>
    <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
</body>
</html>";

$conn->close();
?>
