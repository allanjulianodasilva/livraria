<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    int id = Integer.valueOf(request.getParameter("id"));
    String nome = request.getParameter("nome");

    try {
        String query = "UPDATE  editora SET nome = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, nome);
        pstmt.setInt(2, id);
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

