package br.ufc.model;

import java.util.Collection;
import java.util.List;
import java.util.Set;

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
	@Column(name="SOBRENOME", nullable=false)
	private String sobrenome;
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
		
	//UM PARA VÁRIOS
	@OneToMany(mappedBy="usuario", targetEntity=Album.class, fetch=FetchType.EAGER)
	private List<Album> albuns;
	
	//UM PARA VÁRIOS
	@OneToMany(mappedBy="usuario", targetEntity=Album.class, fetch=FetchType.EAGER)
	private Collection<Mensagem> mensagens;

	//UM PARA VÁRIOS
	@OneToMany(mappedBy="usuario", targetEntity=Album.class, fetch=FetchType.EAGER)
	private Collection<Comentario> comentarios;
	
	@OneToMany(mappedBy="usuarioFonte", targetEntity=Amizade.class, fetch=FetchType.EAGER)
	private Collection<Amizade> amizades;
	
	@ManyToMany(mappedBy="usuarios", targetEntity=Comunidade.class, fetch=FetchType.EAGER)
	private Set<Comunidade> comunidades;

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
	
	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
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

	public List<Album> getAlbuns() {
		return albuns;
	}

	public void setAlbuns(List<Album> albuns) {
		this.albuns = albuns;
	}

	public Collection<Mensagem> getMensagens() {
		return mensagens;
	}

	public void setMensagens(Collection<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}

	public Collection<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	public Set<Comunidade> getComunidades() {
		return comunidades;
	}

	public void setComunidades(Set<Comunidade> comunidades) {
		this.comunidades = comunidades;
	}

	public Collection<Amizade> getAmizades() {
		return amizades;
	}

	public void setAmizades(Collection<Amizade> amizades) {
		this.amizades = amizades;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((usu_id == null) ? 0 : usu_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (usu_id == null) {
			if (other.usu_id != null)
				return false;
		} else if (!usu_id.equals(other.usu_id))
			return false;
		return true;
	}
	
	
}
