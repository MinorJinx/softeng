<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body style="text-align:center; background-color:silver;"><br><br>
        <% if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) { %>

        <p>You are not logged in<p>
        <p><a href="index.jsp">Please Login</a></p>
        
        <% } else { %>
        <p>Welcome <%=session.getAttribute("userid")%></p>
        <p><a href='logout.jsp'>Log out</a></p>
        <% } %>
    </body>
</html>