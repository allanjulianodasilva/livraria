<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

String username= "";
String senha = "";
Boolean isadmin = false;

int id = Integer.valueOf(request.getParameter("id"));
    try {
        String query = "SELECT * FROM usuario WHERE id = "+id;
        
        Statement stmt = conn.createStatement(
                                  ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_UPDATABLE);
        
        ResultSet rs = stmt.executeQuery(query);
        if (rs.first()) {
            username = rs.getString("username");
            senha = rs.getString("senha");
            isadmin = rs.getBoolean("isadmin");
        }
        else {
            out.print("8");
        }
        rs.close();
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

    <h2>Editar Editora</h2>
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
            <label for="isadmin">É admin:</label>
            <select name="isadmin">
                <option value='0' <% if (!isadmin) { %>selected='selected' <%} %>>Não</option>
                <option value='1' <% if (isadmin) { %>selected='selected' <%} %>>Sim</option>
            </select><br>
        </div>
        <div class="form_linha">
            <input type="submit" value="Adicionar">
        </div>
    </form>
    <%@ include file="../../rodape.jsp" %>
