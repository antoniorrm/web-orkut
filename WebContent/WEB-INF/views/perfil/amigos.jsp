<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
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
				<div id="amigos">
					<h1>Amigos (${usuario.getAmizades().size()  })</h1>
					<p class="navegacao-estrutural">
						<a href="home" class="underline">Início</a> &gt; Amigos
					</p>
					<ul class="nav nav-tabs">
						<li class="active"><a href="amigos">amigos</a></li>
					</ul>
					<p>mostrando amigos de ${usuario.getNome() }</p>
					<hr>
					<div class="row nopadding">
						${html }
						<c:forEach var="amigo" items="${amigos }">
							<div class="col-xs-3 col-sm-3 col-lg-3 nopadding">
								<div class="perfil">
									<div class="avatar">
										<a href="perfilUsuario?usu_id=${amigo.getUsu_id() }"> <img
											src="<c:url value="/resources/images/${amigo.getAvatar() }" />"
											alt="${amigo.getNome() }">
										</a>
									</div>
									<div class="informacoes">
										<p>
											<a href="perfilUsuario?usu_id=${amigo.getUsu_id() }">${amigo.getNome() } (${amigo.getAmizades().size() })</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
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
<jsp:include page="../rodape.jsp"></jsp:include>