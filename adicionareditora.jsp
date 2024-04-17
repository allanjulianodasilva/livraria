<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adicionar Editora</title>
</head>
<body>
    <h2>Adicionar Editora</h2>
    <form action="index.jsp" method="post">
        <label for="nome">Nome da Editora:</label>
        <input type="text" id="nome" name="nome" required><br><br>
        <label for="localizacao">Localização:</label>
        <input type="text" id="localizacao" name="localizacao" required><br><br>
        <input type="submit" value="Adicionar">
    </form>
</body>
</html>
