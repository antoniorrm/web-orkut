<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
<div class="container-fluid conteudo">
	<div class="row">
		<div class="col-xs-2 col-sm-2 col-lg-2">
			<div class="modulo">
				<div id="perfil">
					<a href="home"> <img
						src="<c:url value="/resources/images/${amigo.getAvatar() }" />"
						alt="${amigo.getAvatar()}"></a>
					<p class="nome">
						<a href="home">${amigo.getNome()}</a>
					</p>
					${add }
					<p class="informacoes"></p>
					<hr>
					<p>
						<a href="http://app.e-orkut.com/perfil/editar"
							class="icone icon-editar-perfil">editar perfil</a>
					</p>
					<hr>
					<ul class="navegacao">
						<li><a href="album?usu_id=${amigo.getUsu_id() }" class="icone icon-fotos">albuns</a></li>
						<li><a href=""
							class="icone icon-fotos">fotos</a></li>
					</ul>
					<hr>
					<ul class="navegacao">
						<li><a href=""
							class="icone icon-mensagens">mensagens</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-lg-6 nopadding-xs">
			<div class="modulo border-radius-top-right-60">
				<div id="painel-principal">
					<h1>Prazer(a) sou o(a) ${amigo.getNome()}</h1>
				</div>
			</div>
		</div>
		<div class="col-xs-4 col-sm-4 col-lg-4">
			<div class="modulo hidden-xs"></div>
			<div class="modulo">
				<div id="amigos-simples">
					<h1>
						meus amigos<a href="">(${amigos.size() })</a>
					</h1>
					<div class="row nopadding">
						${htmla }
						<c:forEach var="ami" items="${amigos }">
							<div class="col-xs-4 col-sm-4 col-lg-4 nopadding">
								<div class="perfil">
									<a href="perfilUsuario?usu_id=${ami.getUsu_id() }"> <img
										src="<c:url value="/resources/images/${ami.getAvatar() }" />"
										alt="${ami.getAvatar() }">
									</a>
									<p>
										<a href="perfilUsuario?usu_id=${ami.getUsu_id() }">
											${ami.getNome() } (${ami.getAmizades().size() })</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<hr>
					<p>
						<a href=""
							class="underline">ver todos</a>
					</p>
				</div>
			</div>
			<div class="modulo">
				<div id="comunidades-simples">
					<h1>
						minhas comunidades <a href="">(${amigo.getComunidades().size() })</a>
					</h1>
					<div class="row nopadding">
						${html }
						<c:forEach var="comunidade" items="${comunidades }">
							<div class="col-xs-4 col-sm-4 col-lg-4 nopadding">
								<div class="perfil">
									<a href="homecomunidade?com_id=${comunidade.getCom_id() }">
										<img
										src="<c:url value="/resources/images/${comunidade.getImagem() }" />"
										alt="${comunidade.getImagem() }">
									</a>
									<p>
										<a href="homecomunidade?com_id=${comunidade.getCom_id() }">
											${comunidade.getNome() } (${comunidade.getUsuarios().size() })</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<hr>
				<p>
					<a href=""
						class="underline">ver todas</a>
				</p>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../rodape.jsp"></jsp:include>