package br.ufc.model;

import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity(name="USUARIO")
public class Usuario {
	
	@Id
	@Column(name="USU_ID", nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long usu_id;
	
	@Column(name="NOME", nullable=false)
	private String nome;
	@Column(name="IDADE", nullable=false)
	private String idade;
	@Column(name="EMAIL", nullable=false)
	private String email;
	@Column(name="LOGIN", nullable=false)
	private String login;
	@Column(name="SENHA", nullable=false)
	private String senha;
	@Column(name="AVATAR", nullable=false)
	private String avatar;
	

	@ManyToMany(mappedBy="usuario", fetch=FetchType.LAZY)
	private List<Comunidade> comunidades;
	
	
	//UM PARA VÁRIOS
	@OneToMany(mappedBy="usuario", targetEntity=Album.class, fetch=FetchType.EAGER)
	private Collection<Album> albuns;

	public Long getUsu_id() {
		return usu_id;
	}

	public void setUsu_id(Long usu_id) {
		this.usu_id = usu_id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public List<Comunidade> getComunidades() {
		return comunidades;
	}

	public void setComunidades(List<Comunidade> comunidades) {
		this.comunidades = comunidades;
	}

	public Collection<Album> getAlbuns() {
		return albuns;
	}

	public void setAlbuns(Collection<Album> albuns) {
		this.albuns = albuns;
	}
	
	
}
