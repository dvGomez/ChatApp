package model;

import java.util.ArrayList;
import java.util.Date;

public class Sala {
	private String id, nome, senha, descricao;
	private Date dtCriacao;
	private ArrayList<Pessoa> listPessoas = new ArrayList<>();
	private ArrayList<Aviso> listAvisos = new ArrayList<>();
	private ArrayList<Mensagem> listMensagem = new ArrayList<>();
	
	public Sala () {}
	
	public Sala(String nome, String desc, String senha) {
		this.nome = nome;
		this.descricao = desc;
		this.senha = senha;
	}
	
	public Sala(String nome, String desc) {
		this.nome = nome;
		this.descricao = desc;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public ArrayList<Pessoa> getListPessoas() {
		return listPessoas;
	}
	
	public void setListPessoas(ArrayList<Pessoa> listPessoas) {
		this.listPessoas = listPessoas;
	}
	public ArrayList<Aviso> getListAvisos() {
		return listAvisos;
	}
	public void setListAvisos(ArrayList<Aviso> listAvisos) {
		this.listAvisos = listAvisos;
	}
	public ArrayList<Mensagem> getListMensagem() {
		return listMensagem;
	}
	public void setListMensagem(ArrayList<Mensagem> listMensagem) {
		this.listMensagem = listMensagem;
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
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Date getDtCriacao() {
		return dtCriacao;
	}
	public void setDtCriacao(Date dtCriacao) {
		this.dtCriacao = dtCriacao;
	}
	
	
	
	
}
