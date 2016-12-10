<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>

	<div class="container-fluid conteudo">
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-lg-2">
				<div class="modulo">
					<div id="perfil">
						<a href="homecomunidade?com_id=${comunidade.getCom_id() }"> <img
							src="<c:url value="/resources/images/${comunidade.getImagem() }" />"
							alt="${comunidade.getImagem() }">
						</a>
						<p class="nome">
							<a href="">${comunidade.getNome() }</a>
						</p>
						<p class="informacoes">(${comunidade.getUsuarios().size() }
							membros)</p>
						<hr>
						${addComunidade }
						<!-- <p>
							<a href="" class="icone icon-editar-perfil">editar comunidade</a>
						</p> -->
						<hr>
						<ul class="navegacao">
							<li><a href="homeForum?com_id=${comunidade.getCom_id() }"
								class="icone icon-forum">fórum</a></li>
							<li><a href="listarUsuariosComunidades?com_id=${comunidade.getCom_id() }"
								class="icone icon-usuarios">membros</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-sm-6 col-lg-6 nopadding-xs">
				<div class="modulo border-radius-top-right-60">
					<div id="painel-principal">
						<h1>${comunidade.getNome() }</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a
								href="comunidades" class="underline">Comunidades</a> &gt;
							${comunidade.getNome() }
						</p>
						<br>
						<table width="100%">
							<tr>
								<th valign="top" width="25%">Nome:</th>
								<td width="75%">
									<p>${comunidade.getNome() }</p>
								</td>
							</tr>
							<tr>
								<th valign="top" width="25%">categoria:</th>
								<td width="75%">${comunidade.getCategoria().getNome() }</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modulo">
					<div id="forum-simples">
						<h1>fórum</h1>
						<table width="100%">
							<tr>
								<th width="7%">&nbsp;</th>
								<th width="53%">tópico</th>
								<th width="15%">postagens</th>
							</tr>
							${htmlf }
							<c:forEach var="forum" items="${foruns }">
								<tr>
									<td align="center"><input type="checkbox"></td>
									<td><a
										href="homeforum?for_id=${forum.getFor_id() }">
											${forum.getTitulo() } </a></td>
									<td>${forum.getMensagens().size()	 }</td>
								</tr>
							</c:forEach>
						</table>
						<hr>
						<p>
							<a href="addForumFormulario?com_id=${comunidade.getCom_id() }"
								class="btn-orkut">criar forum</a><a
								href="todosForum?com_id=${comunidade.getCom_id() }"
								class="underline pull-right">ver todos os foruns</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-xs-4 col-sm-4 col-lg-4">
				<div class="modulo">
					<div id="membros-simples">
						<h1>
							membros <a href="">(${comunidade.getUsuarios().size() })</a>
						</h1>
						<div class="row nopadding">
							<c:forEach var="usua" items="${usuarios }">
								<div class="col-xs-4 col-sm-4 col-lg-4 nopadding">
									<div class="perfil">
										<a href="perfilUsuario?usu_id=${usua.getUsu_id() }"> <img
											src="<c:url value="/resources/images/${usua.getAvatar() }" />"
											alt="${usua.getAvatar()}">
										</a>
										<p>
											<a href="perfilUsuario?usu_id=${usua.getUsu_id() }">
												${usua.getNome() } </a>
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<hr>
						<p>
							<a href="listarUsuariosComunidades?com_id=${comunidade.getCom_id() }"
								class="underline">ver todos</a>
						</p>
					</div>
				</div>
				<!-- <div class="modulo">
					<div id="comunidades-simples">
						<h1>comunidades relacionadas</h1>
						<div class="row nopadding">
							<div class="col-xs-12 col-sm-12 col-lg-12 nopadding">
								<p class="text-empty">Nenhuma comunidade encontrada.</p>
							</div>
						</div>
						<hr>
						<p>
							<a href="http://app.e-orkut.com/comunidade/buscar/20939"
								class="btn-orkut">gerenciar</a>
						</p>
					</div>
				</div> -->
			</div>
		</div>
	</div>
<jsp:include page="../rodape.jsp"></jsp:include>