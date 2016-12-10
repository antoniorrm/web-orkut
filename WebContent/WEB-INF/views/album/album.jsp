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
						<li><a href="" class="icone icon-fotos">fotos</a></li>
					</ul>
					<hr>
					<ul class="navegacao">
						<li><a href="" class="icone icon-mensagens">mensagens</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-left-xs">
			<div class="modulo">
				<div id="albuns">

					<h1>Álbuns do(a) ${amigo.getNome()}
						(${amigo.getAlbuns().size() })</h1>
					<p class="navegacao-estrutural">
						<a href="home" class="underline">Início</a>
						&gt; <a href="perfilUsuario?usu_id=${amigo.getUsu_id() }"
							class="underline">${amigo.getNome()}</a> &gt; Álbuns do(a)
						${amigo.getNome()}
					</p>
					<p>
						&nbsp; <span class="pull-right paginacao-simples"></span>
					</p>
					<hr>
					<div class="row nopadding">
						<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
							${html}
							<c:forEach var="album" items="${albuns}">
								<div class="col-xs-4 col-sm-4 col-lg-4 nopadding">
									<div class="album">
										<a href="foto?id=${album.getAlbu_id() }"> <img
											src="<c:url value="/resources/images/${album.getFoto_capa() }" />"
											alt="teste">
										</a>
										<p>
											<a href="mostrarFotosAlbum?id=${album.getAlbu_id() }">${album.getTitulo()}
												(${album.getFotos().size() })</a>
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