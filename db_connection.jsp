<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/livraria";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);
        session.setAttribute("conn", conn);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
