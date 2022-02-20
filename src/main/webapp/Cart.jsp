<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>
<%@page import ="java.sql.DatabaseMetaData" %>
<!-- END SERVLET FOR RETRIEVE CATEGORY -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style.css" rel="stylesheet">
</head>
<style>
</style>
<body>
	<%@include file="header.jsp"%><br>
	<div class="container">
		<h3 align="center">SHOPPING CART</h3>
		
		
	
	</div>
	
	<form action = "orderController" method = "post">	
	
	<hr>
	<div class="container">
	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">NAME</th>
					<th scope="col">CATEGORY</th>
					<th scope="col">PRICE</th>
					<th scope="col">QUANTITY</th>
					<th scope="col">ACTION</th>


				</tr>
			</thead>
			<tbody>

			<%
				String email = (String)session.getAttribute("sessionName");
				Connection connection = ConnectionManager.getConnection();
				DatabaseMetaData dbm = connection.getMetaData();
	            
	            ResultSet tables = dbm.getTables (null, null, "PRODCART",null );
	            
	            if(tables.next())
	            {
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM PRODUCT P JOIN PRODCART C ON P.PRODID=C.CARTID WHERE USERID=(select userId from customer where userEmail = '"+email+"')");
				while (resultSet.next()) {
				%>
				

				<tr>
					<td><%=resultSet.getString("PRODNAME")%></td>
					<td><%=resultSet.getString("PRODTYPE")%></td>
					<td><%=resultSet.getFloat("CARTPRICE")%></td>
					<td>
					<%=resultSet.getInt("CARTQTY")%>
					</td>
					<td>
           			 <a class="btn btn-danger" href="deleteCart.jsp?orderId=<%=resultSet.getInt("CARTID")%>" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
           			</td></tr>
					<input type="hidden" name="cartId" value=<%=resultSet.getInt("CARTID")%>>
					<input type="hidden" name="prodId" value=<%=resultSet.getInt("prodID")%>>
					<input type="hidden" name="userId" value=<%=resultSet.getInt("USERID")%>>
					<input type="hidden" name="prodPrice" value=<%=resultSet.getDouble("PRODPRICE")%>>
					<input type="hidden" name="cartPrice" value=<%=resultSet.getDouble("CARTPRICE")%>>
					<input type="hidden" name="qty" value=<%=resultSet.getInt("CARTQTY")%>>
					<input type="hidden" name="size" value=<%=resultSet.getString("PRODDETAILS")%>>
					
		 	
				<%
				}}
	            else
	            {
				%>
				<label>CART IS EMPTY</label><%} %>
			</tbody>
		</table>
			<button type = "submit" class="btn btn-primary">CHECKOUT</button>
				

	</div>	
	</form>
<script>
		function increment() {
			document.getElementById('demoInput').stepUp();
		}
		function decrement() {
			document.getElementById('demoInput').stepDown();
		}
</script>
</body>
</html>