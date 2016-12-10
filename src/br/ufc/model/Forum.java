package br.ufc.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="FORUM")
public class Forum {

	@Id
	@Column(name="FOR_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long for_id;
	
	//VÁRIOS PARA UM
	@Column(name="COM_ID", insertable=false, updatable=false, nullable=false)
	private Long com_id;

	@Column(name="TITULO", nullable=false)
	private String titulo;
	
	@ManyToOne(optional=false)
	@JoinColumn(name="COM_ID", referencedColumnName="COM_ID")
	private Comunidade comunidade;
	
	
	@OneToMany(mappedBy="forum", targetEntity=Mensagem.class, fetch=FetchType.EAGER)
	private Set<Mensagem> mensagens;

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public Long getFor_id() {
		return for_id;
	}


	public void setFor_id(Long for_id) {
		this.for_id = for_id;
	}


	public Long getCom_id() {
		return com_id;
	}


	public void setCom_id(Long com_id) {
		this.com_id = com_id;
	}


	public Comunidade getComunidade() {
		return comunidade;
	}


	public void setComunidade(Comunidade comunidade) {
		this.comunidade = comunidade;
	}


	public Set<Mensagem> getMensagens() {
		return mensagens;
	}


	public void setMensagens(Set<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}
	
	
}
