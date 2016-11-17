package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IFotoDAO;
import br.ufc.model.Foto;

@Repository
public class FotoDAOHibernate implements IFotoDAO {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public void add(Foto foto) {
		manager.persist(foto);
	}

	@Override
	public void alterar(Foto foto) {
		manager.merge(foto);
		
	}

	@Override
	public Foto recuperarAlbum(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Foto recuperar(Long id) {
		return manager.find(Foto.class, id);
	}

	@Override
	public Foto recuperar(String titulo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Foto> listar() {
		// TODO Auto-generated method stub
		return null;
	}

}
