package DAL;

import java.util.ArrayList;
import java.util.Date;

import model.Instituicao;

public class InstituicaoDAO {
	
	private static ArrayList<Instituicao> listInstituicao = new ArrayList<>();
	
	//Faz o cadastro de uma nova instituição
	public static Instituicao cadastrarInstituicao(Instituicao i) {
		for(Instituicao ins : listInstituicao) {
			if(ins.getNome().equalsIgnoreCase(i.getNome())) {
				return null;
			}
		}
		Date date = new Date();
		String id = listInstituicao.size() + 1000 + "";
		i.setId(id);
		i.setDtCriacao(date);
		listInstituicao.add(i);
		return i;
	}
	
	public static ArrayList<Instituicao> getListInstituicoes(){
		return listInstituicao;
	}
	
	public static Instituicao getInstituicaoById(String id) {
		for(Instituicao ins : listInstituicao) {
			if(ins.getId().equals(id)) {
				return ins;
			}
		}
		return null;
	}
	
}
