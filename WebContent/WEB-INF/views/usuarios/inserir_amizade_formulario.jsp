<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Inserir Amizades</title>
	<style type="text/css">
     .button{border-radius: 0px;}
     .sh{box-shadow: 0px 0px 10px rgba(0,0,0,0.4);}
	</style>
</head>
<body>
	<div class="text-center container">
		<h2>Inserir Amigos para ${usuario.nome} </h2>
	</div>
	<div class="container">
	<form action="inserirAmizade" id="contactForm" method="POST" role="form" enctype="multipart/form-data">
	
		<table class="table table-hover table-inverse sh">
			<thead>
				<tr>
					<th>Avatar</th>
					<th>ID</th>
					<th>Nome</th>					
				</tr>
			</thead>
			<c:forEach var="u" items="${potenciais_amigos}">
				<tbody>
					<tr>
						<td><img  width="50" height="50" src="<c:url value="/resources/images/${u.login }.png" />"/></td>
						<td>${u.id}</td>
						<td>${u.nome}</td>
						<td><form:checkbox path="amizade.amigos" value="${u.id }"/></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<button type="submit" class="center-block btn btn-block btn-success button">Adicionar Amigo</button>
		<a class="center-block btn btn-block btn-primary button" href="menu">Voltar</a>
	</form>
	</div>
</body>
</html>