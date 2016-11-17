package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IComentarioDAO;
import br.ufc.model.Comentario;

@Repository
public class ComentarioDAOHibernate implements IComentarioDAO {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Long add(Comentario comentario) {
		manager.persist(comentario);
		manager.flush();
		return comentario.getCom_id();
	}

	@Override
	public void alterar(Comentario comentario) {
		manager.merge(comentario);

	}

	@Override
	public Comentario recuperar(Long id) {
		return manager.find(Comentario.class, id);
	}

	@Override
	public Comentario recuperar(String texto) {
		String hql = "select u from COMENTARIO as u "+ "where u.texto= :var_texto";
		Query query = manager.createQuery(hql, Comentario.class);
		query.setParameter("var_titulo", texto);
		
		List<Comentario> comentarios= query.getResultList();
		
		if(comentarios != null && !comentarios.isEmpty()){
			return comentarios.get(0);
		}
		return null;
	}

	@Override
	public void apagar(Long id) {
		Comentario c = this.recuperar(id);
		manager.remove(c);

	}

	@Override
	public List<Comentario> listar() {
		String hql = "select u from COMENTARIO as u";
		return manager.createQuery(hql,Comentario.class).getResultList();
	}

}
