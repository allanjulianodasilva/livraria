<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listar Livros</title>
</head>
<body>
    <h2>Listar Livros</h2>
    <table border="1">
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Ano de Publicação</th>
        </tr>
        <%-- Substitua 'livros' pelo nome da sua lista de livros --%>
        <c:forEach var="livro" items="${livros}">
            <tr>
                <td>${livro.titulo}</td>
                <td>${livro.autor}</td>
                <td>${livro.anoPublicacao}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
