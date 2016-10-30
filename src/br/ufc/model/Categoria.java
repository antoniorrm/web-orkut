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

}
