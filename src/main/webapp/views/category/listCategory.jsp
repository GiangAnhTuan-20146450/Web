<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DANH MỤC</title>
</head>
<body>
	<c:if test="${message!=null}">
		<span>${message}</span>
	</c:if>
	<c:if test="${error!=null}">
		<span>${error}</span>
	</c:if>
	<table border="1" style="width: 100%">

		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>Icon</td>
			<td>Action</td>
		</tr>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.cateID}</td>
					<td><a
						href='<c:url value="/findprobycate?cateid=${item.cateID}" /> '>${item.cateName}</a></td>
					<td>${item.image}</td>
					<td><a
						href='<c:url value="/category/update?id=${item.cateID}" /> '>Update</a>
						|| <a 
						href='<c:url value="/category/delete?id=${item.cateID}" /> '>Delete</a>
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
</body>
</html>