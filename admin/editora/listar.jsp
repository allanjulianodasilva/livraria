<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>

    <h2>Listado de Editoras</h2><a href="cadastrar.jsp">nova</a>
    <table class="table-livro">
        <tr>
            <th>nome</th>
            <th></th>
            <th></th>
        </tr>
    
    <%
    String query = "SELECT * FROM editora";
    try {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nome") %></td>
                <td><a href="editar.jsp">editar</a></td>
                <td><a href='excluir.jsp?id=<%= rs.getString("id")%>'>excluir</a></td>
            </tr>
            <%
        }
        rs.close();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    %>
</table>
<%@ include file="../../rodape.jsp" %>
