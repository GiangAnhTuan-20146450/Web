<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CẬP NHẬT</title>
</head>
<body>
	<form action="update" method="post">
			<label>ID:</label>
			<input type="text" name="cateID" value="${cate.cateID}" readonly="readonly"><br>
			<label>Nhap category name:</label>
			<input type="text" name="cateName" value="${cate.cateName}"><br>
			<label>Nhap link icon:</label>
			<input type="text" name="images" value="${cate.image}"><br>
			
			<input type="submit" value="Update">
	
	</form>

</body>
</html>