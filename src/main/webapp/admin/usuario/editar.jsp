<%@ include file="../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

// criando e inicializando as variaveis
String username= "";
String senha = "";

int id = Integer.valueOf(request.getParameter("id"));
    try {
        // preparando a String SQL para envio para o banco de dados
        String query = "SELECT * FROM usuario WHERE id = "+id;
        Statement stmt = conn.createStatement(
                                  ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_UPDATABLE);
        
        // executando a SQL e recuperando o resultado 1 = sucesso  e 0 = erro
        ResultSet rs = stmt.executeQuery(query);

        // preenchendo as variaveis com os dados do banco de dados
        if (rs.first()) {
            username = rs.getString("username");
            senha = rs.getString("senha");
        }
        else {
            out.print("8");
        }

        // fechando a conexao
        rs.close();
        stmt.close();
    } catch (SQLException e) {
        // imprimindo o erro para debug
        e.printStackTrace();
        // out.print(e);
    }
%>

<h2>Editar Editora</h2>
<%-- montando o formulário --%>
<form action="processar_editar.jsp" method="post">
    <input type="hidden" name="id" value='<%=id%>' required>
    <div class="form_linha">
        <label for="username">usuario:</label>
        <input type="text" id="username" name="username" value='<%=username%>' required>
    </div>
    <div class="form_linha">
        <label for="senha">senha:</label>
        <input type="password" id="senha" name="senha" value='<%=senha%>' required>
    </div>
    <div class="form_linha">
        <input type="submit" value="Salvar">
    </div>
</form>
<%@ include file="../../rodape.jsp" %>
