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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("edtEmail");
		String senha = request.getParameter("edtSenha");
		if(email != null) {
			Pessoa pessoa = PessoaDAO.getPessoaByEmail(email);
			if(pessoa != null) {
				if(pessoa.getSenha().equals(senha)) {
					response.sendRedirect("login.jsp?login="+ListaAcessoDAO.criarChaveAcesso(pessoa)); // Obteve sucesso no login
				} else {
					response.sendRedirect("login.jsp?login=0");
				}
			} else {
				response.sendRedirect("login.jsp?login=0");
			}
		} else {
			response.sendRedirect("login.jsp?login=0");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
