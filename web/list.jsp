<%@page contentType="text/html" pageEncoding="UTF-8"
     import="javax.servlet.*,java.sql.*,java.io.* "%>
<html>
	<head>
            
        <style>
            table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        
        tr:nth-child(even) {
            background-color: #dddddd;
        }
        </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>	Training and Placement Cell </title>
    <link rel="stylesheet" href="main.css">
    </head>
    <body style="background-color:rgb(204, 255, 204);">

       <table>
            <tr>
                <th>Roll No</th>
                <th>SGPA</th>
                <th>Applied Date</th>
                <th>Technology interested</th>
            </tr>
         <%  
            response.setContentType("text/html");
            String min = request.getParameter("min");
            String max = request.getParameter("max");
            String c= request.getParameter("c");
            //out.println(min+" max= "+max);
            String roll="HI",applydate="HI",java="HI",python="HI",cpp="HI",cgpa="HI";
            try{
            
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","password");  
            //here WebApp is database name, root is username and password
            //Check from databse
            ResultSet rs =null;
            Statement stmt=con.createStatement();
            rs = stmt.executeQuery("select * from Application ");//where sgpa between "+ min +" and "+max +"and company_name="+c);
            rs.next();
                   roll = rs.getString("roll");
                    applydate = rs.getString("appdate");
                    java = rs.getString("java");
                    python = rs.getString("python");
                    cpp = rs.getString("cpp");
                    cgpa = rs.getString("sgpa");
                    if(java.contains("1"))
                        out.println("<tr><td>"+roll+"</td><td>"+cgpa+"</td><td>"+applydate+"</td><td>java</td></tr>");
                    //out.println(roll);
            //}
            //out.println("</table>");
            stmt.close();
            con.close();
            
            }
            catch (Exception e){
                System.out.println(e);
            }
            
            out.close();
            
            
            %>
hi</table></body></html>