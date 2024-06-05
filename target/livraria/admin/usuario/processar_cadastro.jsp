<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    try {
        // recuperando os parâmetros do formulário
        String username = request.getParameter("username");
        String senha = request.getParameter("senha");

        // preparando a String SQL para envio para o banco de dados
        String query = "INSERT INTO usuario (username,senha) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, senha);

        // executando a SQL e recuperando o resultado 1 = sucesso  e 0 = erro
        int i = pstmt.executeUpdate();

        // fechando a conexao
        pstmt.close();
        if (i == 1){
            session.setAttribute("msg", "Cadastro realizado com sucesso");
            response.sendRedirect("listar.jsp");
        }
        else {
            session.setAttribute("msg", "Nao foi possivel realizar o Cadastro");
            response.sendRedirect("cadastrar.jsp");
        }
    } catch (SQLException e) {
        // imprimindo o erro para debug
        e.printStackTrace();
        // out.print(e);
    }
    
%>

