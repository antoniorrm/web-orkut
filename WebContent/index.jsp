<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="icon" href="http://e-orkut.com/favicon.ico">
<title>Orkut - entrar</title>

<!-- <link href="./Orkut - entrar_files/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="./Orkut - entrar_files/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link type="text/css" href="${pageContext.request.contextPath}/resources/styles/login.css" rel="stylesheet">

<!--[if lt IE 9]><script src="assets/bootstrap/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<div class="container-fluid login">
		<div class="row">
			<div class="col-xs-12 col-sm-9 col-lg-9">
				<div class="principal">
					<p>&nbsp;</p>
					<br> <img src="http://localhost:8080/web-orkut/resources/logo.png"
						class="logo" alt="Orcut">
					<p>
						<strong>Conecte-se</strong> com amigos e familiares usando recados
						e mensagens instantâneas
					</p>
					<p>
						<strong>Descubra</strong> novas pessoas através de amigos de
						amigos e comunidades
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-3 col-lg-3">
				<div class="entrar">
					<p>Entrar no Orcut com a sua conta orcut.</p>
					<form action="login"
						method="POST" class="form-horizontal">
						<div class="form-group">
							<label for="login"
								class="col-xs-12 col-sm-2 col-lg-2 control-label">Login</label>
							<div class="col-xs-12 col-sm-10 col-lg-10">
								<input type="text" name="login" class="form-control" id="login"
									value="" placeholder="Login">
							</div>
						</div>
						<div class="form-group">
							<label for="senha"
								class="col-xs-12 col-sm-2 col-lg-2 control-label">Senha</label>
							<div class="col-xs-12 col-sm-10 col-lg-10">
								<input type="password" name="senha" class="form-control"
									id="senha" placeholder="Senha">
							</div>
						</div>
						<div class="form-group">
							<div
								class="col-xs-12 col-sm-10 col-lg-10 col-sm-offset-2 col-lg-offset-2">
								<div class="checkbox">
									<label> <input type="checkbox"> Lembrar-me
										neste computador.
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div
								class="col-xs-12 col-sm-10 col-lg-10 col-sm-offset-2 col-lg-offset-2">
								<button type="submit" class="btn btn-default">Entrar</button>
							</div>
						</div>
					</form>
					<p class="text-center">
						<a href="http://e-orkut.com/autenticacao/esqueceusenha">Não
							consegue acessar sua conta?</a>
					</p>
				</div>
				<div class="cadastro">
					<p>Ainda não é membro?</p>
					<p>
						<a href="inserirUsuarioFormulario">ENTRE JÁ</a>
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-lg-12">
				<div class="rodape">
					<p>©2016 Orcut</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-lg-12 hidden-xs">
				<center></center>
			</div>
		</div>
	</div>


</body>
</html>