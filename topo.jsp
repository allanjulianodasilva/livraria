<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="db_connection.jsp" %>

<%

String usuarioLogado = (String) request.getSession().getAttribute("usuarioLogado");
boolean isAdmin = (boolean) request.getSession().getAttribute("isAdmin");

if (nivel == 2 && !isAdmin) 
{
    response.sendRedirect("login.jsp");
}
else {
    if (nivel == 1 && usuarioLogado.isEmpty()) 
    {
        response.sendRedirect("login.jsp");
    }  
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div id="topo">
        <%
        if (!usuarioLogado.isEmpty()) { %>


        Ola <%=usuarioLogado%>!- 
        <a href="logout.jsp">Sair</a>


        <%}
        else {%>
        <a href="login.jsp">Login</a>
        <%}%>
    </div>
    <h1>Catálogo de Livros</h1>