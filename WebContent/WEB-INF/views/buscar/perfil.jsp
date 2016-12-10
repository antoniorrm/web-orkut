<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
	<div class="container-fluid conteudo">
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-lg-2">
				<div class="modulo">
					<div id="painel-buscar">
						<ul class="navegacao">
							<li class="active"><a
								href="buscarUsuario?txt=${txt }"
								class="icone icon-perfil">perfil</a></li>
							<li><a href="buscarComunidade?txt=${txt }"
								class="icone icon-comunidade">comunidades</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-left-xs">
				<div class="modulo">
					<div id="buscar">
						<h1>Resultados da busca para "${txt }"</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a>
							&gt; Pesquisar usuários
						</p>
						<p>
						<form action="buscarUsuario" method="GET" role="search">
							<input type="text" name="txt" value="${txt }" placeholder="pesquisa"
								class="input-pesquisar">
							<button type="submit" class="btn btn-orkut btn-xs">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</form>
						<br>
						<hr>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
							${html }
								<c:forEach var="usu" items="${usuarios }">
									<div class="media orkut-lista">
										<div class="media-left">
											<a href="perfilUsuario?usu_id=${usu.getUsu_id() }"> <img
												class="media-object"
												src="<c:url value="/resources/images/${usu.getAvatar() }" />"
												alt="${usu.getNome() } &shy;">
											</a>
										</div>
										<div class="media-body">
											<p>
												<a href="perfilUsuario?usu_id=${usu.getUsu_id() }">${usu.getNome() } &shy;:</a>
											</p>
											<p>${usu.getEmail() } &shy;:</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<hr>
						<p>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../rodape.jsp"></jsp:include>