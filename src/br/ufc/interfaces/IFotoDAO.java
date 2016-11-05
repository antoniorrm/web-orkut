package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Foto;

public interface IFotoDAO {
	
	public void add(Foto foto);
	public void alterar(Foto foto);
	public Foto recuperarAlbum(Long id);
	public Foto recuperar(Long id);
	public Foto recuperar(String titulo);
	public void apagar(Long id);
	public List<Foto> listar();

}
