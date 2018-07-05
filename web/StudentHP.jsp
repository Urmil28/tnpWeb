<%@page contentType="text/html" pageEncoding="UTF-8"
     import="javax.servlet.*,java.sql.*,java.io.* "%>
<html>
	<head>
        
		<title>	Training and Placement Cell </title>
        <link rel="stylesheet" href="main.css">
	</head>
	<body style="background-color:rgb(204, 255, 204);">


	<div id ="Head"><br>
        <h1 align ="center">Training and Placement Cell </h1>   
		<div id="Bar" class="menu-bar">
        <nav id="header-menu" class="dropdown-menu-wrap" ><br>
		 <ul>
                        
             <b><li><a href="StudentHP.jsp">Home</a></li>
		     <li><a href="Application.html">Apply to Company</a></li>
		     <li><a href="contact.html">Contact Us</a></li>
                 <li><a href="AboutUs.html">About Us</a></li></b>
         </ul>
        </nav>
        
        	 </div>
        
		<br><br><br>

        </div>
        
         <%
            response.setContentType("text/html");
            
            String userRoll = (String)session.getAttribute("roll");
            session.setAttribute("Logged", "in");
            
            String pass = request.getParameter("Pass");
            String redirectBackURL = "index.html";
            String redirectAcceptURL = "StudentHP.html";
            String name="HI",address="HI",roll="HI",cgpa="HI";
            String a =request.getHeader("referer");
            int cls=0;
            try{
            int uname;
            
            
            
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebApp","root","password");  
            //here WebApp is database name, root is username and password
            
            //Check from databse
            Statement stmt=con.createStatement();  
            ResultSet rs=stmt.executeQuery("select * from details");  
             
            while(rs.next()){
                roll = rs.getString("roll");
                if(roll.equals(userRoll)){
                    name  = rs.getString("name");
                    address = rs.getString("address");
                    cls = Integer.parseInt(roll)/1000;
                    cgpa = rs.getString("cgpa");
                }
            }
            session.setAttribute("name",name);
            
            out.println("<nav id='Log' align><br><b>Hi, "+name+" </b> | <a href='/index.html'>LogOut</a>|</nav>");
            stmt.close();
            con.close();
            }
            catch (Exception e){
                System.out.println(e);
            }
            //response.sendRedirect(redirectBackURL);
            out.println("<div class='form' id='forminfo'>");
	    out.println(" <form><table id='tableLogin' align='center'>");
            out.println("<tr><td class='field-label'><label>Name :\t "+name+"</label></td><td></td></tr>");
            out.println("<tr><td class='field-label'><label>Address:\t"+address+"</label></td><td></td></tr>");
            out.println("<tr><td class='field-label'><label>Class:\t"+cls+"rd year</label></td><td></td></tr>");
            out.println("<tr><td class='field-label'><label>CGPA:\t"+cgpa+"</label></td><td></td></tr>");
            out.println("</table><a href='update.html'>Edit Basic Information</a></form></div></body></html>");
            out.close();
            %>
