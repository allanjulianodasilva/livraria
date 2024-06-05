<%@ include file="../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

    <h2>Lista de Usuários</h2>
    <table class="table-usuario">
        <tr>
            <th>usuario</th>
            <th colspan="2"><a href="cadastrar.jsp"><img class="acao" src="/livraria/assets/img/add.png"></a></th>
        </tr>
    
    <%
    try {
        // preparando a String SQL para buscar lista de dados no para o banco
        String query = "SELECT * FROM usuario";
        Statement pstmt = conn.createStatement();
        ResultSet rs = pstmt.executeQuery(query);

        //  inserindo as linhas na tabela
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td class="acao">
                    <a href='editar.jsp?id=<%= rs.getString("id")%>'>
                        <img class="acao" src="/livraria/assets/img/edit.png">
                    </a>
                </td>
                <td class="acao">
                    <a 
                        href="javascript:func()" 
                        onclick="confirmacao('<%= rs.getString("id")%>')">
                            <img class="acao" src="/livraria/assets/img/delete.png">
                    </a>
                </td>
            </tr>
            <%
        }
        // fechando o resultSet
        rs.close();
        // fechando a conexao
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    %>
</table>
<%@ include file="../../rodape.jsp" %>
