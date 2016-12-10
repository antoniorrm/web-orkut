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