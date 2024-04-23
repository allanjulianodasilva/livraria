<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    int id = Integer.valueOf(request.getParameter("id"));

    try {
        String query = "DELETE FROM editora WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        int i = pstmt.executeUpdate();
        pstmt.close();
        if (i == 1){
            session.setAttribute("msg", "Registro excluido com sucesso");
        }
        else {
            session.setAttribute("msg", "Nao foi possivel excluir o registro");
        }
        response.sendRedirect("listar.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
%>

