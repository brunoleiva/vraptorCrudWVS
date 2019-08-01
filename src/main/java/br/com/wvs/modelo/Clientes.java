package br.com.wvs.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Clientes implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@NotEmpty
	@Column(name = "nome")
	private String nome;

	@NotEmpty
	@Column(name = "cpf")
	private String cpf;

	@NotNull
	@Column(name = "rg")
	private String rg;

	@NotEmpty
	@Column(name = "telefone")
	private String telefone;

	@NotNull
	@Temporal(TemporalType.DATE)
	@Column(name = "dt_nascimento")
	private Date dtNascimento;

	@NotEmpty
	private String senha;

	@NotEmpty
	private String email;

	@Min(1)
	private int tipo;
	
	private String url;
	
	private String dica;

	public Clientes() {
		super();
	}

	public Clientes(int id) {
		super();
		this.id = id;
	}

	public Clientes(String senha, String email) {
		super();
		this.senha = senha;
		this.email = email;
	}


	public Clientes(String nome, String cpf, String rg, String telefone, Date dtNascimento, String senha, String email,
			int tipo, String url, String dica) {
		super();
		this.nome = nome;
		this.cpf = cpf;
		this.rg = rg;
		this.telefone = telefone;
		this.dtNascimento = dtNascimento;
		this.senha = senha;
		this.email = email;
		this.tipo = tipo;
		this.url = url;
		this.dica = dica;
	}

	public Clientes(int id, String nome, String cpf, String rg, String telefone, Date dtNascimento, String senha,
			String email, int tipo, String url, String dica) {
		super();
		this.id = id;
		this.nome = nome;
		this.cpf = cpf;
		this.rg = rg;
		this.telefone = telefone;
		this.dtNascimento = dtNascimento;
		this.senha = senha;
		this.email = email;
		this.tipo = tipo;
		this.url = url;
		this.dica = dica;
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

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDtNascimento() {
		return dtNascimento;
	}

	public void setDtNascimento(Date dtNascimento) {
		this.dtNascimento = dtNascimento;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDica() {
		return dica;
	}

	public void setDica(String dica) {
		this.dica = dica;
	}

	@Override
	public String toString() {
		return "Clientes [id=" + id + ", nome=" + nome + ", cpf=" + cpf + ", rg=" + rg + ", telefone=" + telefone
				+ ", dtNascimento=" + dtNascimento + ", senha=" + senha + ", email=" + email + ", tipo=" + tipo
				+ ", url=" + url + ", dica=" + dica + "]";
	}
	
	
	

	

}
