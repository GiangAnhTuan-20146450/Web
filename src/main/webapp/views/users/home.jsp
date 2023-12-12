<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NVIDIA</title>
</head>
<body>
	<c:forEach var="item" items="${listpro}">
		<div style="border:1px solid black; padding: 10px">
			<a href='<c:url value="/detail?id=${item.productID}" /> '>${item.productName}</a>
			<br>
			<c:if test="${item.imageLink.substring(4)!='http'}">
				<img src='<c:url value="/image?fname=product/${item.imageLink}" />'
					alt="image1" width="300px">
			</c:if>
			<br>
			<c:if test="${item.imageLink.substring(4)=='http'}">
				<img src="${item.imageLink}" width="300px" alt="image">
			</c:if>
			<br>
			<p>Category: ${item.category.cateName}</p>
			<br>
			<p>Description: ${item.desc}</p>
			<br>
		</div>
	</c:forEach>
</body>
</html>