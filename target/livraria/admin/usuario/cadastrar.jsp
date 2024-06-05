<%@ include file="../topo.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

    <h2>Adicionar usuario</h2>
    <form action="processar_cadastro.jsp" method="post">
        <div class="form_linha">
            <label for="username">usuario:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form_linha">
            <label for="senha">senha:</label>
            <input type="password" id="senha" name="senha" required>
        </div>
        <div class="form_linha">
            <input type="submit" value="Salvar">
        </div>
    </form>
    <%@ include file="../../rodape.jsp" %>
