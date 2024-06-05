<%@ include file="../db_connection.jsp" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
// BUSCA A VARIAVEL "usuarioLogado" NA SESSION
Object objeto = request.getSession().getAttribute("usuarioLogado");
String usuarioLogado = objeto != null ? (String) request.getSession().getAttribute("usuarioLogado") : "";

// SE A VARIAVEL "usuarioLogado" ESTIVER VAZIA REDIRECIONA PARA TELA DE LOGIN
if (usuarioLogado.isEmpty()) 
    response.sendRedirect("/livraria/admin/login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="/livraria/assets/css/styles.css">
    <script language="Javascript">
    <%-- FUNCAO JAVASCRIPT DE CONFIRMACAO DE EXCLUSAO --%>
    function confirmacao(id) {
        var resposta = confirm("Deseja remover esse registro?");
        if (resposta == true) {
            var url = 'excluir.jsp?id='+id;
            window.location.href = url;
        }
    }
    </script>

</head>
<body>
    <div id="topo">
        <%-- MENU DO SISTEMA --%>
        <nav style="float: left;">
            <%
            // SE O "usuarioLogado" NÃO ESTIVER VAZIO EXIBE O MENU
            if (!usuarioLogado.isEmpty()) { %>
                <a href="/livraria/admin/editora/listar.jsp">Editora</a> | 
                <a href="/livraria/admin/livro/listar.jsp">Livro</a> | 
                <a href="/livraria/admin/usuario/listar.jsp">Usuário</a>
            <%}%>
         </nav>
         <div class="login" style="float: right;">
            <%
            if (!usuarioLogado.isEmpty()) { %>
                Ola <%=usuarioLogado%>! | 
                <a href="/livraria/admin/logout.jsp"><img class="sair" src="/livraria/assets/img/logout.png"></a>
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

        // EXIBE A VARIAVEL "msg" DA SESSION CASO ELA NAO ESTEJA VAZIA
        if (!msg.isEmpty()) 
        {
            out.print(msg);
        }
        session.setAttribute("msg", "");
    %>