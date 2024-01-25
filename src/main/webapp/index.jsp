<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@page import="com.jdc.shop.model.entity.Product"%>
<%@page import="com.jdc.shop.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listener Demo</title>
</head>
<body>

	<h1>Product List</h1>
	<p>
		Shopping Cart : <a href="cart-show"> <%
 ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
 %> <%=null == cart ? 0 : cart.itemCount()%>
		</a>
	</p>
	<%
	ProductModel model = (ProductModel) application.getAttribute("products");
	%>

	<%
	if (null != cart && cart.itemCount() > 0) {
	%>
	<a href="cart-clear">Clear Cart</a>
	<%
	}
	%>

	<table>
		<tr>
			<th>ID</th>
			<th>Category</th>
			<th>Name</th>
			<th>Price</th>
			<th>Add</th>
		</tr>
		<%
		for (int i = 0; i < model.getList().size(); i++) {
			Product p = model.getList().get(i);
		%>
		<tr>
			<td><%=p.getId()%></td>
			<td><%=p.getCategoty()%></td>
			<td><%=p.getName()%></td>
			<td><%=p.getPrice()%></td>
			<td><a href="cart-add?product=<%=p.getId()%>">Add to Cart</a></td>

		</tr>
		<%
		}
		%>

	</table>
	<p>
		<a href="sale-history">Sale History</a>
	</p>
</body>
</html>