package model;

public class ChaveAcesso {
	
	
	private String chave;
	private Pessoa pessoa;
	
	public ChaveAcesso() {}
	
	public ChaveAcesso(String key, Pessoa p) {
		this.chave = key;
		this.pessoa = p;
	}
	
	public String getChave() {
		return chave;
	}
	public void setChave(String chave) {
		this.chave = chave;
	}
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
}
