<%-- 
    Document   : login
    Created on : 24 Feb, 2024, 3:24:04 AM
    Author     : vaibhav
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Academy</title>
    </head>
    <body style="background-color: #FFB400">
        <%
try {           
                String name =request.getParameter("t4");
                session.setAttribute("uname", name);

        	String p=request.getParameter("t5");
                
        	Class.forName("org.apache.derby.jdbc.ClientDriver");
        	Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
            	PreparedStatement ps=c.prepareStatement("SELECT * FROM registration WHERE name=? AND pass=?");
                ps.setString(1,name);
                ps.setString(2,p);
                ResultSet rs=ps.executeQuery();
    if(rs.next()){
 HttpSession userSession = request.getSession(true);
 userSession.setAttribute("uname", name);
 response.sendRedirect("SkillAcademyMenu.html");
}else {
 out.println("<script>alert('Invalid username or password.'); "
 + "window.location.href='login.html';</script>");

 }

}
catch(Exception e)
{
out.println(e);
}
%>

    </body>
</html>
