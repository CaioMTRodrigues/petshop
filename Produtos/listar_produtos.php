<?php
$servername = "localhost";
$username = "root"; // Altere para o seu usuário MySQL
$password = ""; // Altere para a sua senha MySQL
$dbname = "aula1708"; // Altere para o nome do seu banco de dados

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checa a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Consulta SQL para selecionar todos os registros
$sql = "SELECT id, nome, descricao, preco FROM servico";
$result = $conn->query($sql);

// Exibe a tabela HTML
echo "<!DOCTYPE html>
<html lang='pt-BR'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Lista de Serviços</title>
    <!-- Incluindo o CSS do Bootstrap -->
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
    <style>
        body {
            margin: 20px;
        }
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class='container'>
        <a href='/aula1708' class='btn btn-primary mb-3'>Voltar</a>
                <a href=\"cadastro_produtos.html\" class='btn btn-primary mb-3'>Cadastrar ClientesProdutos</a>

        <h2>Lista de Serviços</h2>";

if ($result->num_rows > 0) {
    echo "<table class='table table-bordered'>
            <thead class='thead-light'>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody>";

    // Saída dos dados de cada linha
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row["id"]) . "</td>
                <td>" . htmlspecialchars($row["nome"]) . "</td>
                <td>" . htmlspecialchars($row["descricao"]) . "</td>
                <td>" . htmlspecialchars($row["preco"]) . "</td>
              </tr>";
    }

    echo "  </tbody>
        </table>";
} else {
    echo "<p class='alert alert-warning'>0 resultados</p>";
}

echo "</div>
    <!-- Incluindo o JavaScript do Bootstrap -->
    <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
</body>
</html>";

// Fecha a conexão
$conn->close();
?>
