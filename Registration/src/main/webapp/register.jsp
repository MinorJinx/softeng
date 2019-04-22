<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup</title>
    </head>
    <body style="text-align:center; background-color:silver;"><br><br>
        <form method="post" action="userRegistration.jsp">
            <table border="1" width="30%" align="center" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Register Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="userName" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="confimpw" value="" required="required"/></td>
                    </tr>
                    <tr>
                        <td>Security Question</td>
                        <td>
                            <select style="width:100%; max-width:75%;" type="text" name="question" required="required">
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
                        <td colspan="2">
                            <input type="submit" value="Submit"/>
                            <input type="reset" value="Reset"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Already Registered?  <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>