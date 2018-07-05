<%-- 
    Document   : login
    Created on : 13 Mar, 2018, 3:00:27 AM
    Author     : shah
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"
     import="javax.servlet.*,java.sql.*,java.io.* "%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            response.setContentType("text/html");
            String roll = request.getParameter("RollNo");
            session.setAttribute("roll",roll);
            String pass = request.getParameter("Pass");
            String redirectBackURL = "index.html";
            String redirectAcceptURL = "StudentHP.jsp";
            try{
            int uname;
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","password");  
            //here WebApp is database name, root is username and password
            
            //Check from databse
            Statement stmt=con.createStatement();  
            ResultSet rs=stmt.executeQuery("select * from login");  
            
            while(rs.next()){
                if(rs.getString(1).equals(roll)){
                    if(rs.getString(1).equals(pass)){
                        response.sendRedirect(redirectAcceptURL);
                        //out.println("<a href = 'index.html'>Forgot password ?</a>");
                        return;
                    }
                        else
                    {
                        response.setContentType("text/html");
                        out.println("<a href = 'index.html'>Forgot password ?</a>");
                    }
                break;
                }
            }
            con.close();
            }
            catch (Exception e){
                System.out.println(e);
            }
            //response.sendRedirect(redirectBackURL);
            out.close();
            %>
    </body>
</html>

