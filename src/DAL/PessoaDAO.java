package DAL;

import java.util.ArrayList;

import model.Pessoa;

public class PessoaDAO {
	
	private static ArrayList<Pessoa> listPessoas = new ArrayList<>();
	
	public static int cadastrarAluno(Pessoa p) {
		
		for(Pessoa pessoa : listPessoas) {
			if(p.getEmail().equalsIgnoreCase(pessoa.getEmail())) {
				return 1;
			}
		}
		p.setId(gerarID("A"));
		listPessoas.add(p); 
		return 0;
	}
	
	public static int cadastrarProfessor(Pessoa p) {
		
		for(Pessoa pessoa : listPessoas) {
			if(p.getEmail().equalsIgnoreCase(pessoa.getEmail())) {
				return 1;
			}
		}
		p.setId(gerarID("P"));
		listPessoas.add(p); 
		return 0;
	}
	
	private static String gerarID(String parameter) {
		String id = "";
		if(listPessoas.isEmpty()) id = parameter.toUpperCase() + 0 + 1000;
		else id = parameter.toUpperCase() + listPessoas.size() + 1000;
		return id;
	}

}
