<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    String username = request.getParameter("username");
    String senha = request.getParameter("senha");
    Boolean isadmin = request.getParameter("isadmin") == "0" ? false : true;

    try {
        String query = "INSERT INTO usuario (username,senha,isadmin) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, senha);
        pstmt.setBoolean(3, isadmin);
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

