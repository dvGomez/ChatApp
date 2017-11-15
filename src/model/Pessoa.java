package model;

import java.util.ArrayList;

public class Pessoa {
	
	private String 
		id, nome, email, senha;
	
	private ArrayList<Sala> listSalas = new ArrayList<>();
	
	public Pessoa() {}
	
	public Pessoa(String nome, String email, String senha) {
		this.nome = nome;
		this.email = email;
		this.senha = senha;
	}

	public ArrayList<Sala> getListSalas() {
		return listSalas;
	}

	public void setListSalas(ArrayList<Sala> listSalas) {
		this.listSalas = listSalas;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
}
