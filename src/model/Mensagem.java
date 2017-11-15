package model;

import java.util.Date;

public class Mensagem {
	
	private String id, texto;
	private String idSender;
	private Date date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public String getIdSender() {
		return idSender;
	}
	public void setIdSender(String idSender) {
		this.idSender = idSender;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
