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
				<div id="novo-album" class="table">
					<h1>novo álbum</h1>
					<form action="addAlbum" method="POST" accept-charset="utf-8"
						enctype="multipart/form-data">
						<div style="display: none">
							<input type="hidden" name="id">
						</div>
						<h1></h1>
						<table class="table-responsive" width="100%">
							<tr>
								<th valign="top" width="10%" align="right">título:</th>
								<td width="90%"><input type="text" name="titulo" value="">
								</td>
							</tr>
							<tr>
								<th valign="top" align="right">Foto de Capa:</th>
								<td><img id="myimage" border="0" /> <input type="file"
									name="imagem" id="imagem" onchange="onFileSelected(event)" />
								</td>
							</tr>
						</table>
						<hr>
						<input type="submit" value="criar" class="btn-orkut">
					</form>
				</div>
			</div>
			<div class="modulo">
				<div id="albuns">

					<h1>Álbuns do(a) ${usuario.getNome()}
						(${usuario.getAlbuns().size() })</h1>
					<p class="navegacao-estrutural">
						<a href="http://app.e-orkut.com/home" class="underline">Início</a>
						&gt; <a href="http://app.e-orkut.com/perfil/id/671965"
							class="underline">${usuario.getNome()}</a> &gt; Álbuns do(a)
						${usuario.getNome()}
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
										<a href="mostrarFotosAlbum?id=${album.getAlbu_id() }"> <img
											src="<c:url value="/resources/images/${album.getFoto_capa() }" />"
											alt="teste">
										</a>
										<p>
											<a href="mostrarFotosAlbum?id=${album.getAlbu_id() }">${album.getTitulo()}
												(${album.getFotos().size() })</a>
										</p>
										<p>
											<a href="http://app.e-orkut.com/perfil/editaralbum/48180"
												class="btn-orkut">editar</a> <a
												href="apagarAlbum?id=${album.getAlbu_id() }"
												class="btn-orkut">excluir</a>
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