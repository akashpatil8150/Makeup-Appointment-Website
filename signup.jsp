<%-- 
    Document   : signup
    Created on : 25 Feb, 2024, 11:56:24 PM
    Author     : adars
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Luxify</title>
    </head>
    <body>
        <%
             try {
        String name = request.getParameter("t1");
        String email = request.getParameter("t2");
        String password = request.getParameter("t3");
        session.setAttribute("uname", name);

        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample [app on APP]");

        PreparedStatement ps = c.prepareStatement("insert into users values(?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);

        int i = ps.executeUpdate();
        if (i > 0) {
            out.println("DATA SAVE");
        } else {
            out.println("Refresh page and try again!");
        }
    } catch (Exception e) {
        out.println(e);
    }
    %>
</body>
</html>
    </body>
</html>