package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Amizade;

public interface IAmizadeDAO {
	
	public void inserir(Amizade amizade);
	public List<Amizade> listarAmizadesDeId(Long id);
	public boolean existeAmizade(Amizade amizade);
	

}
