<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="db_connection.jsp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean isAdmin = false;
    String usuarioLogado = "";
    try {
        String query = "SELECT * FROM usuario WHERE username=? AND senha=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            isAdmin = rs.getBoolean("isAdmin");
            usuarioLogado = username;
            session.setAttribute("isAdmin", isAdmin);
            session.setAttribute("usuarioLogado", usuarioLogado);
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if (!usuarioLogado.isEmpty()) {
        if (isAdmin) {
         response.sendRedirect("admin/index.jsp");
        }
        else {
            response.sendRedirect("privado/index.jsp");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
