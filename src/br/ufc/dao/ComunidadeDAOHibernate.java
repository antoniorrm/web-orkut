package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IComunidadeDAO;
import br.ufc.model.Comunidade;

@Repository
public class ComunidadeDAOHibernate implements IComunidadeDAO{

	@PersistenceContext
	private EntityManager manager;

	@Override
	public void add(Comunidade c) {
		manager.persist(c);
	}

	@Override
	public void alterar(Comunidade c) {
		
	}

	@Override
	public Comunidade recuperar(Long id) {
		return manager.find(Comunidade.class, id);
	}

	@Override
	public Comunidade recuperar(String titulo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Comunidade> listar() {
		// TODO Auto-generated method stub
		return null;
	}

}
