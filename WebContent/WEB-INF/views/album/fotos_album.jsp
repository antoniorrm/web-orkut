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
						<a href="home"> <img
							src="<c:url value="/resources/images/${usuario.getAvatar() }" />"
							alt="${usuario.getAvatar()}"></a>
						<p class="nome">
							<a href="home">${usuario.getNome()}</a>
						</p>
						<p class="informacoes"></p>
						<hr>
						<p>
							<a href="http://app.e-orkut.com/perfil/editar"
								class="icone icon-editar-perfil">editar perfil</a>
						</p>
						<hr>
						<ul class="navegacao">
							<li><a href="addAlbumFormulario" class="icone icon-fotos">albuns</a></li>
							<li><a href="http://app.e-orkut.com/perfil/albuns/671965"
								class="icone icon-fotos">fotos</a></li>
						</ul>
						<hr>
						<ul class="navegacao">
							<li><a href="http://app.e-orkut.com/mensagens"
								class="icone icon-mensagens">mensagens</a></li>
						</ul>
					</div>
				</div>
			</div>


			<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-left-xs">
				<div class="modulo">
					<div id="nova-foto" class="table">
						<h1>carregar foto</h1>
						<p>
							Você pode fazer upload de arquivo JPG, GIF ou PNG (com 1MB no
							máximo e 1024x768).<br>Não carregue fotos que contenham
							imagens de personagens de desenho animado, pessoas famosas,
							nudez, trabalho artístico ou outro material protegido por
							direitos autorais.</>
						
						<form action="addFoto" method="POST" accept-charset="utf-8"
							enctype="multipart/form-data">
							<div style="display: none">
								<input type="hidden" name="id" value="${album.getAlbu_id() }">
							</div>
							<h1></h1>
							<table class="table-responsive" width="100%">
								<tr>
									<th valign="top" width="10%" align="right">selecionar
										foto:</th>
									<td width="90%"><img id="myimage" border="0" /> <input type="file"
										name="image" id="image" onchange="onFileSelected(event)" /></td>
								</tr>
								<tr>
									<th valign="top" align="right">legenda:</th>
									<td><input type="text" name="legenda" id="legenda" value=""
										maxlength="100"></td>
								</tr>
							</table>
							<hr>
							<input type="submit" value="carregar foto" class="btn-orkut">
						</form>
					</div>
				</div>

				<div class="modulo">
					<div id="fotos">
						<h1>${album.getTitulo() }(${album.getFotos().size() })</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a href="perfil"
								class="underline">${usuario.getNome() }</a> &gt; <a
								href="mostrarFotosAlbum?id=${album.getAlbu_id() }"
								class="underline">Fotos</a> &gt; ${album.getTitulo() }
						</p>
						<p>
							&nbsp; <span class="pull-right paginacao-simples"></span>
						</p>
						<hr>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
								${foto }
								<c:forEach var="fot" items="${fotos }">
									<div class='col-xs-4 col-sm-4 col-lg-4 nopadding'>
										<div class='foto'>
											<a href="mostrarFoto?id=${fot.getFot_id() }"> <img
												src="<c:url value="/resources/images/${fot.getImagem() }" />"
												alt="${fot.getImagem() }"></a>
											<p>
												<a href="mostrarFoto?id=${fot.getFot_id() }">${fot.getLegenda() }
													(${fot.getFot_id() })</a>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<hr>
					<p>
						&nbsp; <span class="pull-right paginacao-simples"></span>
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
	</div>

</body>
</html>