package br.ufc.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name="CATEGORIA")
public class Categoria {
	
	@Id
	@Column(name="CAT_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)	
	private Long cat_id;
	@Column(name="NOME", nullable=false)
	private String nome;
	
	@OneToMany(mappedBy="categoria", targetEntity=Comunidade.class, fetch=FetchType.EAGER)
	private Collection<Comunidade> comunidades;

	public Long getCat_id() {
		return cat_id;
	}

	public void setCat_id(Long cat_id) {
		this.cat_id = cat_id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Collection<Comunidade> getComunidades() {
		return comunidades;
	}

	public void setComunidades(Collection<Comunidade> comunidades) {
		this.comunidades = comunidades;
	}
	
	

}
