<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SẢN PHẨM</title>
</head>
<body>
	<c:if test="${message!=null}">
		<span>${message}</span>
	</c:if>
	<c:if test="${error!=null}">
		<span>${error}</span>
	</c:if>

	<a href='<c:url value= "/product/admin-insertpro"/> '>Add product</a>
	<table border="1" style="width: 100%">

		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>desc</td>
			<td>price</td>
			<td>imageLink</td>
			<td>CategoryID</td>
			<td>Amount</td>
			<td>Stoke</td>
			<td>Action</td>
		</tr>
		<tbody>
			<c:forEach var="item" items="${listpro}">
				<tr>
					<td>${item.productID}</td>
					<td>${item.productName}</td>
					<td>${item.desc}</td>
					<td>${item.price}</td>
					<td>${item.imageLink}</td>
					<td>${item.categoryID}</td>
					<td>${item.amount}</td>
					<td>${item.stoke}</td>

					<td><a
						href='<c:url value="/product/update?id=${item.productID}" /> '>Update</a>
						|| <a
						href='<c:url value="/product/delete?id=${item.productID}" /> '>Delete</a>
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
</body>
</html>