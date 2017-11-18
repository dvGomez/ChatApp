package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAL.InstituicaoDAO;
import model.Instituicao;

@WebServlet("/CadastrarInstituicaoServlet")
public class CadastrarInstituicaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastrarInstituicaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("edtNome");
		String descricao = request.getParameter("edtDescricao");
		if(nome != null && descricao != null) {
			Instituicao instituicao = InstituicaoDAO.cadastrarInstituicao(new Instituicao(nome, descricao));
			if(instituicao != null) {
				System.out.println("Instituição " + instituicao.getNome() + " cadastrada!");
				response.sendRedirect("salas.jsp?room="+instituicao.getId());
			}else {
				response.sendRedirect("CadastrarInstituicao.jsp?erro=1");
			}
		} else {
			response.sendRedirect("CadastrarInstituicao.jsp?erro=1");
		}
		
	}

}
