<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="DAL.InstituicaoDAO, java.util.*, model.Instituicao, model.Mensagem, model.Pessoa, model.Sala, DAL.PessoaDAO, DAL.SalasDAO" %>
    
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
    	Instituicao inst = new Instituicao();
    	Sala sala = new Sala();
    	ArrayList<Mensagem> listMensagem = new ArrayList<>();
    	if(request.getSession().getAttribute("idRoom") != null && request.getSession().getAttribute("idInst") != null){
    		String idRoom = request.getSession().getAttribute("idRoom").toString();
    		String idInst = request.getSession().getAttribute("idInst").toString();
    		inst = InstituicaoDAO.getInstituicaoById(idInst);
    		sala = SalasDAO.getSalaByIds(idInst, idRoom);
    		listMensagem = sala.getListMensagem();
    	}
    %>
    
<% if(pessoa != null && !inst.getId().isEmpty() && !sala.getId().isEmpty()){ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS principal -->
    <link rel="stylesheet" type="text/css" href="css/style_salas.css">

    <!-- Font Awesome -->
	<script src="https://use.fontawesome.com/d460afa80a.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

</head>
<body class="bg-dark">
	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" style="z-index:1;">
	
		<div class="container">
				<i class="fa fa-commenting-o" aria-hidden="true" style="color: orange;"></i>
				<a class="navbar-brand" href="#"> <%= sala.getNome() %></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item active">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" class="nav-link" href="#">Avisos <span class="badge badge-primary"><%= sala.getListAvisos().size() %></span></a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="salas.html">Salas <span class="sr-only">(current)</span></a>
						</li>
					</ul>
				</div>			
			</div>
		</div>
	</nav>

<div class="container">
	<div class="row">
		
		<div class="col-lg-12 pt-1 pb-4 text-center">

				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner" role="listbox">
				    <div class="carousel-item active">
						<div class="alert alert-success mt-3" role="alert">
						  <strong>Well done!</strong> You successfully read this important alert message.
						</div>
				    </div>

				    <div class="carousel-item">
				      <div class="alert alert-warning mt-3" role="alert">
						  <strong>Well done!</strong> You successfully read this important alert message.
						</div>
				    </div>

				    <div class="carousel-item">
				      <div class="alert alert-primary mt-3" role="alert">
						  <strong>Well done!</strong> You successfully read this important alert message.
						</div>
				    </div>

				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Próximo</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Anterior</span>
				  </a>
				</div>
				
				<div id="TemplateMensagens">
				</div>
				
				<!-- <div class="row p-4">

					<div class="col-4 col-lg-1">
						<img style="width: 100%;"src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/18342577_1185881911539370_482424343182523964_n.jpg?oh=7fad04a8b3f782ea3fb288243fd1c720&oe=5AA955A3" alt="profile" class="rounded-circle"></div>
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox">
						  <div class="card-header font-weight-bold">
						  	Lucas
						  </div>
						  <div class="card-body msgBody">
						    Fala galera!
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
						    E ae pia!
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
						    Boa noite pessoal!
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
						    Professor, a prova de hoje vai ser em dupla?
						  </div>
						</div>
					</div>
					<div class="col-4 col-lg-1">
						<img style="width: 100%;" src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/22519052_1471798312935995_7708118293436127010_n.jpg?oh=8ea01cea4c2430ebe70c967804a29839&oe=5AA8F57C" alt="profile" class="rounded-circle"></div>

				</div>

				<div class="row p-4 justify-content-end">
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox" style="width: auto !important;">
						  <div class="card-header font-weight-bold">
						  	Jean
						  </div>
						  <div class="card-body msgBody">
						    Professor? Alô?
						  </div>
						</div>
					</div>
					<div class="col-4 col-lg-1">
						<img style="width: 100%;" src="https://scontent.fbfh4-1.fna.fbcdn.net/v/t1.0-9/22519052_1471798312935995_7708118293436127010_n.jpg?oh=8ea01cea4c2430ebe70c967804a29839&oe=5AA8F57C" alt="profile" class="rounded-circle"></div>

				</div> -->

				<h3 class="text-light" >. . .</h3>

		</div>

	</div>
</div>


	<div class="row fixed-bottom p-3 bg-light">
		<div class="container">
			<div class="col-12 mb-2">
				<div class="collapse" id="collapseExample">

					<p id="closeAvisos" class="text-right"> <span class="badge badge-secondary mb-2">Esconder</span> </p>

					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						<strong>Holy guacamole!</strong> You should check in on some of those fields below.
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
			</div>
			<div class="col-12">
				<form class="form" action="EnviarMensagemServlet" method="get">
					<div class="row justify-content-center">
						<div class="col-10">
							<input name="edtMensagem" class="form-control form-outline-warning" type="search" placeholder="Escreva uma mensagem..." aria-label="Search">
						</div>
						<div class="col-1">
							<button class="btn btn-outline-warning btn-warning " type="submit"><i class="fa fa-check" aria-hidden="true"></i></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
  	
  	<script type="text/javascript">
	
		$('.carouselExampleIndicators').carousel({
		  interval: 1000
		});
		
		$(document).ready(function(){
			//$('#collapseExample').collapse('show');

			$('#closeAvisos').click(function(){
				$('#collapseExample').collapse('hide');
			});

		});
		
		$('#TemplateMensagens').load('TemplateMensagens.jsp');
		
		$(document).ready(function(){
			$('html, body').scrollTop( $(document).height() );
		});
		setInterval( refreshMessages, 2000 );
		function refreshMessages()
		{
		    $.ajax({
		        url: 'TemplateMensagens.jsp',
		        type: 'GET',
		        dataType: 'html'
		    })
		    .done(function( data ) {
		        $('#TemplateMensagens').html( data ); // data came back ok, so display it
		    })
		    .fail(function() {
		        $('#TemplateMensagens').prepend('Error retrieving new messages..'); // there was an error, so display an error
		    });
		}
		
		$(document).ready(function(){
			$('html, body').scrollTop( $(document).height() );
		});
		
    </script>
  </body>
</html>
<% }%>