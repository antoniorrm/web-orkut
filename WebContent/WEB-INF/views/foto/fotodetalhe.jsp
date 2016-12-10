<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
	<div class="container-fluid conteudo">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-lg-12">
				<div class="modulo">
					<div id="foto">
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a href="perfil"
								class="underline"> ${amigo.getNome() } </a> &gt; <a href=""
								class="underline">Fotos</a> &gt; <a href="" class="underline">
								${album.getTitulo() }</a> &gt; ${amigo.getLegenda() }
						</p>
						<!-- 						<p>
							mostrando <strong></strong> de <strong>1</strong>
						</p> -->
						<hr>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
								<div class="imagem">
									<div class="informacao">
										<p class="paginacao">
											<a href="javascript:void(0);" class="btn btn-default btn-xs"
												disabled="disabled"><span
												class="glyphicon glyphicon-chevron-left"></span></a> <a
												href="javascript:void(0);" class="btn btn-default btn-xs"
												disabled="disabled"><span
												class="glyphicon glyphicon-chevron-right"></span></a>
										</p>
										<img
											src="<c:url value="/resources/images/${foto.getImagem() }" />"
											alt="${foto.getLegenda() }">
										<p>${foto.getLegenda() }</p>
									</div>
									<hr />
									<div class="row">
										<div
											class="comentarios col-xs-12 col-sm-10 col-sm-offset-1 col-lg-10 col-lg-offset-1">
											<h1>comentários (${comentarios.size() })</h1>
											<p>
												&nbsp; <span class="pull-right paginacao-simples"></span>
											</p>
											<hr />
											${htmlvazio }
											<c:forEach var="comentario" items="${comentarios }">
												<div class="media">
													<div class="media-left">
														<a href="http://app.e-orkut.com/perfil/id/671965"> <img
															class="media-object"
															src="<c:url value="/resources/images/${comentario.getUsuario().getAvatar() }" />"
															alt="${comentario.getUsuario().getAvatar() }" height="100" width="100"> 
															<!-- src="http://app.e-orkut.com/assets/images/usuarios/100x100/sem_avatar.png?v100x100=1.0" -->
														</a>
													</div>
													<div class="media-body">
														<p>
															<a href="">${comentario.getUsuario().getNome() }:</a>
															<span class="pull-right"><a
																href=""
																onclick="if(!confirm('Tem certeza que deseja excluir esse comentário?')) return false;"
																class="btn-orkut">excluir</a></span>
														</p>
														<p>${comentario.getTexto() }</p>
													</div>
												</div>
											</c:forEach>
											<hr />
											<p>
												&nbsp; <span class="pull-right paginacao-simples"></span>
											</p>
											<div id="enviar-comentario">
												<form action="addComentario" method="post"
													accept-charset="utf-8">
													<div style="display: none">
														<input type="hidden" name="id"
															value="${foto.getFot_id() }">
													</div>
													<p>
														<textarea name="texto" rows="4" cols="100"
															placeholder="digite o texto ou cole HTML"></textarea>
													</p>
													<p>
														<input type="submit" value="enviar comentário"
															class="btn-orkut">
													</p>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr />
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../rodape.jsp"></jsp:include>