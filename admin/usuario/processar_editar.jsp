<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    int id = Integer.valueOf(request.getParameter("usuario"));
    String nome = request.getParameter("senha");

    try {
        String query = "UPDATE  usuario SET nome = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, usuario);
        pstmt.setInt(2, senha);
        int i = pstmt.executeUpdate();
        out.print(i);
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

