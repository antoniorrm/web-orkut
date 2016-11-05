<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>Alterar Funcionário</title>
    
    <style type="text/css">
	 #contactForm .form-group .form-control{border-radius: 0px;}
     #contactForm .button{border-radius: 0px;}
	</style>
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
   <div class="container col-lg-offset-3 col-md-6">
        <h2 class="text-center">Alterar Funcionário</h2>
       
        <form action="alterarUsuario" id="contactForm" method="POST" role="form" enctype="multipart/form-data">
            <div class="form-group">
            	<input type="hidden" name="id" value="${usuario.id}">
                <label>Nome Atual:</label>
                <input type="text" requerid name ="nome" value="${usuario.nome}" class="form-control" id="nome" placeholder="Nome">
                <label>Login Atual:</label>
                <input type="text" requerid name ="login" value="${usuario.login}" class="form-control" id="login" placeholder="Login">
                <label>Senha Atual:</label>
                <input type="password" requerid name="senha" value="${usuario.senha}" class="form-control" id="cargo" placeholder="Senha">
                <label>Avatar Atual:</label>
                <img id="myimage" width="50" height="50" src="<c:url value="/resources/images/${usuario.login }.png" />"/>
                <input type="file" name="image" onchange="onFileSelected(event)"/>
            </div>
           <button type="submit" class="center-block btn btn-block btn-success button">Alterar</button>
            <a class="center-block btn btn-block btn-warning button" href="listarUsuario">Cancelar</a>
        </form>
        
    </div>



</body>

</html>