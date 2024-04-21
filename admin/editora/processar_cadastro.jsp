<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Processamento de Cadastro</title>
</head>
<body>
    <%
        // Recuperando os parâmetros do formulário
        String nome = request.getParameter("nome");
        // Aqui você pode realizar a lógica de cadastro, como salvar os dados em um banco de dados, por exemplo.

        // Exemplo simples de exibição dos dados cadastrados
    %>
    <h2>Cadastro Processado com Sucesso</h2>
    <p>Nome: <%= nome %></p>
</body>
</html>
