<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Class.forName("com.mysql.jdbc.Driver"); //Descobrindo o driver
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/livraria", "root", ""); //conectando com o banco
    out.print("conexão realizada");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>Catálogo de Livros</h1>
    <form action="index.jsp" method="get">
        Pesquisar por Título: <input type="text" name="search">
        <input type="submit" value="Pesquisar">
    </form>

</body>
</html>
