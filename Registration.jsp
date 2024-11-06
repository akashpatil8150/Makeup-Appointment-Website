<%-- 
    Document   : Registration
    Created on : 24 Feb, 2024, 3:09:44 AM
    Author     : vaibhav
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Academy</title>
    </head>
    <body>
               <%
try {
     
    

    
                String name =request.getParameter("t1");
        	String email=request.getParameter("t2");
        	String phoneno=request.getParameter("t3");
                String pass=request.getParameter("t4");
                session.setAttribute("uname", name);

               
        	Class.forName("org.apache.derby.jdbc.ClientDriver");
        	Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
        	
            	PreparedStatement ps = c.prepareStatement("insert into registration values(?,?,?,?)");
            	ps.setString(1, name);
            	ps.setString(2, email);
            	ps.setString(3, phoneno);
                ps.setString(4, pass);
             
                
            	int i= ps.executeUpdate();
            	if(i>0){%>
                	<jsp:forward page="SkillAcademyMenu.html" /><%
                }
                else{
                	%>
                	<jsp:forward page="SignupPage.html" /><%
        	}
                

}
catch(Exception e)
{ out.println(e);
}
%>

    </body>
</html>
