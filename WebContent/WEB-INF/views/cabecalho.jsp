<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Orkut a rede social do mundo, conheça o novo, conheça o orkut2!">
<meta name="keywords"
	content="orkut, orkut2, orkut 2, orkut entrar, novo orkut, orkut novo, orkut login, orkuti, orkute, id profile, idprofile, Orkut login, Orkut login entrar, orkut entrar agora, Entrar no orkut, Okut, Orkut Account login, Orkut sign in">
<meta http-equiv="Content-Language" content="pt-br, en">
<link rel="icon" href="http://app.e-orkut.com/favicon.ico">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<title>Orcut - início</title>

<link
	href="${pageContext.request.contextPath}/resources/styles/screen.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/styles/non-responsive.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/styles/font-awesome.min.css">
<!--[if lt IE 9]><script src="http://app.e-orkut.com/assets/bootstrap/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home"> <img
					src="${pageContext.request.contextPath}/resources/logo-orcut.png"
					style="max-height: 25px;" alt="Orcut">
				</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="home">Início</a></li>
					<li><a href="http://app.e-orkut.com/perfil/id/671965">Perfil</a></li>
					<li><a href="amigos">Amigos</a></li>
					<li><a href="comunidades">Comunidades</a></li>
				</ul>
				<form action="buscarUsuario" method="POST"
					class="collapse navbar-collapse navbar-form navbar-right"
					role="search">
					<input type="text" name="txt" value="" placeholder="pesquisa"
						class="input-pesquisar">
					<button type="submit" class="btn btn-orkut btn-xs">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><p class="navbar-text">&lt;${usuario.getEmail()}&gt;</p></li>
					<li><a href="logout">Sair</a></li>
				</ul>
			</div>
		</div>
	</nav>