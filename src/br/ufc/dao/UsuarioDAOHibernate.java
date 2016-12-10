package br.ufc.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.ufc.excecoes.LoginException;
import br.ufc.interfaces.IUsuarioDAO;
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
	public List<Usuario> recuperar(String busca, Long id) {
		String hql = "select u from USUARIO as u where u.usu_id != :id and u.nome like :q";
		Query query = manager.createQuery(hql, Usuario.class);
		query.setParameter("q", '%' + busca + '%');
		query.setParameter("id", id);
		
		List<Usuario> usuarios = query.getResultList();
		
		return usuarios;
	}
	
	@Override
	public Usuario recuperar(String login) {
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
	public Usuario recuperar(String login, String senha) {
		// TODO Auto-generated method stub
		String hql = "select u from USUARIO as u "+ "where u.login = :var_login and u.senha = :var_senha";
		Query query = manager.createQuery(hql, Usuario.class);
		query.setParameter("var_login", login);
		query.setParameter("var_senha", senha);
		
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
	
	// Funï¿œï¿œo para criar hash da senha informada
	public static String md5(String senha) throws LoginException {
		String sen = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			throw new LoginException(e.getMessage());
		}
		BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
		sen = hash.toString(16);
		return sen;
	}
	
}
