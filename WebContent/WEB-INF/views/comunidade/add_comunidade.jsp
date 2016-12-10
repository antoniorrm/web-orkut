<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../cabecalho.jsp"></jsp:include>
	<div class="container-fluid conteudo">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-lg-12 nopadding-xs">
				<div class="modulo">
					<div id="criar-comunidade">
						<h1>Criar comunidade</h1>
						<p class="navegacao-estrutural">
							<a href="http://app.e-orkut.com/home" class="underline">Início</a>
							&gt; <a href="http://app.e-orkut.com/comunidades"
								class="underline">Comunidades</a> &gt; Criar comunidade
						</p>
						<hr>
						<form action="addComunidade"
							method="post" accept-charset="utf-8"
							enctype="multipart/form-data">
							<div style="display: none">
								<input type="hidden" name="posttoken"
									value="188fa096d45167fb050f8dc1713efd93" />
							</div>
							<div class="table-responsive">
								<table class="table" width="100%">
									<tr>
										<th width="20%">nome:</th>
										<td width="80%"><input type="text" name="nome" size="80"
											value=""></td>
									</tr>
									<tr>
										<th>categoria:</th>
										<td>
											<select name="id">
													<option value="">selecione</option>
													<c:forEach var="categoria" items="${categorias }">
													<option value="${categoria.getCat_id() }">${categoria.getNome() }</option>
													</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>imagem:</th>
										<td><input type="file" name="image"></td>
									</tr>
							
								</table>
							</div>
							<hr>
							<p>
								<input type="submit" value="criar" class="btn-orkut"> <a
									href="home" class="btn-orkut">cancelar</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../rodape.jsp"></jsp:include>