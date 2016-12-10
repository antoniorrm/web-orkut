package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IForumDAO;
import br.ufc.model.Forum;
import br.ufc.model.Usuario;

@Repository
public class ForumDAOHibernate implements IForumDAO {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void add(Forum forum) {
		manager.persist(forum);
	}

	@Override
	public void alterar(Forum forum) {
		manager.merge(forum);
	}

	@Override
	public Usuario recuperarUsu(Long id) {
		return manager.find(Usuario.class, id);
	}

	@Override
	public Forum recuperar(Long id) {
		return manager.find(Forum.class, id);
	}

	@Override
	public Forum recuperar(String titulo) {
		return null;
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Forum> listar() {
		// TODO Auto-generated method stub
		return null;
	}

}
