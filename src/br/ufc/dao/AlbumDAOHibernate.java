package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IAlbumDAO;
import br.ufc.model.Album;
import br.ufc.model.Usuario;

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
		manager.merge(album);
		
	}

	@Override
	public Usuario recuperarUsu(Long id) {
		return manager.find(Usuario.class, id);
	}

	@Override
	public Album recuperar(Long id) {
		return manager.find(Album.class, id);
	}

	@Override
	public Album recuperar(String titulo) {
		String hql = "select u from ALBUM as u "+ "where u.titulo = :var_titulo";
		Query query = manager.createQuery(hql, Album.class);
		query.setParameter("var_titulo", titulo);
		
		List<Album> albuns = query.getResultList();
		
		if(albuns != null && !albuns.isEmpty()){
			return albuns.get(0);
		}
		return null;
	}

	@Override
	public void apagar(Long id) {
		Album a = this.recuperar(id);
		manager.remove(a);		
	}

	@Override
	public List<Album> listar() {
		String hql = "select u from ALBUM as u";
		return manager.createQuery(hql,Album.class).getResultList();
	}

}
