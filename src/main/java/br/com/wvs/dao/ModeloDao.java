package br.com.wvs.dao;

import java.util.ArrayList;

import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;

import br.com.wvs.entityFactory.FabricaPersistencia;
import br.com.wvs.modelo.Modelo;

@RequestScoped
public class ModeloDao {
	EntityManager manager = new FabricaPersistencia().getEntityManager();
	
	@SuppressWarnings("unchecked")
	public ArrayList<Modelo> listaModelos() {
		return (ArrayList<Modelo>) manager.createQuery("SELECT m from Modelo m ORDER BY id Asc").getResultList();
	}
	
	public Modelo find(Modelo modelo) {
		Modelo encontrado =  manager.find(Modelo.class, modelo.getId());
		return encontrado;
	}
	public Modelo find(int id) {
		Modelo encontrado =  manager.find(Modelo.class, id);
		return encontrado;
	}
}