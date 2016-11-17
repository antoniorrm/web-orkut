package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Comunidade;

public interface IComunidadeDAO {
	
	public void add(Comunidade c);
	public void alterar(Comunidade c);
	public Comunidade recuperar(Long id);
	public Comunidade recuperar(String titulo);
	public void apagar(Long id);
	public List<Comunidade> listar();

}
