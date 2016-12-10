package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Comunidade;

public interface IComunidadeDAO {
	
	public void add(Comunidade c);
	public void alterar(Comunidade c);
	public Comunidade recuperar(Long id);
//	public List<Comunidade> recuperar(String titulo);
	public List<Comunidade> recuperar(String nome);
	public void apagar(Long id);
	public List<Comunidade> listar();

}
