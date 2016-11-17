package br.ufc.model;

import java.util.Collection;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="ALBUM")
public class Album {
	
	@Id
	@Column(name="ALBU_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long albu_id;
	
	//VÁRIOS PARA UM
	@Column(name="USU_ID", insertable=false, updatable=false, nullable=false)
	private Long usu_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="USU_ID", referencedColumnName="USU_ID")
	private Usuario usuario;
		
	
	@Column(name="TITULO", nullable=false)
	private String titulo;
	
	@Column(name="FOTO_CAPA", nullable=false)
	private String foto_capa;
	
	
	//UM PARA VÁRIOS
	@OneToMany(mappedBy="album", targetEntity=Foto.class, fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	private Set<Foto> fotos;

	public Long getAlbu_id() {
		return albu_id;
	}

	public void setAlbu_id(Long albu_id) {
		this.albu_id = albu_id;
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


	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getFoto_capa() {
		return foto_capa;
	}

	public void setFoto_capa(String foto_capa) {
		this.foto_capa = foto_capa;
	}

	public Set<Foto> getFotos() {
		return fotos;
	}

	public void setFotos(Set<Foto> fotos) {
		this.fotos = fotos;
	}
	
	
}
