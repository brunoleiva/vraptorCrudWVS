package br.com.wvs.modelo;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Carros {
	@Id @GeneratedValue
	private int id;
	
	@NotNull 
	private int ano;
	
	@NotEmpty
	private String placa;
	
	@NotEmpty
	private String cor;
	
	@ManyToOne //Com esse parâmetro na anotação @OneToOne você esta informando para hibernate que toda vez que você salvar uma matricula você vai salvar/Atualizar um Curso 
    @JoinColumn(name = "id_modelo")
	private Modelo modelo; 
	
	private String url;
	
	public Carros() {
		super();
	}
	
	public Carros(int id) {
		super();
		this.setId(id);

	}
	
	public Carros(int ano, String placa, String cor, Modelo modelo, String url) {
		super();
		this.ano = ano;
		this.placa = placa;
		this.cor = cor;
		this.modelo = modelo;
		this.url = url;
	}

	public Carros(int id, int ano, String placa, String cor, Modelo modelo, String url) {
		super();
		this.id = id;
		this.ano = ano;
		this.placa = placa;
		this.cor = cor;
		this.modelo = modelo;
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Carros [id=" + id + ", ano=" + ano + ", placa=" + placa + ", cor=" + cor + ", modelo=" + modelo + "Marca= " + modelo.getMarca()+"]";
	}
	
	
	
	
	
}
