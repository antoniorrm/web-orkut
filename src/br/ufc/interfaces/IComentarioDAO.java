package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Comentario;

public interface IComentarioDAO {
	public void add(Comentario comentario);
	public void alterar(Comentario comentario);
	public Comentario recuperarUsu(Long id);
	public Comentario recuperar(Long id);
	public Comentario recuperar(String titulo);
	public void apagar(Long id);
	public List<Comentario> listar();
}
