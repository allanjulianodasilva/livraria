<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>

    <h2>Lista de livros</h2><a href="cadastrar.jsp">nova</a>
    <table class="table-livro">
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Editora</th>
            <th>Foto</th>
            <th></th>
            <th></th>
        </tr>
    
    <%
    try {
        String query = "SELECT l.*, e.nome FROM livro l join editora e on e.id=l.editora_id";
        Statement pstmt = conn.createStatement();
        ResultSet rs = pstmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("titulo") %></td>
                <td><%= rs.getString("autor") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("foto") %></td>
                <td><a href='editar.jsp?id=<%= rs.getString("id")%>'>editar</a></td>
                <td><a href='excluir.jsp?id=<%= rs.getString("id")%>'>excluir</a></td>
            </tr>
            <%
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    %>
</table>
<%@ include file="../../rodape.jsp" %>
