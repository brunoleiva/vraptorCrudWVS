package br.com.wvs.dao;

import java.util.ArrayList;

import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;

import br.com.wvs.entityFactory.FabricaPersistencia;
import br.com.wvs.modelo.Marca;

@RequestScoped
public class MarcaDao {
	EntityManager manager = new FabricaPersistencia().getEntityManager();
	
	@SuppressWarnings("unchecked")
	public ArrayList<Marca> listaMarcas() {
		return (ArrayList<Marca>) manager.createQuery("SELECT mar from Marca mar ORDER BY id Asc").getResultList();
	}
	
	public Marca find(Marca marca) {
		Marca encontrado =  manager.find(Marca.class, marca.getId());
		return encontrado;
	}
	public Marca find(int id) {
		Marca encontrado =  manager.find(Marca.class, id);
		return encontrado;
	}
}
