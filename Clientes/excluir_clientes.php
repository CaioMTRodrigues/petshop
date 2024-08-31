<?php

// Recebe os parâmetros do formulário HTML
$id = $_GET['id'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aula1708"; 

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checa a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Prepara e vincula
$stmt = $conn->prepare("DELETE FROM clientes WHERE id='".$id."';");
$stmt->execute();


echo "Registro excluido com com sucesso";
echo '<a href="listar_clientes.php">Ir para Listar Cadastros de clientes</a>';

// Fecha a conexão
$stmt->close();
$conn->close();
?>