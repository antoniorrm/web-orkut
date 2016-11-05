package br.ufc.interfaces;

import java.util.List;

import br.ufc.model.Mensagem;


public interface IMensagemDAO {
	public void add(Mensagem mensagem);
	public void alterar(Mensagem mensagem);
	public Mensagem recuperarUsu(Long id);
	public Mensagem recuperar(Long id);
	public Mensagem recuperar(String titulo);
	public void apagar(Long id);
	public List<Mensagem> listar();
}
