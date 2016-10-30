package br.ufc.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="FOTO")
public class Foto {
	
	@Id
	@Column(name="FOT_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long fot_id;
	
	//VÁRIOS PARA UM
	@Column(name="ALBU_ID", insertable=false, updatable=false, nullable=false)
	private Long albu_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="ALBU_ID", referencedColumnName="ALBU_ID")
	private Album album;
	
	
	@Column(name="IMAGEM", nullable=false)
	private String imagem;
	
	
	//UM PARA VÁRIOS
	@OneToMany(mappedBy="foto", targetEntity=Comentario.class, fetch=FetchType.EAGER)
	private Collection<Comentario> comentarios;


	public Long getFot_id() {
		return fot_id;
	}


	public void setFot_id(Long fot_id) {
		this.fot_id = fot_id;
	}


	public Long getAlbu_id() {
		return albu_id;
	}


	public void setAlbu_id(Long albu_id) {
		this.albu_id = albu_id;
	}


	public Album getAlbum() {
		return album;
	}


	public void setAlbum(Album album) {
		this.album = album;
	}


	public String getImagem() {
		return imagem;
	}


	public void setImagem(String imagem) {
		this.imagem = imagem;
	}


	public Collection<Comentario> getComentarios() {
		return comentarios;
	}


	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}	
	
	

}
