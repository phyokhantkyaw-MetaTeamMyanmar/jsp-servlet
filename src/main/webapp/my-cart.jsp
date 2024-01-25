<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
</head>
<body>
	<h1>My Cart</h1>
	<hr />
	<p>
		<a href="index.jsp">Back</a>
	</p>
	<hr />
	<p>Item details in Shopping Cart.</p>
	<%
	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	%>
	<table>
		<tr>
			<td>Product</td>
			<td>Category</td>
			<td>Unit Price</td>
			<td></td>
			<td>Count</td>
			<td></td>
			<td>Total</td>
		</tr>
		<%
		for (SaleItem item : cart.items()) {
		%>
		<tr>
			<td><%=item.getProduct().getName()%></td>
			<td><%=item.getProduct().getCategoty()%></td>
			<td><%=item.getProduct().getPrice()%></td>
			<td><a href="cart-minus?product=<%=item.getProduct().getId()%>">-</a></td>
			<td><%=item.getCount()%> <a
				href="cart-plus?product=<%=item.getProduct().getId()%>">+</a></td>
			<td></td>
			<td><%=item.getTotal()%></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="3">Total</td>
			<td></td>
			<td><%=cart.itemCount()%></td>
			<td></td>
			<td><%=cart.total()%></td>
		</tr>
	</table>
	<hr />
	<h5>Check Out</h5>
	<form action="checkout" method="post">
		<label>Customer Name</label> <input type="text"
			placeHolder="Enter Customer Name" name="customer">
		<button type="submit">Check Out</button>
	</form>
</body>
</html>