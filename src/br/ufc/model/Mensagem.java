package br.ufc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="MENSAGEM")
public class Mensagem {
	
	@Id
	@Column(name="MEN_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long men_id;
	
	//VÁRIOS PARA UM
	@Column(name="FOR_ID", insertable=false, updatable=false, nullable=false)
	private Long for_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="FOR_ID", referencedColumnName="FOR_ID")
	private Forum forum;
	
	//VÁRIOS PARA UM
	@Column(name="USU_ID", insertable=false, updatable=false, nullable=false)
	private Long usu_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="USU_ID", referencedColumnName="USU_ID")
	private Usuario usuario;
	
	@Column(name="TEXTO", nullable=false)
	private String texto;

	public Long getMen_id() {
		return men_id;
	}

	public void setMen_id(Long men_id) {
		this.men_id = men_id;
	}

	public Long getFor_id() {
		return for_id;
	}

	public void setFor_id(Long for_id) {
		this.for_id = for_id;
	}

	public Forum getForum() {
		return forum;
	}

	public void setForum(Forum forum) {
		this.forum = forum;
	}

	public Long getUsu_id() {
		return usu_id;
	}

	public void setUsu_id(Long usu_id) {
		this.usu_id = usu_id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	
	
	

}
