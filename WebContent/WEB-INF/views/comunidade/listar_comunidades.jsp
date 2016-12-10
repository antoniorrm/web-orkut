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


		<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-xs">
			<div class="modulo">
				<div id="comunidades" class="table">
					<h1>Comunidades (${comunidades.size() })</h1>
					<p class="navegacao-estrutural">
						<a href="home" class="underline">Início</a> &gt; Comunidades
					</p>
					<p>
						<a href="addComunidadeFormulario" class="btn-orkut">criar
							comunidade</a> <span class="pull-right paginacao-simples"></span>
					</p>
					<hr>
					<table class="table-responsive" width="100%">
						<tr>
							<th width="35%">comunidade</th>
							<th width="30%">categoria</th>
							<th width="10%">foruns</th>
						</tr>
						${html }
						<c:forEach var="comunidade" items="${comunidades }">
							<tr>
								<td><a href="homecomunidade?com_id=${comunidade.getCom_id() }">
										${comunidade.getNome() } </a></td>
								<td><a href="http://app.e-orkut.com/perfil/id/1">
										${comunidade.getCategoria().getNome() } </a></td>
								<td>${comunidade.getForuns().size() }</td>
							</tr>
						</c:forEach>
					</table>
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