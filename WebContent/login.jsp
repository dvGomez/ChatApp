<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    	String login = request.getParameter("login");
    	String cadastro = request.getParameter("cadastro");
    	if(login != null){
    		switch(login){
    			case "0":
    				login = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">Credenciais de acesso incorretas!<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div>";
    				break;
    			case "1":
    				break;
    			default:
    				login = "";
    				break;
    		}
    	} else {
    		login = "";
    	}
    	if(cadastro != null){
    		switch(cadastro){
    			case "1":
    				cadastro = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">E-mail de cadastro já existe!<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div>";
    				break;
   				default:
   					break;
    		}
    	} else {
    		cadastro = "";
    	}
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Chat Application Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS principal -->
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!-- Font Awesome -->
	<script src="https://use.fontawesome.com/d460afa80a.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <script type="text/javascript">
    	
    	$(document).ready(function(){
    		document.getElementById('inputAluno').onchange = function (evt) {
			    var tgt = evt.target || window.event.srcElement,
			        files = tgt.files;

			    // FileReader support
			    if (FileReader && files && files.length) {
			        var fr = new FileReader();
			        fr.onload = function () {
			            document.getElementById('imgAluno').src = fr.result;
			        }
			        fr.readAsDataURL(files[0]);
			    }

			    // Not supported
			    else {
			        // fallback -- perhaps submit the input to an iframe and temporarily store
			        // them on the server until the user's session ends.
			    }
			}

			document.getElementById('inputProfessor').onchange = function (evt) {
			    var tgt = evt.target || window.event.srcElement,
			        files = tgt.files;

			    // FileReader support
			    if (FileReader && files && files.length) {
			        var fr = new FileReader();
			        fr.onload = function () {
			            document.getElementById('imgProfessor').src = fr.result;
			        }
			        fr.readAsDataURL(files[0]);
			    }

			    // Not supported
			    else {
			        // fallback -- perhaps submit the input to an iframe and temporarily store
			        // them on the server until the user's session ends.
			    }
			}
    	});

    </script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
			<i class="fa fa-commenting-o" aria-hidden="true" style="color: orange;"></i>
 			 <a class="navbar-brand" href="#"> Chat Application</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
			<ul class="navbar-nav">
			  <li class="nav-item">
			    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item active">
			    <a class="nav-link" href="login.jsp" data-target="#exampleModal">Cadastro</a>
			  </li>
			</ul>
			</div>
    	</div>
	</nav>
	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-header">
						<ul class="nav justify-content-center" id="pills-tab" role="tablist">
						  <li class="nav-item">
						    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Faça login ou cadastre-se</a>
						  </li>
						</ul>
					</div>
					<div class="card-body">
					
						<%= login %>
						<%= cadastro %>
						
						<div class="tab-content" id="pills-tabContent">
							<!-- Sou Aluno -->
							<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
									<form action="LoginServlet" method="post">
									  <div class="form-group">
									    <label for="inputNome">E-mail</label>
									    <input name="edtEmail" type="email" class="form-control" id="inputNome" aria-describedby="emailHelp" placeholder="Ex: prof@instituicao.com.br">
									  </div>
									  <div class="form-group">
									    <label for="inputNome">Senha</label>
									    <input name="edtSenha" type="password" class="form-control" id="inputNome" aria-describedby="emailHelp">
									  </div>
									  <button type="submit" class="btn btn-block btn-primary">Entrar</button>
									</form>
									<button data-toggle="modal" data-target="#modalRegisterAluno" class="btn btn-block bg-white mt-2"> Não sou um aluno cadastrado</button> 
									<button data-toggle="modal" data-target="#modalRegisterProfessor" class="btn btn-block bg-white mt-2"> Não sou um professor cadastrado</button> 
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	

	<div class="container mt-4 text-center">
		<h6>@Java Web Application - Final Project</h6>
	</div>

	<div class="modal" tabindex="-1" id="modalRegisterAluno" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cadastro de Aluno</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="CadastroAlunoServlet" method="post">
	        	<div class="form-group">
				    <label for="inputNome">Nome Completo</label>
				    <input name="edtNome" type="text" class="form-control" id="inputNome" aria-describedby="emailHelp" placeholder="Ex: Lucas">
				</div>
				<div class="form-group">
				    <label for="inputNome">E-mail</label>
				    <input name="edtEmail" type="email" class="form-control" id="inputNome" aria-describedby="emailHelp" placeholder="Ex: lucas@gmail.com">
				</div>
				  <div class="form-group">
				    <label for="inputNome">Senha</label>
				    <input name="edtSenha" type="password" class="form-control" id="inputNome" aria-describedby="emailHelp">
				</div>
				<button type="submit" class="btn btn-block btn-primary">Cadastrar</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="modal" tabindex="-1" id="modalRegisterProfessor" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cadastro de Professor</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	        	<div class="form-group">
				    <label for="inputNome">Nome Completo</label>
				    <input name="edtNome" type="text" class="form-control" id="inputNome" aria-describedby="emailHelp" placeholder="Ex: Lucas">
				</div>
				<div class="form-group">
				    <label for="inputNome">E-mail</label>
				    <input name="edtEmail" type="email" class="form-control" id="inputNome" aria-describedby="emailHelp" placeholder="Ex: prof@instituicao.com.br">
				</div>
				  <div class="form-group">
				    <label for="inputNome">Senha</label>
				    <input name="edtSenha" type="password" class="form-control" id="inputNome" aria-describedby="emailHelp">
				</div>
				<button type="submit" class="btn btn-block btn-primary">Cadastrar</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>