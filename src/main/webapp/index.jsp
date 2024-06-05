
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="topo.jsp" %>
    <%
    String search = request.getParameter("search") == null ? "" : request.getParameter("search");
    %>
    <form action="index.jsp" method="get">
        Pesquisar por Título: <input value="<%= search %>" type="text" name="search">
        <input type="submit" value="Pesquisar">
    </form><br>
    <table class="table-livro">
        <tr>
            <th>titulo</th>
            <th>autor</th>
            <th>editora</th> 
            <th>foto</th>
        </tr>
    
    <%
    String query = "SELECT l.*, e.nome FROM livro l join editora e on e.id=l.editora_id";
    if (search != null && !search.isEmpty()) {
        query += " WHERE titulo LIKE '%" + search + "%'";
    }
    try {
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("titulo") %></td>
                <td><%= rs.getString("autor") %></td>
                <td><%= rs.getString("nome") %></td>
                <td class="livroCapa">
                    <%
                    out.print("<img  src='/livraria/carregadorImagem?id=" + rs.getString("foto") + "' />");
                    %>
                </td>
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
<%@ include file="rodape.jsp" %>