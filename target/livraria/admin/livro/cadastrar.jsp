<%@ include file="../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

    <h2>Adicionar Editora</h2>
    <form action="processar_cadastro.jsp"  method="post" enctype="multipart/form-data">
        <label for="titulo">titulo:</label>
        <input type="text" id="titulo" name="titulo" required><br>
        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br>
        <label for="editora">Editora:</label>
        <select name="editora">
            <%
            try {
                String query = "SELECT * FROM editora";
                Statement pstmt = conn.createStatement();
                ResultSet rs = pstmt.executeQuery(query);
                while (rs.next()) {
                    %>
                    <option value='<%= rs.getString("id") %>'><%= rs.getString("nome") %></option>
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
        <input type="file" name="file[]" /><br>
        <input type="submit" value="Salvar">
    </form>
<%@ include file="../../rodape.jsp" %>
