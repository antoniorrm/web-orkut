<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Orkut a rede social do mundo, conheça o novo, conheça o orkut2!">
<meta name="keywords"
	content="orkut, orkut2, orkut 2, orkut entrar, novo orkut, orkut novo, orkut login, orkuti, orkute, id profile, idprofile, Orkut login, Orkut login entrar, orkut entrar agora, Entrar no orkut, Okut, Orkut Account login, Orkut sign in">
<meta http-equiv="Content-Language" content="pt-br, en">
<link rel="icon" href="http://app.e-orkut.com/favicon.ico">
<title>Orkut - cadastro</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- <link href="./Orkut - cadastro_files/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link href="./Orkut - cadastro_files/formulario.css" rel="stylesheet">

[if lt IE 9]><script src="http://app.e-orkut.com/assets/bootstrap/js/ie8-responsive-file-warning.js"></script><![endif]
<script type="text/javascript" async=""
	src="./Orkut - cadastro_files/recaptcha__pt.js"></script>
<script src="./Orkut - cadastro_files/ie-emulation-modes-warning.js"></script> -->

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
	function onFileSelected(event) {
		var selectedFile = event.target.files[0];
		var reader = new FileReader();

		var imgtag = document.getElementById("myimage");
		imgtag.title = selectedFile.name;

		reader.onload = function(event) {
			imgtag.src = event.target.result;
		};
		reader.readAsDataURL(selectedFile);
	}
</script>
</head>
<body>
	<div class="container form">
		<div class="row">
			<div class="col-xs-12 col-sm-4 col-lg-4">
				<div class="col-xs-12 col-sm-12 col-lg-12">
					<div class="principal">
						<a href="http://app.e-orkut.com/autenticacao/login"> <img
							src="./Orkut - cadastro_files/orkut_logo.png" class="logo"
							alt="Orkut">
						</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-8 col-lg-8">
				<div class="formulario">
					<h1>Crie uma conta</h1>
					<p>Informações necessárias para conta do Orcut.</p>
					<form action="inserirUsuario" method="POST" class="form-horizontal"
						enctype="multipart/form-data">
						<input type="hidden" name="id">
						<div class="form-group">
							<label for="nome"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Nome:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="text" name="nome" class="form-control" id="nome"
									value="" placeholder="Nome">
							</div>
						</div>
						<div class="form-group">
							<label for="sobrenome"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Sobrenome:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="text" name="sobrenome" class="form-control"
									id="sobrenome" value="" placeholder="Sobrenome">
							</div>
						</div>
						<div class="form-group">
							<label for="idade"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Idade:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="date" name="idade" class="form-control" id="idade"
									value="" placeholder="Idade">
							</div>
						</div>
						<div class="form-group">
							<label for="email"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">O seu
								endereço de e-mail atual:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="email" name="email" class="form-control" id="email"
									value="" placeholder="O seu endereço de e-mail atual">
							</div>
						</div>
						<div class="form-group">
							<label for="login"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Login:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="text" name="login" class="form-control" id="login"
									value="" placeholder="Login">
							</div>
						</div>
						<div class="form-group">
							<label for="senha"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Escolha
								uma senha:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="password" name="senha" class="form-control"
									id="senha" placeholder="******">
							</div>
						</div>
						<div class="form-group">
							<label for="confirmarsenha"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Digite
								a senha novamente:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<input type="password" name="confirmarsenha"
									class="form-control" id="confirmarsenha" placeholder="******">
							</div>
						</div>
						<div class="form-group">
							<label for="imagem"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">Adicione
								seu avatar:</label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<img id="myimage" width="50" height="50" /> <input type="file"
									name="imagem" onchange="onFileSelected(event)"
									class="form-control" id="imagem" />
							</div>
						</div>
						<div class="form-group">
							<label for="captcha"
								class="col-xs-12 col-sm-5 col-lg-5 control-label">
								Digite o captcha </label>
							<div class="col-xs-12 col-sm-7 col-lg-7">
								<div class="g-recaptcha"
									data-sitekey="6LdE4xwTAAAAAJuFgveGv3fQFVSZzM7bKANUuEi_"
									data-theme="light" data-type="image">
									<div style="width: 304px; height: 78px;">
										<div>
											<iframe src="./Orkut - cadastro_files/anchor.html"
												title="widget recaptcha" width="304" height="78"
												role="presentation" frameborder="0" scrolling="no"
												name="undefined"></iframe>
										</div>
										<textarea id="g-recaptcha-response"
											name="g-recaptcha-response" class="g-recaptcha-response"
											style="width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
									</div>
								</div>
								<!-- <script type="text/javascript"
									src="./Orkut - cadastro_files/api.js" async="" defer=""></script> -->
							</div>
						</div>
						<div class="form-group">
							<div
								class="col-xs-12 col-sm-7 col-lg-7 col-sm-offset-5 col-lg-offset-5">
								<button type="submit" class="btn btn-default">Cadastrar</button>
							</div>
						</div>
					</form>
				</div>
			</div>



			<div class="col-xs-12 col-sm-12 col-lg-12">
				<div class="rodape">
					<p>©2016 Orcut</p>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="./Orkut - cadastro_files/ie10-viewport-bug-workaround.js"></script> -->

</body>
</html>