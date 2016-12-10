package br.ufc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.ufc.interfaces.IMensagemDAO;
import br.ufc.model.Comunidade;
import br.ufc.model.Mensagem;
import br.ufc.model.Usuario;

@Repository
public class MensagemDAOHibernate implements IMensagemDAO{

	
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void add(Mensagem mensagem) {
		manager.persist(mensagem);
	}

	@Override
	public void alterar(Mensagem mensagem) {
		
	}

	@Override
	public Usuario recuperarUsu(Long id) {
		return manager.find(Usuario.class, id);
	}

	@Override
	public Mensagem recuperar(Long id) {
		return manager.find(Mensagem.class, id);
	}

	@Override
	public Mensagem recuperar(String titulo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void apagar(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Mensagem> listar() {
		// TODO Auto-generated method stub
		return null;
	}

}
