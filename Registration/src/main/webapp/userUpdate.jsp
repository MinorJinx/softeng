<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged In</title>
    </head>
    <body style="text-align:center; background-color:silver;"><br><br>
        <p>
            <%@ page import="java.sql.*"%>
            <%
                String uname = (String)session.getAttribute("userid");
                String newpword = (String)session.getAttribute("userpw");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/softeng","root", "password");
                Statement st = con.createStatement();
                int i = st.executeUpdate("UPDATE USERS SET password='" + newpword + "'" + "WHERE username='" + uname + "';");
                if (i > 0) {
                    out.println("Reset Successful");
                } else {
                    out.println("Reset Failed");
                }
            %>
        </p>
        <p><a href="index.jsp">Please Login</a></p>
    </body>
</html>