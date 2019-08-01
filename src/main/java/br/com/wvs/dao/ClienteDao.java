package br.com.wvs.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.InputMismatchException;

import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.com.wvs.entityFactory.FabricaPersistencia;
import br.com.wvs.modelo.Clientes;

@RequestScoped
public class ClienteDao {
	EntityManager manager = new FabricaPersistencia().getEntityManager();

	public void add(Clientes cliente) {
		manager.getTransaction().begin();

		manager.persist(cliente);

		manager.getTransaction().commit();
		manager.close();
	}

	public void remove(Clientes cliente) {
		manager.getTransaction().begin();

		manager.remove(cliente);

		manager.getTransaction().commit();
		manager.close();
	}

	public Clientes find(int cod) {
		Clientes encontrado = manager.find(Clientes.class, cod);
		return encontrado;
	}

	public Clientes find(Clientes cliente) {
		Clientes encontrado = manager.find(Clientes.class, cliente.getId());
		return encontrado;
	}

	public void saveOrUpdate(Clientes cliente) {
		manager.getTransaction().begin();

		manager.merge(cliente);

		manager.getTransaction().commit();
		manager.close();
	}

	public Clientes carrega(String email, String senha) {
		String hexa = null;
		try {
			MessageDigest m = MessageDigest.getInstance("sha-256");

			m.update(senha.getBytes(), 0, senha.length());

			byte[] digest = m.digest();

			hexa = new BigInteger(1, digest).toString(16);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		TypedQuery<Clientes> query = this.manager
				.createQuery("select c from Clientes c where c.email = :email and c.senha = :senha", Clientes.class);
		query.setParameter("email", email);
		query.setParameter("senha", hexa);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}

	public Clientes validaEmail(String email) {
		TypedQuery<Clientes> query = this.manager.createQuery("select c from Clientes c where c.email = :email",
				Clientes.class);
		query.setParameter("email", email);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}

	public Clientes validaCpf(String cpf) {
		TypedQuery<Clientes> query = this.manager.createQuery("select c from Clientes c where c.cpf = :cpf",
				Clientes.class);
		query.setParameter("cpf", cpf);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public Clientes dicaSenha(String email) {
		TypedQuery<Clientes> query = this.manager.createQuery("select c from Clientes c where c.email = :email",
				Clientes.class);
		query.setParameter("email", email);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}

	public boolean isCpf(String CPF) {

		CPF = removeCaracteresEspeciais(CPF);

		// considera-se erro CPF's formados por uma sequencia de numeros iguais
		if (CPF.equals("00000000000") || CPF.equals("11111111111") || CPF.equals("22222222222")
				|| CPF.equals("33333333333") || CPF.equals("44444444444") || CPF.equals("55555555555")
				|| CPF.equals("66666666666") || CPF.equals("77777777777") || CPF.equals("88888888888")
				|| CPF.equals("99999999999") || (CPF.length() != 11))
			return (false);

		char dig10, dig11;
		int sm, i, r, num, peso;

		// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
		try {
			// Calculo do 1o. Digito Verificador
			sm = 0;
			peso = 10;
			for (i = 0; i < 9; i++) {
				// converte o i-esimo caractere do CPF em um numero:
				// por exemplo, transforma o caractere '0' no inteiro 0
				// (48 eh a posicao de '0' na tabela ASCII)
				num = (int) (CPF.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso - 1;
			}

			r = 11 - (sm % 11);
			if ((r == 10) || (r == 11))
				dig10 = '0';
			else
				dig10 = (char) (r + 48); // converte no respectivo caractere numerico

			// Calculo do 2o. Digito Verificador
			sm = 0;
			peso = 11;
			for (i = 0; i < 10; i++) {
				num = (int) (CPF.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso - 1;
			}

			r = 11 - (sm % 11);
			if ((r == 10) || (r == 11))
				dig11 = '0';
			else
				dig11 = (char) (r + 48);

			// Verifica se os digitos calculados conferem com os digitos informados.
			if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
				return (true);
			else
				return (false);
		} catch (InputMismatchException erro) {
			return (false);
		}
	}

	private String removeCaracteresEspeciais(String doc) {
		if (doc.contains(".")) {
			doc = doc.replace(".", "");
		}
		if (doc.contains("-")) {
			doc = doc.replace("-", "");
		}
		if (doc.contains("/")) {
			doc = doc.replace("/", "");
		}
		return doc;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Clientes> listaTodos() {
		return (ArrayList<Clientes>) manager.createQuery("SELECT c from Clientes c ORDER BY id DESC").getResultList();
	}

}
