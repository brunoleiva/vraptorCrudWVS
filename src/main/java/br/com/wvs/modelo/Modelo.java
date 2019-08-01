package br.com.wvs.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Modelo {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name = "nome")
	private String nome;
	
	@ManyToOne
    @JoinColumn(name = "id_marca")
	private Marca marca;
	
	public Modelo() {
		super();
	}

	public Modelo(int id) {
		super();
		this.id = id;
	}

	public Modelo(int id, String nome) {
		super();
		this.id = id;
		this.nome = nome;
	}	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	@Override
	public String toString() {
		return "Modelo [id=" + id + ", nome=" + nome + "]";
	}

}
