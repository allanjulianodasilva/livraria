<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../topo.jsp" %>

    <h2>Lista de livros</h2><a href="cadastrar.jsp">nova</a>
    <table class="table-livro">
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Editora</th>
            <th>Foto</th>
            <th colspan="2"><a href="cadastrar.jsp"><img class="acao" src="/livraria/assets/img/add.png"></a></th>
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
                <td class="livroCapa">
                    <%
                    out.print("<img  src='/livraria/carregadorImagem?id=" + rs.getString("foto") + "' />");
                    %>
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
