<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="db_connection.jsp" %>

<%
Object objeto = request.getSession().getAttribute("usuarioLogado");
String usuarioLogado = objeto != null ? (String) request.getSession().getAttribute("usuarioLogado") : "";

objeto = request.getSession().getAttribute("isAdmin");
boolean isAdmin = objeto != null ? (boolean) request.getSession().getAttribute("isAdmin") : false ;

if (nivel == 2 && !isAdmin) 
{
    response.sendRedirect("/livraria/login.jsp");
}
else {
    if (nivel == 1 && usuarioLogado.isEmpty()) 
    {
        response.sendRedirect("/livraria/login.jsp");
    }  
}


%>


<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="/livraria/assets/css/styles.css">
</head>
<body>
    <div id="topo">
        <nav style="float: left;">
        <%
        if (isAdmin) { %>
            <a href="/livraria/admin/editora/listar.jsp">Editora</a> | 
            <a href="/livraria/admin/livro/listar.jsp">Livro</a> | 
            <a href="/livraria/admin/usuario/listar.jsp">Usuário</a>
        <%}%>
         </nav>
         <div class="login" style="float: right;">
            <%
                if (!usuarioLogado.isEmpty()) { %>
                    Ola <%=usuarioLogado%>! | 
                    <a href="/livraria/logout.jsp"><img class="sair" src="/livraria/assets/img/logout.png"></a>
            <%}
            else {%>
                <a href="/livraria/login.jsp">Login</a>
            <%}%>
         </div>
    </div>
    <h1>Catálogo de Livros</h1> 
    <%
    
objeto = request.getSession().getAttribute("msg");
String msg = objeto != null ? (String) request.getSession().getAttribute("msg") : "";

if (!msg.isEmpty()) 
{
    out.print(msg);
}
session.setAttribute("msg", "");
    %>