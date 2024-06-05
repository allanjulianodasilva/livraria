<%@ include file="../../db_connection.jsp" %>
<%
    try {
        // recuperando os parâmetros do formulário
        int id = Integer.valueOf(request.getParameter("id"));
        String username = request.getParameter("username");
        String senha = request.getParameter("senha");

        // preparando a String SQL para envio para o banco de dados
        String query = "UPDATE  usuario SET username = ?, senha = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, senha);
        pstmt.setInt(3, id);

        // executando a SQL e recuperando o resultado 1 = sucesso  e 0 = erro
        int i = pstmt.executeUpdate();

        // fechando a conexao
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
        // imprimindo o erro para debug
        e.printStackTrace();
        // out.print(e);
    }
    
%>

