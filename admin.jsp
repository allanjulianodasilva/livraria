<%@ include file="topo.jsp" %>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean isAdmin = false;
    try {
        String query = "SELECT * FROM usuario WHERE username=? AND senha=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            isAdmin = rs.getBoolean("isAdmin");
            session.setAttribute("isAdmin", isAdmin);
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if (isAdmin) {
        %>
        <!-- Página administrativa aqui -->
        <h1>Página Administrativa</h1>
        <p>Olá, <%= username %>!</p>
        <!-- Adicionar funcionalidades aqui -->
        <%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<%@ include file="rodape.jsp" %>
