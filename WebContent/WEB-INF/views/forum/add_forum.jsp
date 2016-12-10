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
						<li><a href="http://app.e-orkut.com/comunidade/forum/20939"
							class="icone icon-forum">fórum</a></li>
						<li><a href="listarUsuariosComunidades"
							class="icone icon-usuarios">membros</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-10 col-sm-10 col-lg-10 nopadding-xs">
			<div class="modulo">
				<div id="novo-topico" class="table">
					<form action="addForum" method="post" accept-charset="UTF-8"
						enctype="multipart/form-data">
						<div style="display: none">
							<input type="hidden" name="com_id" id="com_id" value="${comunidade.getCom_id() }" />
						</div>
						<h1>Criar Forum</h1>
						<p class="navegacao-estrutural">
							<a href="home" class="underline">Início</a> &gt; <a
								href="comunidades" class="underline">Comunidades</a> &gt; teste
						</p>
						<table class="table-responsive" width="100%">
							<tr>
								<th width="10%" align="right">Titulo:</th>
								<td width="90%"><input type="text" name="titulo" id="titulo" value="">
								</td>
							</tr>
							<tr>
								<th valign="top" align="right">Mensagem:</th>
								<td><textarea name="mensagem" rows="10"
										placeholder="digite o texto ou cole HTML"></textarea></td>
							</tr>
						</table>
						<hr>
						<input type="submit" value="enviar" class="btn-orkut"> <a
							href="http://app.e-orkut.com/comunidade/cmm/20939"
							class="btn-orkut">cancelar</a>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>


<jsp:include page="../rodape.jsp"></jsp:include>