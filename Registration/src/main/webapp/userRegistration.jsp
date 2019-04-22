<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://db:3306/softeng","root", "password");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into USERS(first_name, last_name, username, password, question, answer, regdate) values ('" + firstName + "','"
    + lastName + "','" + userName + "','" + password + "','" + question + "','" + answer + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>