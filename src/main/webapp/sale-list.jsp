<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jdc.shop.model.entity.Voucher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sale History</title>
</head>
<body>
	<h1>Sale History</h1>
	<hr />
	<p>
		<a href="index.jsp">Back</a>
	</p>
	<hr />
	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>
	<%
	@SuppressWarnings("unchecked")
	List<Voucher> list = (List<Voucher>) request.getAttribute("data");
	%>
	<table>
		<thead>
			<tr>
				<td>Voucher ID</td>
				<td>Sale Date Time</td>
				<td>Customer Name</td>
				<td>Item Count</td>
				<td>Sale Total</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (Voucher v : list) {
			%>
			<tr>
				<td><a href="sale-details?id=<%=v.getId()%>"> <%=v.getId()%></a></td>
				<td><%=formatDateTime(v.getSaleTime())%></td>
				<td><%=v.getCustomer()%></td>
				<td><%=v.itemCount()%></td>
				<td><%=v.total()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>