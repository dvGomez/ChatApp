<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="DAL.InstituicaoDAO, java.util.*, model.Instituicao, model.Pessoa, DAL.PessoaDAO" %>
    
    <%  
    	Pessoa pessoa = new Pessoa();
    	if(session != null){
    		if(session.getAttribute("userid") != null){
    			String userid = session.getAttribute("userid").toString();
    			System.out.println(userid + " << USERID " );
    			pessoa = PessoaDAO.getPessoaByID(session.getAttribute("userid").toString());
    		} else{
    			System.out.println("redirect1");
    			response.sendRedirect("index.jsp");
    		}
    	} else {
    		System.out.println("redirect2");
    		response.sendRedirect("index.jsp");
    	}
    %>
    
    <%
    	String erro = request.getParameter("erro");
    	if(erro != null){
    		switch(erro){
	    		case "1":
	    			erro = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">Nome ou descrição inválidos!<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div>";
	    			break;
	    		default:
	    			erro = "";
    		}
    	} else {
    		erro = "";
    	}
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
	<% if(pessoa != null){%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<div class="container">
			<i class="fa fa-commenting-o" aria-hidden="true" style="color: orange;"></i>
			<a class="navbar-brand" href="#"> Cadastre sua instituição</a>
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
		<div class="card mt-4">
			<div class="card-body">
			<div class="alert alert-primary">
			<strong>Atenção</strong><br>
			Antes de continuar, certifique-se de que a sua instituição já não está cadastrada no Chat Application!<br>
			<a href="instituicoes.jsp">Clique aqui para verificar.</a>
			</div>
			<%= erro %>
			<form action="CadastrarInstituicaoServlet" method="get">
			  <div class="form-group row">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Nome</label>
			    <div class="col-sm-10">
			      <input name="edtNome" type="text" class="form-control" id="inputNome" placeholder="Nome da sua instituição">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Descrição</label>
			    <div class="col-sm-10">
			      <input name="edtDescricao" type="text" class="form-control" id="inputDescricao" placeholder="Descreva sua instituição em poucas palavras">
			    </div>
			  </div>
			  <div class="form-group row">
			    <div class="col-sm-12">
			      <button type="submit" class="btn btn-primary float-right">Cadastrar</button>
			    </div>
			  </div>
			</form>
			</div>
		</div>
	</div>
	
	<% } else {%>
	
		<div class="container">
			<div class="alert alert-danger mt-4">
				Você não tem permissão para acessar essa página.<br>
				<a href="index.jsp">Voltar</a>
			</div>
		</div>
	
	<%}%>
</body>
</html>