package model;

import java.util.ArrayList;
import java.util.Date;

public class Instituicao {
	
	private String id, nome, descricao;
	private Date dtCriacao;
	private ArrayList<Sala> listSalas = new ArrayList<>();
	
	public Instituicao() {}
	
	public Instituicao(String nome, String descricao) {
		this.nome = nome;
		this.descricao = descricao;
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
	public Date getDtCriacao() {
		return dtCriacao;
	}
	public void setDtCriacao(Date dtCriacao) {
		this.dtCriacao = dtCriacao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
	

}
