<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="DAL.InstituicaoDAO, java.util.*, model.Instituicao, model.Pessoa, DAL.PessoaDAO" %>
    
    <%
    Pessoa pessoa = new Pessoa();
    	if(session.getAttribute("userid") != null){
    		String userid = session.getAttribute("userid").toString();
    		pessoa = PessoaDAO.getPessoaByID(userid);
    	}
    	else{
    		response.sendRedirect("index.jsp");
    	}
    
    %>
    
    <%
    
    	ArrayList<Instituicao> listEscolas = InstituicaoDAO.getListInstituicoes();
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Chat Application | Instituições</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS principal -->
    <link rel="stylesheet" type="text/css" href="css/style_salas.css">

    <!-- Font Awesome -->
	<script src="https://use.fontawesome.com/d460afa80a.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</head>
<body>
<body class="bg-dark">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<div class="container">
			<i class="fa fa-commenting-o" aria-hidden="true" style="color: orange;"></i>
			<a class="navbar-brand" href="#"> Escolha sua instituição para participar</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Bem vindo, <%= pessoa.getNome() %>
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">Logout</a>
				          <a class="dropdown-item" href="#">Another action</a>
				          <a class="dropdown-item" href="#">Something else here</a>
				        </div>
				      </li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
					
			<%
			
				if(listEscolas.isEmpty()){
					%>
					
					<div class="alert alert-primary mt-4">
						<strong>Nenhuma instituição cadastrada.</strong><br>
						Para começar a cadastrar uma instituição, contate a administração da sua escola.<br>
						Se você é professor, basta clicar em cadastrar nova instituição no card abaixo!
					</div>
					
					<%
				} else {
					%>
					<form class="form mt-4">
						<div class="row justify-content-center">
							<div class="col-10">
								<input class="form-control" type="search" placeholder="Procure uma instituição" aria-label="Search">
							</div>
							<div class="col-1">
								<button class="btn btn-outline-light " type="submit"><i class="fa fa-search" aria-hidden="true"></i>
							</div>
						</div>
						</button>
					</form>
					<%
				}
			
			%>
			
			<%
					if(pessoa.getId().contains("A")){
						%>
						<div class="alert alert-info mt-4">
							<strong>Cadastre sua instituição no Chat Application!</strong><br>
							Cadastre sua instituição e mantenha sua escola mais conectada do que nunca!<br>
							<a href="CadastrarInstituicao.jsp">Clique aqui para cadastrar sua instituição.</a>
						</div>
						<%
					}
				%>

			<div class="card-columns mt-4">
				
				<%	for(Instituicao i : listEscolas){ %>
						
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%= i.getNome() %></h5>
						<hr>
						<p><%= i.getDescricao() %></p>
						<p class="card-text"><small class="text-muted">Total de salas: <%= i.getListSalas().size() %></small></p>
						<button class="btn btn-block btn-primary">Entrar</button>
					</div>
				</div>
						
				<%	}  %>

			</div>
	</div>
</body>
</html>