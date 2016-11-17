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
			<div class="col-xs-12 col-sm-12 col-lg-12 nopadding-xs">
				<div class="modulo">
					<div id="criar-comunidade">
						<h1>Criar comunidade</h1>
						<p class="navegacao-estrutural">
							<a href="http://app.e-orkut.com/home" class="underline">Início</a>
							&gt; <a href="http://app.e-orkut.com/comunidades"
								class="underline">Comunidades</a> &gt; Criar comunidade
						</p>
						<hr>
						<form action="addComunidade"
							method="post" accept-charset="utf-8"
							enctype="multipart/form-data">
							<div style="display: none">
								<input type="hidden" name="posttoken"
									value="188fa096d45167fb050f8dc1713efd93" />
							</div>
							<div class="table-responsive">
								<table class="table" width="100%">
									<tr>
										<th width="20%">nome:</th>
										<td width="80%"><input type="text" name="nome" size="80"
											value=""></td>
									</tr>
									<tr>
										<th>categoria:</th>
										<td>
											<select name="id">
													<option value="">selecione</option>
													<c:forEach var="categoria" items="${categorias }">
													<option value="${categoria.getCat_id() }">${categoria.getNome() }</option>
													</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>imagem:</th>
										<td><input type="file" name="image"></td>
									</tr>
							
								</table>
							</div>
							<hr>
							<p>
								<input type="submit" value="criar" class="btn-orkut"> <a
									href="home" class="btn-orkut">cancelar</a>
							</p>
						</form>
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