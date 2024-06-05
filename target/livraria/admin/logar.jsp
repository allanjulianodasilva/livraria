<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db_connection.jsp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String usuarioLogado = "";
    try {
        String query = "SELECT * FROM usuario WHERE username=? AND senha=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            usuarioLogado = username;
            session.setAttribute("usuarioLogado", usuarioLogado);
        }
        rs.close();
        pstmt.close();
    } catch (SQLException e) {
        // imprimindo o erro para debug
        e.printStackTrace();
        out.print(e);
    }

    if (!usuarioLogado.isEmpty()) {
         response.sendRedirect("index.jsp");
    } else {
      
        out.print("aqui");
    }
%>
