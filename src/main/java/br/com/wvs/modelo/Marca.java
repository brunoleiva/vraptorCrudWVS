package br.com.wvs.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Marca {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@Column(name = "nome")
	private String nome;
	
	public Marca() {
		super();
	}

	public Marca(int id) {
		super();
		this.id = id;
	}

	public Marca(int id, String nome) {
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

	@Override
	public String toString() {
		return "Marca [id=" + id + ", nome=" + nome + "]";
	}
	
	
}
