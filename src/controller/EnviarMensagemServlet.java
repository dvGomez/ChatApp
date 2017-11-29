package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAL.MensagensDAO;
import model.Mensagem;

@WebServlet("/EnviarMensagemServlet")
public class EnviarMensagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnviarMensagemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtMensagem = request.getParameter("edtMensagem");
		Mensagem mensagem = new Mensagem();
		mensagem.setTexto(txtMensagem);
		mensagem.setIdSender(request.getSession().getAttribute("userid").toString());
		mensagem.setDate(new Date());
		String inst = request.getSession().getAttribute("idInst").toString();
		String idRoom = request.getSession().getAttribute("idRoom").toString();
		int result = MensagensDAO.enviarMensagem(mensagem, inst, idRoom);
		switch(result) {
			case 0: // Sucesso
				response.sendRedirect("chat.jsp");
				break;
			case 1: // Mensagem em branco
				response.sendRedirect("chat.jsp");
				break;
			case 2: // Sala inexistente
				response.sendRedirect("chat.jsp");
				break;
			default:
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
