<%int nivel = 2;%>
<%@ include file="../../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

    <h2>Adicionar usuario</h2>
    <form action="processar_cadastro.jsp" method="post">
        <label for="nome">usuario :</label>
        <input type="text" id="nome" name="nome" required><br><br>
        <input type="submit" value="Adicionar">
        <label for="nome">seha :</label>
        <input type="text" id="nome" name="nome" required><br><br>
        <input type="submit" value="Adicionar">
    </form>
    <%@ include file="../../rodape.jsp" %>
