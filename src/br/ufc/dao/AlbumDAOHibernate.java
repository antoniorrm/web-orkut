package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IAlbumDAO;
import br.ufc.model.Album;

@Repository
public class AlbumDAOHibernate implements IAlbumDAO {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public void add(Album album) {
		manager.persist(album);
	}

	@Override
	public void alterar(Album album) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Album recuperarUsu(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Album recuperar(Long id) {
		String hql = "select u from ALBUM as u "+ "where u.albu_id = :var_id";
		Query query = manager.createQuery(hql, Album.class);
		query.setParameter("var_id", id);
		
		List<Album> albuns = query.getResultList();
		
		if(albuns != null && !albuns.isEmpty()){
			return albuns.get(0);
		}
		return null;
	}

	@Override
	public Album recuperar(String titulo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Album> listar() {
		return null;
	}

}
