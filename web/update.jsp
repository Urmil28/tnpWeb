<%-- 
    Document   : signup
    Created on : 16 Mar, 2018, 9:06:40 PM
    Author     : shah
--%>


<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"
  import="javax.servlet.*,java.sql.*,java.io.* "%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body>
        <%
            response.setContentType("text/html");
            String roll = request.getParameter("RollNo");
            //String name = request.getParameter("Name");
            String address = request.getParameter("Address");
            String cgpa = request.getParameter("cgpa");
            String pass = request.getParameter("Pass");
            String redirectAcceptURL = "index.html";
            
            try{
            int uname;
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","password");  
            //here WebApp is database name, root is username and password
            String userRoll = (String)session.getAttribute("roll");
            //Check from databse
            Statement stmt=con.createStatement();
            //String log = (String)session.getAttribute("Logged");
            
            //if(log.equals("in")){
            stmt.executeUpdate("DELETE FROM details WHERE roll ="+roll);
            //}
            String name = (String)session.getAttribute("name");
            String query = "insert into login values ('"+roll+"','"+pass+"')";
            String query1 ="insert into details values ('"+roll+"', '"+name+"', '"+cgpa+"', '"+address+"')";
            stmt.executeUpdate(query1);
            stmt.executeUpdate(query);
            out.println(address);
            stmt.close();   
            con.close();
            }
            catch (Exception e){
                System.out.println(e);
            }
            
            response.sendRedirect(redirectAcceptURL);
            %>
    </body>
</html>
