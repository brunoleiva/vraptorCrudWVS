package br.com.wvs.web;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import java.io.Serializable;
import java.util.Date;

import br.com.wvs.modelo.Clientes;

@Named
@SessionScoped
public class ClienteWeb implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Clientes logado;
	private int errosSenha;

	public void login(Clientes cliente) {
		this.logado = cliente;
	}
	
	public int getId() {
		return logado.getId();
	}
	
	public String getNome() {
		return logado.getNome();
	}
	public String getEmail() {
		return logado.getEmail();
	}
	public String getCpf() {
		return logado.getCpf();
	}
	public String getRg() {
		return logado.getRg();
	}

	public String getTelefone() {
		return logado.getTelefone();
	}

	public Date getDtNascimento() {
		return logado.getDtNascimento();
	}
	
	public String getSenha() {
		return logado.getSenha();
	}

	public int getTipo() {
		return logado.getTipo();
	}
	
	public String getUrl() {
		return logado.getUrl();
	}
	
	public String getDica() {
		return logado.getDica();
	}

	
	public Clientes getLogado() {
		return logado;
	}

	public void setLogado(Clientes logado) {
		this.logado = logado;
	}

	public boolean isLogado() {
		return logado != null;
	}

	public void logout() {
		this.logado = null;
	}

	@Override
	public String toString() {
		return "ClienteWeb [logado=" + logado + "]" + errosSenha;
	}
	
	
}