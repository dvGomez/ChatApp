package DAL;

import java.util.ArrayList;

import model.Pessoa;

public class PessoaDAO {
	
	private static ArrayList<Pessoa> listPessoas = new ArrayList<>();
	
	//Faz o cadastro dos usuários do tipo Aluno
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
	
	//Faz o cadastro dos usuários do tipo Professor
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
	
	//Gera os ID's referentes a cada tipo de cadastro.
	//Para professores é utilizado o parâmetro P, para alunos A.
	//ID's começam no valor 1000;
	private static String gerarID(String parameter) {
		String id = "";
		if(listPessoas.isEmpty()) id = parameter.toUpperCase() + 0 + 1000;
		else id = parameter.toUpperCase() + listPessoas.size() + 1000;
		return id;
	}

}
