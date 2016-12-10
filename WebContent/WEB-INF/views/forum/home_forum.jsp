<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
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
						<li><a href="homeForum" class="icone icon-forum">fórum</a></li>
						<li><a href="listarUsuariosComunidades"
							class="icone icon-usuarios">membros</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-xs">
			<div class="modulo">
				<div id="topico">
					<h1>${forum.getTitulo() }</h1>
					<p class="navegacao-estrutural">
						<a href="home" class="underline">Início</a> &gt; <a
							href="comunidades" class="underline">Comunidades</a> &gt; <a
							href="homecomunidade?com_id=${comunidade.getCom_id() }"
							class="underline">teste</a> &gt; ${forum.getTitulo() }
					</p>
					<p>
						mostrando mensagens <a href="" class="btn-orkut">excluir forum</a>
						<span class="pull-right paginacao-simples"></span>
					</p>
					<hr>
					<div class="row nopadding">
						<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">

							<c:forEach var="mensagem" items="${mensagens }">
								<div class="media orkut-lista">
									<div class="media-left">
										<a href="perfilUsuario?usu_id=${mensagem.getUsuario().getUsu_id() }"> <img
											class="media-object"
											src="<c:url value="/resources/images/${mensagem.getUsuario().getAvatar() }" />"
											alt="${mensagem.getUsuario().getNome() }">
										</a>
									</div>
									<div class="media-body">
										<p>
											<a href="perfilUsuario?usu_id=${mensagem.getUsuario().getUsu_id() }">${mensagem.getUsuario().getNome() }:
											</a> <span class="pull-right"><a
												href=""
												onclick="if(!confirm('Tem certeza que deseja excluir essa publicação?')) return false;"
												class="btn-orkut"> excluir </a> </span>
										</p>
										<p>${mensagem.getTexto() }</p>
									</div>
								</div>
							</c:forEach>



						</div>
					</div>
					<hr>
					<p>
						<a href="addMensagemFormulario?for_id=${forum.getFor_id() }"
							class="btn-orkut">responder</a> <a
							href="listarforuns?com_id=${forum.getFor_id() }"
							class="btn-orkut">voltar ao fórum</a> <span
							class="pull-right paginacao-simples"></span>
					</p>
				</div>
			</div>
		</div>

	</div>
</div>

<jsp:include page="../rodape.jsp"></jsp:include>