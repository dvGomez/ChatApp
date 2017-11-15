package DAL;

import java.util.ArrayList;

import model.Instituicao;

public class InstituicaoDAO {
	
	private static ArrayList<Instituicao> listInstituicao = new ArrayList<>();
	
	//Faz o cadastro de uma nova instituição
	public static int cadastrarInstituicao(Instituicao i) {
		for(Instituicao ins : listInstituicao) {
			if(ins.getNome().equalsIgnoreCase(i.getNome())) {
				return 1;
			}
		}
		String id = listInstituicao.size() + 1000 + "";
		i.setId(id);
		listInstituicao.add(i);
		return 0;
	}
	
	public static ArrayList<Instituicao> getListInstituicoes(){
		return listInstituicao;
	}
	
}
