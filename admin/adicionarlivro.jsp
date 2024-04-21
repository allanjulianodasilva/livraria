<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adicionar Livro</title>
</head>
<body>
    <h2>Adicionar Livro</h2>
    <form action="index.jsp"method="post">
        <label for="titulo">Título do Livro:</label>
        <input type="text" id="titulo" name="titulo" required><br><br>
        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br><br>
        <label for="editora">Editora:</label>
        <select id="editora" name="editora" required>
            <option value="editora1">Editora 1</option>
            <option value="editora2">Editora 2</option>
            <!-- Adicione opções dinamicamente a partir do banco de dados se preferir -->
        </select><br><br>
        <input type="submit" value="Adicionar">
    </form>
</body>
</html>
