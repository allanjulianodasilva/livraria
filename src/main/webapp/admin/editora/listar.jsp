<%@ include file="../topo.jsp" %>

    <h2>Listado de Editoras</h2>
    <table class="table-livro">
        <tr>
            <th>nome</th>
            <th colspan="2"><a href="cadastrar.jsp"><img class="acao" src="/livraria/assets/img/add.png"></a></th>
        </tr>
    
    <%
    try {
        String query = "SELECT * FROM editora";
        Statement pstmt = conn.createStatement();
        ResultSet rs = pstmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nome") %></td>
            </td>
            <td class="acao">
                <a href='editar.jsp?id=<%= rs.getString("id")%>'>
                    <img class="acao" src="/livraria/assets/img/edit.png">
                </a>
            </td>
            <td>
                <a 
                    href="#" 
                    onclick="confirmacao('<%= rs.getString("id")%>')">
                        <img class="acao" src="/livraria/assets/img/delete.png">
                </a>
            </td>
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
