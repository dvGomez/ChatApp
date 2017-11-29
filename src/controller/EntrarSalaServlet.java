package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAL.InstituicaoDAO;
import DAL.SalasDAO;
import model.Instituicao;
import model.Sala;

@WebServlet("/EntrarSalaServlet")
public class EntrarSalaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EntrarSalaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		String senha = request.getParameter("edtSenha");
		String idInst = request.getParameter("btnSala");
		String idRoom = request.getParameter("edtRoom");
		Instituicao inst = InstituicaoDAO.getInstituicaoById(idInst);
		if(inst != null) {
			System.out.println("A sala " + inst.getNome() + " foi acessada.");
			Sala sala = SalasDAO.getSalaByIds(inst.getId(), idRoom);
			if(sala != null) {
				if(!sala.getSenha().isEmpty()) { // Acessa se a sala estiver com senha
					System.out.println("A sala acessada possui senha");
					if(sala.getSenha().equals(senha)) {
						System.out.println("A senha da sala está correta");
						session.setAttribute("idRoom", idRoom);
						session.setAttribute("idInst", idInst);
						response.sendRedirect("chat.jsp");
					}else {
						response.sendRedirect("salas.jsp?room=" + idInst + "&error=1");
						System.out.println("A senha da sala não está correta");
					}
				} else { // acessa se a sala estiver sem senha
					System.out.println("A sala acessada não possui senha");
				}
			} else {
				System.out.println("A sala " + idRoom + " da instituicao " + idInst + " não existe!");
				response.sendRedirect("salas.jsp?room=" + idInst);
			}
		} else {
			System.out.println("A instituicao " + idInst + " não existe");
			response.sendRedirect("instituicoes.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
