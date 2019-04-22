<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body style="text-align:center; background-color:silver;"><br><br>
        <form method="post">
            <fieldset style="width: 300px; margin: auto;">
                <legend>Login to App</legend>
                <table width="30%" cellpadding="3">
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required="required"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name = "a" value="Login"/></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td colspan="2"><a href="reset.jsp">Forgot your password?</a></td>
                    </tr>
                    <tr>
                        <td colspan="2">New User <a href="register.jsp">Register Here</a></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </body>
</html><br>
<%@ page import="java.sql.*"%>
<%
    String uname = request.getParameter("username");
    String pword = request.getParameter("password");
    String chk = request.getParameter("a");
    ResultSet theResult=null;
    if("Login".equalsIgnoreCase(chk)){
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://db:3306/softeng", "root", "password");
        
        PreparedStatement pstatement = null;
        int updateQuery = 0;
        
        String queryString = "SELECT * FROM USERS WHERE username = ? and password = ?";
        
        pstatement = con.prepareStatement(queryString);
        pstatement.setString(1, uname);
        pstatement.setString(2, pword);
        System.out.println(queryString);
        theResult = pstatement.executeQuery();
        
        if (theResult.next()) {
            session.setAttribute("userid", uname);
            response.sendRedirect("success.jsp");
        } else {
            out.println("Login Failed");
        }
    }
%>