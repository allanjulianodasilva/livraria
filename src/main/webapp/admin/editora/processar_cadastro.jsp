<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    String nome = request.getParameter("nome");

    try {
        String query = "INSERT INTO editora (nome) VALUES (?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, nome);
        int i = pstmt.executeUpdate();
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
        e.printStackTrace();
    }
    
%>

