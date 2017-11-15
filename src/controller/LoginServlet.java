package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
					response.sendRedirect("login.jsp?login=1");
				}
			}
		}
		response.sendRedirect("login.jsp?login=0");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
