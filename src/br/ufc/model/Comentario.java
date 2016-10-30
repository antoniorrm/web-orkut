package br.ufc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="COMENTARIO")
public class Comentario {
	
	@Id
	@Column(name="COM_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long com_id;
	
	//VÁRIOS PARA UM
	@Column(name="FOT_ID", insertable=false, updatable=false, nullable=false)
	private Long fot_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="FOT_ID", referencedColumnName="FOT_ID")
	private Foto foto;
	
	
	@Column(name="TEXTO", nullable=false)
	private String texto;


	public Long getCom_id() {
		return com_id;
	}


	public void setCom_id(Long com_id) {
		this.com_id = com_id;
	}


	public Long getFot_id() {
		return fot_id;
	}


	public void setFot_id(Long fot_id) {
		this.fot_id = fot_id;
	}


	public Foto getFoto() {
		return foto;
	}


	public void setFoto(Foto foto) {
		this.foto = foto;
	}


	public String getTexto() {
		return texto;
	}


	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	

}
