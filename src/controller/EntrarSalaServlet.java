package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EntrarSalaServlet")
public class EntrarSalaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EntrarSalaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senha = request.getParameter("edtSenha");
		String idRoom = request.getParameter("btnSala");
		if(idRoom != null) {
			if(senha != null) {
				
			} else {
				
			}
		} else {
			response.sendRedirect("");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
