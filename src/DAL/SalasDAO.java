package DAL;

import java.util.ArrayList;
import java.util.Date;

import model.Instituicao;
import model.Sala;

public class SalasDAO {
	
	public static Sala cadastrarSala(String idRoom, Sala sala) {
		Instituicao inst = InstituicaoDAO.getInstituicaoById(idRoom);
		ArrayList<Sala> listSalas = inst.getListSalas();
		if(listSalas != null) {
			for(Sala s : listSalas) {
				if(sala.getNome().equals(s.getNome())) {
					return null;
				}
			}
			sala.setDtCriacao(new Date());
			sala.setId(listSalas.size() + 1000 + "");
			listSalas.add(sala);
		}
		return null;
	}
	
	public static ArrayList<Sala> getSalas(String idRoom){
		return InstituicaoDAO.getInstituicaoById(idRoom).getListSalas();
	}

}
