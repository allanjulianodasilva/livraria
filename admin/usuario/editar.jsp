<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

String usuario= "";
String senha = "";

int id = Integer.valueOf(request.getParameter("id"));
    try {
        String query = "SELECT * FROM usuario WHERE id = "+id;
        
        Statement stmt = conn.createStatement(
                                  ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_UPDATABLE);
        
        ResultSet rs = stmt.executeQuery(query);
        if (rs.first()) {
            usuario = rs.rs.getString("usuario");
            senha = rs.getString("senha");
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
        <label for="nome">Nome da Editora:</label><input type="text" id="nome" name="nome" value='<%=nome%>'' required>
        <input type="hidden" name="id" value='<%=id%>'' required><br><br>

        <input type="submit" value="Adicionar">
    </form>
    <%@ include file="../../rodape.jsp" %>
