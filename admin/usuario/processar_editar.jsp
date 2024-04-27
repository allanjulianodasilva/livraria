<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    int id = Integer.valueOf(request.getParameter("id"));
    String username = request.getParameter("username");
    String senha = request.getParameter("senha");
    Boolean isadmin = request.getParameter("isadmin") == "0" ? false : true;

    try {
        String query = "UPDATE  usuario SET username = ?, senha = ?, isadmin = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, senha);
        pstmt.setBoolean(3, isadmin);
        pstmt.setInt(4, id);
        int i = pstmt.executeUpdate();
        out.print(i);
        pstmt.close();
        if (i == 1){
            session.setAttribute("msg", "Sucesso ao editar o registro");
            response.sendRedirect("listar.jsp");
        }
        else {
            session.setAttribute("msg", "Nao foi possivel editar o registro");
            response.sendRedirect("editar.jsp?id="+id);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.print(e);
    }
    
%>

