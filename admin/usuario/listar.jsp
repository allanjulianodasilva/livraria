<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>

    <h2>Lista de usuarios</h2><a href="cadastrar.jsp">nova</a>
    <table class="table-usuario">
        <tr>
            <th>usuario</th>
            <th>senha</th>
            <th></th>
            <th></th>
        </tr>
    
    <%
    try {
        String query = "SELECT * FROM usuario";
        Statement pstmt = conn.createStatement();
        ResultSet rs = pstmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("senha") %></td>
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
