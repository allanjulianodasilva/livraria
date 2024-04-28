<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

String titulo = "";
String autor = "";
int editora = 0;
String foto = "";

int id = Integer.valueOf(request.getParameter("id"));
    try {
        String query = "SELECT * FROM livro WHERE id = "+id;
        
        Statement stmt = conn.createStatement(
                                  ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_UPDATABLE);
        
        ResultSet rs = stmt.executeQuery(query);
        if (rs.first()) {
            id = rs.getInt("id");
            titulo = rs.getString("titulo");
            autor = rs.getString("autor");
            editora = rs.getInt("editora_id");
            foto = rs.getString("foto");
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

    <h2>Editar livro</h2>
    <form action="processar_editar.jsp" method="post">
        <input type="hidden" name="id" value='<%=id%>'' required><br><br>

        <label for="titulo">titulo:</label>
        <input type="text" id="titulo" name="titulo" value='<%=titulo%>'' required><br>
        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" value='<%=autor%>'' required><br>
        <label for="editora">Editora:</label>
        <select name="editora">

        
        <%
        try {
            String query = "SELECT * FROM editora";
            Statement pstmt = conn.createStatement();
            ResultSet rs = pstmt.executeQuery(query);
            while (rs.next()) {
                int editora_id = Integer.valueOf(rs.getString("id"));
                %>
                <option value='<%= rs.getString("id") %>' 
                    <% if (editora_id == editora) { %>selected='selected' <%} %> ><%= rs.getString("nome") %></option>
                <%
            }
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        %>
    </select><br>
        <label for="foto">Foto:</label>
        <input type="text" id="foto" name="foto" value='<%=foto%>'' required><br>

        <input type="submit" value="Salvar">
    </form>
    <%@ include file="../../rodape.jsp" %>
