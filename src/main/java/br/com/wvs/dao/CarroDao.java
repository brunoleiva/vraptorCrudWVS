package br.com.wvs.dao;

import java.util.ArrayList;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import br.com.wvs.entityFactory.FabricaPersistencia;
import br.com.wvs.modelo.Carros;

@RequestScoped
public class CarroDao {
	EntityManager manager = new FabricaPersistencia().getEntityManager();

	public void add(Carros carro) {
		manager.getTransaction().begin();
		System.out.println(carro);
		manager.persist(carro);

		manager.getTransaction().commit();
		manager.close();
	}

	public void remove(Carros carro) {
		manager.getTransaction().begin();

		manager.remove(carro);

		manager.getTransaction().commit();
		manager.close();
	}

	public void saveOrUpdate(Carros carro) {
		manager.getTransaction().begin();

		manager.merge(carro);

		manager.getTransaction().commit();
		manager.close();
	}

	public Carros find(int cod) {
		Carros encontrado = manager.find(Carros.class, cod);
		return encontrado;
	}

	public Carros find(Carros carro) {
		Carros encontrado = manager.find(Carros.class, carro.getId());
		return encontrado;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Carros> listaTodos() {
		return (ArrayList<Carros>) manager.createQuery("SELECT c from Carros c ORDER BY id DESC").getResultList();
	}

	public Carros validaPlaca(String placa) {
		TypedQuery<Carros> query = this.manager.createQuery("select c from Carros c where c.placa = :placa",
				Carros.class);
		query.setParameter("placa", placa);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}

	public Carros ultimoId() {
		TypedQuery<Carros> query = this.manager
				.createQuery("select c from Carros c where c.id = (select max(id) from Carros)", Carros.class);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}

	}

	/*
	 * public ArrayList<Carros> buscaModelo(String modelo){ return
	 * (ArrayList<Carros>)
	 * this.manager.createQuery("select c from Carros c where c.modelo like :modelo"
	 * , Carros.class) .setParameter("modelo", "%" + modelo + "%") .getResultList();
	 * }
	 * 
	 * public ArrayList<Carros> buscaPlaca(String placa){ return (ArrayList<Carros>)
	 * this.manager.createQuery("select c from Carros c where c.placa like :placa",
	 * Carros.class) .setParameter("placa", "%" + placa + "%") .getResultList(); }
	 */
}
