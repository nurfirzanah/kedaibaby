<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href = "style.css" rel="stylesheet">
</head>
<style>
       
  </style>
<body>

<%@include file="header2.jsp" %><br>
	<h3 align="center">order list</h3>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">order id</th>
                <th scope="col">order date</th>
                <th scope="col">order status</th>
                <th scope="col">order price</th>
                <th scope="col">order quantity</th>
                <th scope="col">product id</th>
                <th scope="col">user id</th>
                <th scope="col"> ADDRESS </th>
                <th scope="col">ACTION</th>
            </tr>
        </thead>
        <tbody>
        <sql:setDataSource var = "snapshot" driver = "oracle.jdbc.driver.OracleDriver" url = "jdbc:oracle:thin:@localhost:1521:xe" user = "babyshop"  password = "system"/>
	<sql:query dataSource = "${snapshot}" var = "result">SELECT * from CUST_ORDER o join customer c on o.userId = c.userId  </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                 
                    <tr>
                            <th scope="row"><c:out value = "${row.orderID}"/></th>
                            <td><c:out value = "${row.orderDate}"/></td>
                            <td><c:out value = "${row.orderStatus}"/></td>
                            <td><c:out value = "${row.orderPrice}"/></td>
                            <td><c:out value = "${row.orderQty}"/></td>
                            <td><c:out value = "${row.prodID}"/></td>
                            <td><c:out value = "${row.userID}"/></td>
         					 <td><c:out value = "${row.userAddress}"/></td>
                            <td><button class="btn btn-primary"><a href="updateOrder.jsp?orderid=${row.orderID}" class="text-light">edit order</a></button><td>
                        </tr>
                   </c:forEach>
        </tbody>
      </table>


</body>
</html>