<%@ page import="java.sql.*" %>
<%@ include file="../../db_connection.jsp" %>
<%
    // Recuperando os parâmetros do formulário
    int id = Integer.valueOf(request.getParameter("id"));
    String titulo = request.getParameter("titulo");
    String autor = request.getParameter("autor");
    int editora_id = Integer.valueOf(request.getParameter("editora"));
    String foto = request.getParameter("foto");

    try {
        String query = "UPDATE  livro SET titulo = ?, autor = ?, editora_id = ?, foto = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, titulo);
        pstmt.setString(2, autor);
        pstmt.setInt(3, editora_id);
        pstmt.setString(4, foto);
        pstmt.setInt(5, id);
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

