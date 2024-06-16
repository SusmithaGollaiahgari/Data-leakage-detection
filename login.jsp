<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
         
	String userid=request.getParameter("loginID");
	String pass=request.getParameter("password");		
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from register where username='"+userid+"' AND password='"+pass+"'";
	System.out.println("1");
	try
	{
	   System.out.println("2");
	   con=databasecon.getconnection();
	 //Class.forName("com.mysql.jdbc.Driver");	
	//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataleakage","root","root");
		System.out.println("3");
	    st=con.createStatement();
		System.out.println("4");
	    rs=st.executeQuery(sql);
				System.out.println("5");
		if(userid.equalsIgnoreCase("distributor")&& pass.equalsIgnoreCase("distributor"))
		{
		session.setAttribute( "username", userid );
				System.out.println("6");
		 %>
			<jsp:forward page="distributorhome.jsp"/>
	    	<%
			 System.out.println("hhhh  8");
		}
	    if(rs.next())
	     {
					System.out.println("7");
		 session.setAttribute( "username", userid );
		 		System.out.println("8");
		 %>	
		<jsp:forward page="agenthome.jsp"/>
	    	<%
	             		    
	    }
		
	  out.println("Login Error-please check ur ID and password");
	}
	catch(SQLException e1)
	{
		
		System.out.println(e1);
	
	 }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
             </form>
       </body> 	
</html>