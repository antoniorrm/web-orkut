<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
		crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
	<title>Listar Usuários</title>
		<style type="text/css">
	     .button{border-radius: 0px;}
	     .sh{box-shadow: 0px 0px 10px rgba(0,0,0,0.4);}
	</style>
</head>



<body>
	<div class="text-center container">
		<h2>Listar Usuários</h2>
	</div>
	<div class="container">
		<table class="table table-hover table-inverse sh">
			<thead>
				<tr>
					<th>Avatar</th>
					<th>ID</th>
					<th>Nome</th>
					<th>Login</th>
					<th>APAGAR</th>
					<th>ALTERAR</th>
				</tr>
			</thead>
			<c:forEach var="usuario" items="${usuarios}">
				<tbody>
					<tr>
						<td><img  width="50" height="50" src="<c:url value="/resources/images/${usuario.login }.png" />"/></td>
						<td>${usuario.id}</td>
						<td>${usuario.nome}</td>
						<td>${usuario.login}</td>
						<td><a class="btn btn-danger center-block button" href="apagarUsuario?id=${usuario.id}">APAGAR</a></td>
						<td><a class="btn btn-primary center-block button" href="alterarUsuarioFormulario?id=${usuario.id}">ALTERAR</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<a class="center-block btn btn-block btn-primary button" href="menu">Voltar</a>
	</div>
</body>
</html>