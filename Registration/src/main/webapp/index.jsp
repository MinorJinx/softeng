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
    Connection cn = null;
	ResultSet rs = null;
    java.sql.Connection con1;
    Class.forName("com.mysql.jdbc.Driver");
    cn = DriverManager.getConnection("jdbc:mysql://db:3306/", "root", "password");
    String dbName = "softeng";
    
    if(cn != null){	
		rs = cn.getMetaData().getCatalogs();

		while(rs.next()){
			String catalogs = rs.getString(1);
			
			if(dbName.equals(catalogs)){
				System.out.println("the database "+dbName+" exists");
			}
			else{
        	    Statement s1 = cn.createStatement();
                int Result1 = s1.executeUpdate("CREATE DATABASE IF NOT EXISTS "+dbName);
                Statement s2 = cn.createStatement();
                int Result2 = s2.executeUpdate("CREATE TABLE IF NOT EXISTS softeng.`USERS` (`id` INT(10) NOT NULL AUTO_INCREMENT,`first_name` VARCHAR(45) NOT NULL,`last_name` VARCHAR(45) NOT NULL,`username` VARCHAR(45) NOT NULL,`password` VARCHAR(45) NOT NULL,`question` VARCHAR(45) NOT NULL,`answer` VARCHAR(45) NOT NULL,`regdate` DATE NOT NULL,PRIMARY KEY (`id`));");
        	}
		}
	}
%>
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
