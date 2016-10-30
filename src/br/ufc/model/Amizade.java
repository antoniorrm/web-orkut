package br.ufc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="AMIZADE")
public class Amizade {
	
	@Id
	@Column(name="AMI_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long ami_id;

	//Faz a Amizade
	@ManyToOne(optional=false)
	@JoinColumn(name="USUARIO_ID")
	private Usuario usuarioFonte;
	
	//Recebe a Amizade
	@ManyToOne(optional=false)
	@JoinColumn(name="AMIGO_ID")
	private Usuario usuarioAlvo;

	public Long getId() {
		return ami_id;
	}

	public void setId(Long id) {
		this.ami_id = id;
	}

	public Usuario getUsuarioFonte() {
		return usuarioFonte;
	}

	public void setUsuarioFonte(Usuario usuarioFonte) {
		this.usuarioFonte = usuarioFonte;
	}

	public Usuario getUsuarioAlvo() {
		return usuarioAlvo;
	}

	public void setUsuarioAlvo(Usuario usuarioAlvo) {
		this.usuarioAlvo = usuarioAlvo;
	}
	
	
	
	
}
