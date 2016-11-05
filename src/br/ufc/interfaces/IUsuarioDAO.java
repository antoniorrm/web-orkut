package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Usuario;

public interface IUsuarioDAO {
	
	public void inserir(Usuario usuario);
	public void alterar(Usuario usuario);
	public Usuario recuperar(Long id);
	public Usuario recuperar(String login);
	public Usuario recuperar(String login, String senha);
	public void apagar(Long id);
	public List<Usuario> listar();
	
}
