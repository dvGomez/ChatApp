<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="DAL.InstituicaoDAO, java.util.*, model.Instituicao, model.Pessoa, model.Sala, DAL.PessoaDAO, DAL.SalasDAO" %>
    
    <%  
    	Pessoa pessoa = new Pessoa();
    	if(session != null){
    		if(session.getAttribute("userid") != null){
    			String userid = session.getAttribute("userid").toString();
    			System.out.println(userid + " << USERID " );
    			pessoa = PessoaDAO.getPessoaByID(userid);
    		} else{
    			System.out.println("redirect1");
    			response.sendRedirect("index.jsp");
    		}
    	} else {
    		System.out.println("redirect2");
    	}
    %>
    
    <%
   		ArrayList<Sala> listSalas = new ArrayList<>();
    	Instituicao instituicao = new Instituicao();
    	if(request.getParameter("room") != null){
    		String idRoom = request.getParameter("room").toString();
    		instituicao = InstituicaoDAO.getInstituicaoById(idRoom);
    		if(instituicao != null){
    			listSalas = instituicao.getListSalas();
    		} else{
    			response.sendRedirect("instituicoes.jsp");
    		}
    		if(listSalas == null){
    			response.sendRedirect("instituicoes.jsp");
    		}
    	} else {
    		response.sendRedirect("instituicoes.jsp");
    	}
    %>
<% if(pessoa != null && pessoa.getId() != null && instituicao != null){ %>
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
			<a class="navbar-brand" href="#"> Salas de chat de <%= instituicao.getNome() %></a>
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
				          Bem vindo, <%=pessoa.getNome() %>
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="index.jsp?logout=true">Logout</a>
				        </div>
				      </li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
					
			<%
			
				if(!listSalas.isEmpty()){
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
			<div class="alert alert-info mt-4">
				<strong>Cadastre sua sala de chat!</strong><br>
				Cadastre uma sala de chat para conversar com seus amigos, colegas e professores de sala!
				<form action="CadastrarSala.jsp" method="post">
					<button style="padding: 0 !important; "class="btn btn-link"  value="<%= instituicao.getId() %>" name="btnCadastrarSala">Cadastrar sala de chat</button>
				</form>
			</div>

			<div class="card-columns mt-4">
				
				<%	for(Sala i : listSalas){ %>
						
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%= i.getNome() %></h5>
						<hr>
						<p><%= i.getDescricao() %></p>
						<p class="card-text"><small class="text-muted">Participantes: <%= i.getListPessoas().size() %></small></p>
						<a class="btn btn-block btn-primary" href="">Entrar</a>
					</div>
				</div>
						
				<%	}  %>

			</div>
	</div>
</body>
</html>
<% } else {
		
	}
	%>