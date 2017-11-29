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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<script src="https://use.fontawesome.com/d460afa80a.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	<script>
	
	</script>
</head>
<body>
	<% 
					for(Mensagem m : listMensagem){
						if(m.getIdSender().equals(pessoa.getId())){ //Mensagem que eu enviei
							%>
							
				<div class="row p-4 justify-content-end">
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox" style="width: auto !important;">
						  <div class="card-header font-weight-bold">
						  	<%= pessoa.getNome() %>
						  </div>
						  <div class="card-body msgBody">
						    <%= m.getTexto() %>
						  </div>
						</div>
					</div>
					<div class="col-4 col-lg-1">
						<h1 style="border-radius: 5rem !important;" class="text-light bg-warning pb-2"><%= pessoa.getNome().charAt(0) %></h1>
					</div>
				</div>
				
							
				<%
						} else {
							String nome = PessoaDAO.getPessoaByID(m.getIdSender()).getNome();
				%>
				
				<div class="row p-4">

					<div class="col-4 col-lg-1">
						<h1 style="border-radius: 5rem !important;" class="text-light bg-info pb-2"><%= nome.charAt(0) %></h1>	
					</div>
					<div class="col-8 col-lg-9 text-left">
						<div class="card msgBox">
						  <div class="card-header font-weight-bold">
						  	<%= nome %>
						  </div>
						  <div class="card-body msgBody">
						    <%= m.getTexto() %>
						  </div>
						</div>
					</div>

				</div>
				
				<% } 
				}%>
</body>
</html>