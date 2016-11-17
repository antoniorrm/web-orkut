package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Categoria;
import br.ufc.model.Comunidade;
import br.ufc.model.Mensagem;

public interface ICategoriaDAO {
	public void add(Categoria categoria);
	public void alterar(Categoria categoria);
	public Categoria recuperar(Long id);
	public Categoria recuperar(String nome);
	public void apagar(Long id);
	public List<Categoria> listar();
	public List<Comunidade> listarC();
}
