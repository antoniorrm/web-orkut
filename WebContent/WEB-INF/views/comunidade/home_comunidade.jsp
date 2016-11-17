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
<link rel="icon" href="http://app.e-orkut.com/favicon.ico">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="./Orkut - entrar_files/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<title>Orcut - início</title>

<link href="./Orkut - início_files/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/styles/screen.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/styles/non-responsive.css"
	rel="stylesheet">
<link rel="stylesheet" href="./Orkut - início_files/chat.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/styles/font-awesome.min.css">
<!--[if lt IE 9]><script src="http://app.e-orkut.com/assets/bootstrap/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	function onFileSelected(event) {
		var selectedFile = event.target.files[0];
		var reader = new FileReader();

		var imgtag = document.getElementById("myimage");
		imgtag.title = selectedFile.name;

		reader.onload = function(event) {
			imgtag.src = event.target.result;
			imgtag.Width = "50";
			imgtag.height = "50";
		};
		reader.readAsDataURL(selectedFile);
	}
</script>
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
				<form action="" method="GET"
					class="collapse navbar-collapse navbar-form navbar-right"
					role="search">
					<input type="text" name="q" value="" placeholder="pesquisa"
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


	<div class="container-fluid conteudo">
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-lg-2">
				<div class="modulo">
					<div id="perfil">
						<a href=""> <img
							src="<c:url value="/resources/images/${comunidade.getImagem() }" />"
							alt="${comunidade.getImagem() }">
						</a>
						<p class="nome">
							<a href="">${comunidade.getNome() }</a>
						</p>
						<p class="informacoes">(${comunidade.getUsuarios().size() }
							membros)</p>
						<hr>
						<p>
							<a href="" class="icone icon-editar-perfil">editar comunidade</a>
						</p>
						<hr>
						<ul class="navegacao">
							<li><a href="http://app.e-orkut.com/comunidade/forum/20939"
								class="icone icon-forum">fórum</a></li>
							<li><a href="listarUsuariosComunidades"
								class="icone icon-usuarios">membros</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-sm-6 col-lg-6 nopadding-xs">
				<div class="modulo border-radius-top-right-60">
					<div id="painel-principal">
						<h1>${comunidade.getNome() }</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a
								href="comunidades" class="underline">Comunidades</a> &gt;
							${comunidade.getNome() }
						</p>
						<br>
						<table width="100%">
							<tr>
								<th valign="top" width="25%">Nome:</th>
								<td width="75%">
									<p>${comunidade.getNome() }</p>
								</td>
							</tr>
							<tr>
								<th valign="top" width="25%">categoria:</th>
								<td width="75%">${comunidade.getCategoria().getNome() }</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modulo">
					<div id="forum-simples">
						<h1>fórum</h1>
						<table width="100%">
							<tr>
								<th width="7%">&nbsp;</th>
								<th width="53%">tópico</th>
								<th width="15%">postagens</th>
							</tr>
							<tr>
								<td colspan="4">
									<p class="text-empty">Nenhum tópico encontrado.</p>
								</td>
							</tr>
						</table>
						<hr>
						<p>
							<a href="http://app.e-orkut.com/comunidade/novotopico/20939"
								class="btn-orkut">criar tópico</a> <a href="javascript:void(0);"
								class="btn-orkut">reportar spam</a> <a
								href="http://app.e-orkut.com/comunidade/forum/20939"
								class="underline pull-right">ver todos os tópicos</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-xs-4 col-sm-4 col-lg-4">
				<div class="modulo">
					<div id="membros-simples">
						<h1>
							membros <a href="http://app.e-orkut.com/comunidade/membros/20939">(${comunidade.getUsuarios().size() })</a>
						</h1>
						<div class="row nopadding">
							<c:forEach var="usua" items="${usuarios }">
								<div class="col-xs-4 col-sm-4 col-lg-4 nopadding">
									<div class="perfil">
										<a href="http://app.e-orkut.com/perfil/id/671965"> <img
											src="<c:url value="/resources/images/${usua.getAvatar() }" />"
											alt="${usua.getAvatar()}">
										</a>
										<p>
											<a href="http://app.e-orkut.com/perfil/id/671965">
												${usua.getNome() } </a>
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<hr>
						<p>
							<a href="http://app.e-orkut.com/comunidade/membros/20939"
								class="underline">ver todos</a>
						</p>
					</div>
				</div>
				<div class="modulo">
					<div id="comunidades-simples">
						<h1>comunidades relacionadas</h1>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
								<p class="text-empty">Nenhuma comunidade encontrada.</p>
							</div>
						</div>
						<hr>
						<p>
							<a href="http://app.e-orkut.com/comunidade/buscar/20939"
								class="btn-orkut">gerenciar</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-12 col-sm-12 col-lg-12">
		<div class="rodape text-center">
			<p>©2016 Orcut</p>
		</div>
	</div>
</body>
</html>