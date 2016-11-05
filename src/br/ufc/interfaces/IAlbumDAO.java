package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Album;

public interface IAlbumDAO {
	
	public void add(Album album);
	public void alterar(Album album);
	public Album recuperarUsu(Long id);
	public Album recuperar(Long id);
	public Album recuperar(String titulo);
	public void apagar(Long id);
	public List<Album> listar();
}
