<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jdc.shop.model.entity.Voucher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sale Details</title>
</head>
<body>

	<%
	Voucher voucher = (Voucher) request.getAttribute("data");
	%>
	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>
	<h1>Sale Details</h1>
	<hr />
	<p>
		<a href="index.jsp">Back</a>
	</p>
	<hr />
	<table>
		<tr>
			<td>Voucher Id</td>
			<td><%=voucher.getId()%></td>
		</tr>
		<tr>
			<td>Customer Name</td>
			<td><%=voucher.getCustomer()%></td>
		</tr>
		<tr>
			<td>Sale Date Time</td>
			<td><%=formatDateTime(voucher.getSaleTime())%></td>
		</tr>
	</table>
	<h3>Sale Items</h3>
	<table>
		<thead>
			<tr>
				<td>Product</td>
				<td>Category</td>
				<td>Unit Price</td>
				<td>Qty</td>
				<td>Total</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (SaleItem item : voucher.getSales()) {
			%>
			<tr>
				<td><%=item.getProduct().getName()%></td>
				<td><%=item.getProduct().getCategoty()%></td>
				<td><%=item.getProduct().getPrice()%></td>
				<td><%=item.getCount()%></td>
				<td><%=item.getTotal()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>