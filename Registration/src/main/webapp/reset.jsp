<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
    </head>
    <body style="text-align:center; background-color:silver;"><br><br>
        <form method="post">
            <table border="1" width="30%" align="center" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Reset Your Password</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Old Password</td>
                        <td><input type="password" name="oldpass" required="required"/></td>
                    </tr>
                    <tr>
                        <td>New Password</td>
                        <td><input type="password" name="newpass" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="confimpw" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Security Question</td>
                        <td>
                            <select style="width:100%; max-width:50%;" type="text" name="question" required="required">
                                <option value="select" disabled selected>- Select One-</option>
                                <option value="pet">What was the name of your first pet?</option>
                                <option value="hospital">What was the name of the hospital where you were born?</option>
                                <option value="company">What was the name of the company where you had your first job?</option>
                                <option value="nickname">What was your childhood nickname?</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Answer</td>
                        <td><input type="answer" name="answer" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name = "a" value="Reset"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html><br>
<%@ page import="java.sql.*"%>
<%
    String uname = request.getParameter("username");
    String oldpword = request.getParameter("oldpass");
    String newpword = request.getParameter("newpass");
    String secq = request.getParameter("question");
    String answ = request.getParameter("answer");
    String chk = request.getParameter("a");
    ResultSet theResult=null;
    if("Reset".equalsIgnoreCase(chk)){
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://db:3306/softeng", "root", "password");
        
        PreparedStatement pstatement = null;
        int updateQuery = 0;
        
        String queryString = "SELECT * FROM USERS WHERE username = ? and password = ? and question = ? and answer = ?";
        
        pstatement = con.prepareStatement(queryString);
        pstatement.setString(1, uname);
        pstatement.setString(2, oldpword);
        pstatement.setString(3, secq);
        pstatement.setString(4, answ);
        System.out.println(queryString);
        theResult = pstatement.executeQuery();
        
        if (theResult.next()) {
            session.setAttribute("userid", uname);
            session.setAttribute("userpw", newpword);
            response.sendRedirect("userUpdate.jsp");
        } else {
            out.println("Reset Failed");
        }
    }
%>