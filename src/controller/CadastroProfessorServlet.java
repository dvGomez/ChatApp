package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAL.ListaAcessoDAO;
import DAL.PessoaDAO;
import model.Pessoa;

@WebServlet("/CadastroProfessorServlet")
public class CadastroProfessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CadastroProfessorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("edtNome");
		String email = request.getParameter("edtEmail");
		String senha = request.getParameter("edtSenha");
		
		Pessoa pessoa = new Pessoa(nome, email, senha);
		
		int code = PessoaDAO.cadastrarProfessor(pessoa);
		switch(code) {
		case 0:
			response.sendRedirect("login.jsp?cadastro="+ListaAcessoDAO.criarChaveAcesso(pessoa)); // Obteve sucesso no cadastro
			break;
		case 1:
			response.sendRedirect("login.jsp?cadastro=1"); // Obteve erro no cadastro, email já existente
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
