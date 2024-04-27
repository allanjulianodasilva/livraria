<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

    <h2>Lista de usuarios</h2>
    <table class="table-usuario">
        <tr>
            <th>usuario</th>
            <th>É Admin</th>
            <th colspan="2"><a href="cadastrar.jsp"><img class="acao" src="/livraria/assets/img/add.png"></a></th>
        </tr>
    
    <%
    try {
        String query = "SELECT * FROM usuario";
        Statement pstmt = conn.createStatement();
        ResultSet rs = pstmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getBoolean("isadmin") ? "Sim" : "Não" %></td>
                <td class="acao"><a href='editar.jsp?id=<%= rs.getString("id")%>'><img class="acao" src="/livraria/assets/img/edit.png"></a></td>
                <td class="acao"><a href='excluir.jsp?id=<%= rs.getString("id")%>'><img class="acao" src="/livraria/assets/img/delete.png"></a></td>
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
