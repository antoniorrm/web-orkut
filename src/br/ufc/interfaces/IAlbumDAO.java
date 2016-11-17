package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Album;
import br.ufc.model.Usuario;

public interface IAlbumDAO {
	
	public void add(Album album);
	public void alterar(Album album);
	public Usuario recuperarUsu(Long id);
	public Album recuperar(Long id);
	public Album recuperar(String titulo);
	public void apagar(Long id);
	public List<Album> listar();
}
