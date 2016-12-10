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
						<p class="informacoes"></p>
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


			<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-left-xs">
				<div class="modulo">
					<div id="fotos">
						<h1>${album.getTitulo() }(${album.getFotos().size() })</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; 
							<a href="perfilUsuario?usu_id=${amigo.getUsu_id() }"
								class="underline">${amigo.getNome() }</a> &gt; <a
								href="album?usu_id=${amigo.getUsu_id() }"
								class="underline">Fotos</a> &gt; ${album.getTitulo() }
						</p>
						<p>
							&nbsp; <span class="pull-right paginacao-simples"></span>
						</p>
						<hr>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
								${foto }
								<c:forEach var="fot" items="${fotos}">
									<div class='col-xs-4 col-sm-4 col-lg-4 nopadding'>
										<div class='foto'>
											<a href="fotoDetalhe?idf=${fot.getFot_id() }&ida=${fot.getAlbu_id() }"> <img
												src="<c:url value="/resources/images/${fot.getImagem() }" />"
												alt="${fot.getImagem() }"></a>
											<p>
												<a href="fotoDetalhe?idf=${fot.getFot_id() }&ida=${fot.getAlbu_id() }">${fot.getLegenda() }
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
<jsp:include page="../rodape.jsp"></jsp:include>