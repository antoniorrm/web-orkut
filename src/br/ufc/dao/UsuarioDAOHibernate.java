package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.model.Usuario;


@Repository
public class UsuarioDAOHibernate implements IUsuarioDAO{
	
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void inserir(Usuario usuario) {
		// TODO Auto-generated method stub
		manager.persist(usuario);
	}

	@Override
	public void alterar(Usuario usuario) {
		// TODO Auto-generated method stub
		manager.merge(usuario);
	}

	@Override
	public Usuario recuperar(Long id) {
		// TODO Auto-generated method stub
		return manager.find(Usuario.class, id);
	}

	@Override
	public Usuario recuperar(String login) {
		// TODO Auto-generated method stub
		String hql = "select u from USUARIO as u "+ "where u.login = :var_login";
		Query query = manager.createQuery(hql, Usuario.class);
		query.setParameter("var_login", login);
		
		List<Usuario> usuarios = query.getResultList();
		
		if(usuarios != null && !usuarios.isEmpty()){
			return usuarios.get(0);
		}
		return null;
	}

	@Override
	public List<Usuario> listar() {
		// TODO Auto-generated method stub
		String hql = "select u from USUARIO as u";
		return manager.createQuery(hql,Usuario.class).getResultList();
		
	
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub
		Usuario u = this.recuperar(id);
		manager.remove(u);
	}
	
}
