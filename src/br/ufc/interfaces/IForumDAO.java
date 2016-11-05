package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Forum;


public interface IForumDAO {
	public void add(Forum forum);
	public void alterar(Forum forum);
	public Forum recuperarUsu(Long id);
	public Forum recuperar(Long id);
	public Forum recuperar(String titulo);
	public void apagar(Long id);
	public List<Forum> listar();
}
