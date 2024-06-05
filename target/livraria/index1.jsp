<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
	<h1>Hello World 1!</h1>
	<c:if test="${not empty msg}">
		<p>${msg}</p>
	</c:if>
	<form action="UploadDeArquivo"  method="post" enctype="multipart/form-data">
		<label for="foto">Foto:</label>
        <input type="file" id="foto" name="foto" required>
		<input type="submit" value="Enviar">
	</form>
</body>
</html>
