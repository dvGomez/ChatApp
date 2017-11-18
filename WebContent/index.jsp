<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	if(request.getAttribute("logout") != null){
    		System.out.println("");
    		session.setAttribute("userid", null);
    		session.invalidate();
    	}
    
    	if(session.getAttribute("userid") != null){
    		response.sendRedirect("instituicoes.jsp");
    	}
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>
<body style="background: #3498db;">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background: #3498db !important;">
    	<div class="container">
			<i class="fa fa-commenting-o" aria-hidden="true" style="color: orange;"></i>
 			 <a class="navbar-brand" href="#"> Chat Application</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
			<ul class="navbar-nav">
			  <li class="nav-item active">
			    <a class="nav-link">Home <span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="login.jsp">Cadastro</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="login.jsp">Login</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">Sobre</a>
			  </li>
			</ul>
			</div>
    	</div>
	</nav>
	<div class="container">
		<div class="row mt-4">
			<div class="col-lg-12 text-center mt-4 text-light">
				<h1 style="font-size: 8rem;" class="mt-4"><i class="fa fa-commenting-o text-warning" aria-hidden="true"></i></h1>
				<p class="slogan">Converse com seus professores e colegas de classe por essa incrível ferramenta de chat online!</p>
			</div>
			<div class="col-lg-12 text-center mb-4">
				<a href="login.jsp" class="btn btn-outline-light mb-4">Comece Agora!</a>
			</div>
		</div>
	</div>
	<div class="row">
		
		<div class="col-lg-12 outline-top text-center" style="background: #2980b9;">
			
			<div class="container">

				<h3 class="text-light mt-4" >. . .</h3>
				
				<div class="row p-4">

					<div class="col-4 col-lg-1">
						<img style="width: 100%;"src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/18342577_1185881911539370_482424343182523964_n.jpg?oh=7fad04a8b3f782ea3fb288243fd1c720&oe=5AA955A3" alt="profile" class="rounded-circle"></div>
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox">
						  <div class="card-header font-weight-bold">
						  	Lucas
						  </div>
						  <div class="card-body msgBody">
						    Com o Chat Application eu consigo me manter informado de tudo que está acontecendo no meu curso!
						  </div>
						</div>
					</div>

				</div>

				<div class="row p-4 justify-content-end">
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox" style="width: auto !important;">
						  <div class="card-header font-weight-bold">
						  	Jean
						  </div>
						  <div class="card-body msgBody">
						    Queêê??!
						  </div>
						</div>
					</div>
					<div class="col-4 col-lg-1">
						<img style="width: 100%;" src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/22519052_1471798312935995_7708118293436127010_n.jpg?oh=8ea01cea4c2430ebe70c967804a29839&oe=5AA8F57C" alt="profile" class="rounded-circle"></div>

				</div>

				<div class="row p-4">

					<div class="col-4 col-lg-1">
						<img style="width: 100%;" src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/22788932_10213388628043730_7181212759899852993_n.jpg?oh=eeabef9c98fb8c0d05cfc065ff1025fc&oe=5A99941A" alt="profile" class="rounded-circle"></div>
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox bg-warning">
						  <div class="card-header font-weight-bold">
						  	Professor
						  </div>
						  <div class="card-body msgBody">
						    Jean, vai pessear, vai!!
						  </div>

						</div>
					</div>

				</div>

				<h3 class="text-light mb-4" >. . .</h3>

			</div>	

		</div>

	</div>
	
	<div class="row outline-top">
		<div class="col-lg-12 mt-3">
		
			<h3 class=" mb-2 text-uppercase text-white text-center font-italic" style="letter-spacing:0.1rem;"><i class="fa fa-fire" aria-hidden="true"></i>
			 Funcionalidades</h3>
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="card mt-1">
						  <ul class="list-group list-group-flush">
						    <li class="list-group-item text-center">Cadastre sua instituição</li>
						    <li class="list-group-item text-center">Crie salas de chat com suas preferencias</li>
						    <li class="list-group-item text-center">Monitore em tempo real os assuntos mais falados</li>
						  </ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mt-1">
						  <ul class="list-group list-group-flush">
						    <li class="list-group-item text-center">Controle total de permissões</li>
						    <li class="list-group-item text-center">Destaque avisos e avaliações</li>
						    <li class="list-group-item text-center">Defina senhas e permissões para cada sala</li>
						  </ul>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<hr>
	<div class="container mt-4 text-center text-light">
		<h6>@Java Web Application - Final Project</h6>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</body>
</html>