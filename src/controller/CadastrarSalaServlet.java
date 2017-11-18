package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAL.InstituicaoDAO;
import DAL.SalasDAO;
import model.Instituicao;
import model.Sala;

@WebServlet("/CadastrarSalaServlet")
public class CadastrarSalaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastrarSalaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Instituicao inst = InstituicaoDAO.getInstituicaoById(request.getParameter("idRoom"));
		if(inst != null) {
			
			String nome = request.getParameter("edtNome");
			String descricao = request.getParameter("edtDescricao");
			String senha = request.getParameter("edtPassword");
			Sala sala;
			if(senha != null) {
				sala = new Sala(nome, descricao, senha);
			} else {
				sala = new Sala(nome, descricao);
			}
			SalasDAO.cadastrarSala(inst.getId(), sala);
			response.sendRedirect("salas.jsp?room="+inst.getId());
		} else {
			response.sendRedirect("instituicoes.jsp");
		}
		
	}

}
