package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.ICategoriaDAO;
import br.ufc.model.Categoria;
import br.ufc.model.Comunidade;

@Repository
public class CategoriaDAOHibernate implements ICategoriaDAO {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void add(Categoria categoria) {
		manager.persist(categoria);

	}

	@Override
	public void alterar(Categoria categoria) {
		manager.merge(categoria);

	}

	@Override
	public Categoria recuperar(Long id) {
		return manager.find(Categoria.class, id);
	}

	@Override
	public Categoria recuperar(String nome) {
		String hql = "select u from CATEGORIA as u "+ "where u.nome = :var_nome";
		Query query = manager.createQuery(hql, Categoria.class);
		query.setParameter("var_nome", nome);

		
		List<Categoria> categorias= query.getResultList();
		
		if(categorias != null && !categorias.isEmpty()){
			return categorias.get(0);
		}		
		return null;
	}

	@Override
	public void apagar(Long id) {
		Categoria c = this.recuperar(id);
		manager.remove(c);

	}

	@Override
	public List<Categoria> listar() {
		String hql = "select u from CATEGORIA as u";
		return manager.createQuery(hql,Categoria.class).getResultList();
	}

	@Override
	public List<Comunidade> listarC() {
		String hql = "select u from COMUNIDADE as u";
		return manager.createQuery(hql,Comunidade.class).getResultList();
	}

}
