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
				<div id="novo-topico" class="table">
					<form action="addMensagem?for_id=${forum.getFor_id() }"
						method="post" accept-charset="utf-8" enctype="multipart/form-data">
						<div style="display: none">
							<input type="hidden" name="posttoken"
								value="c56bd800e78e0819c16946eca9cebb15" />
						</div>
						<h1>Adicionar Mensagem ao Forum ${forum.getTitulo() }</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a
								href="comunidades" class="underline">Comunidades</a> &gt; <a
								href="homecomunidade?com_id=${comunidade.getCom_id() }"
								class="underline">teste</a> &gt; <a
								href="homeforum?for_id=${forum.getFor_id() }" class="underline">oi</a>
							&gt; Adicionar Mensagem ao Forum ${forum.getTitulo() }
						</p>
						<table class="table-responsive" width="100%">
							<tr>
								<th width="10%" align="right">comunidade:</th>
								<td width="90%">
									<p>${comunidade.getNome() }</p>
								</td>
							</tr>
							<tr>
								<th width="10%" align="right">forum:</th>
								<td width="90%">
									<p>${forum.getTitulo() }</p>
								</td>
							</tr>
							<tr>
								<th valign="top" align="right">mensagem:</th>
								<td><textarea name="texto" id="texto" cols="90"
										rows="10" placeholder="digite o texto"></textarea></td>
							</tr>
						</table>
						<hr>
						<input type="submit" value="enviar" class="btn-orkut"> <a
							href="homeforum?for_id=${forum.getFor_id() }" class="btn-orkut">cancelar</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../rodape.jsp"></jsp:include>