package br.ufc.model;

import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="COMUNIDADE")
public class Comunidade {

	@Id
	@Column(name="COM_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long com_id;
		
	//VÁRIOS PARA UM
	@Column(name="CAT_ID", insertable=false, updatable=false, nullable=false)
	private Long cat_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="CAT_ID", referencedColumnName="CAT_ID")
	private Categoria categoria;
	
	@Column(name="NOME", nullable=false)
	private String nome;
	@Column(name="IMAGEM", nullable=false)
	private String imagem;
	

	@OneToMany(mappedBy="comunidade", targetEntity=Forum.class, fetch=FetchType.EAGER)
	private Collection<Forum> foruns;
	
	//VÁRIOS PARA VÁRIOS
	@ManyToMany
	@JoinTable(name="USUARIO_COMUNIDADE", joinColumns=@JoinColumn(name="COM_ID",
											referencedColumnName="COM_ID"),
			inverseJoinColumns= @JoinColumn(name="USU_ID", referencedColumnName="USU_ID"))
	private List<Usuario> usuarios;

	public Long getCom_id() {
		return com_id;
	}

	public void setCom_id(Long com_id) {
		this.com_id = com_id;
	}

	public Long getCat_id() {
		return cat_id;
	}

	public void setCat_id(Long cat_id) {
		this.cat_id = cat_id;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Collection<Forum> getForuns() {
		return foruns;
	}

	public void setForuns(Collection<Forum> foruns) {
		this.foruns = foruns;
	}

//	public List<Usuario> getUsuarios() {
//		return usuarios;
//	}
//
//	public void setUsuarios(List<Usuario> usuarios) {
//		this.usuarios = usuarios;
//	}
//	
	
}
