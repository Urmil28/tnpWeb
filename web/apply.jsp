<%-- 
    Document   : apply
    Created on : 21 Mar, 2018, 2:43:09 PM
    Author     : shah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
     import="javax.servlet.*,java.sql.*,java.io.* "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        
    <%
            response.setContentType("text/html");
            
            String userRoll = (String)session.getAttribute("roll");
            String cname = request.getParameter("company");
            String date = request.getParameter("date");
            String []tech = request.getParameterValues("type");
            String sgpa = request.getParameter("sgpa");
            
            String redirectBackURL = "StudentHP.html";
            String redirectAcceptURL = "StudentHP.html";
            
            //String tech="HI",="HI",roll="HI";
            //String a =request.getHeader("referer");
            int cls=0;
            try{
            int uname;
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","password");  
            //here WebApp is database name, root is username and password
            
            
            Statement stmt=con.createStatement();
            //create table application (roll varchar(100),company_name varchar(100),sgpa varchar(100), 
            //appdate date, java boolean, cpp boolean , python boolean, foreign key(roll) references login(roll));
            int j=0,c=0,p=0;
            if (tech[0].contains("Java"))
                j=1;
            if (tech[0].contains("Python"))
                p=1;
            if (tech[0].contains("Cpp"))
                c=1;
            String query = "insert into application values ('"+ userRoll +"','"+ cname +"','" +sgpa+ "','" +date+ "'," +j+ "," +c+ ","+p+")";
            
            
            stmt.executeUpdate(query);  
            out.println("<h3>Successfully submitted</h3>");
            out.println("<a href='StudentHP.jsp'>Back to Homepage</a>");
            response.sendRedirect(redirectAcceptURL);
            stmt.close();
            con.close();
            }
            catch (Exception e){
                out.println("<h1>ERROR</h1>");
                response.sendRedirect(redirectBackURL);
            }
        %>
    </body>
</html>
