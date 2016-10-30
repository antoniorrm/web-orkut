package br.ufc.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="FORUM")
public class Forum {

	@Id
	@Column(name="FOR_ID", nullable=false)
	private Long for_id;
	
	//VÁRIOS PARA UM
	@Column(name="COM_ID", insertable=false, updatable=false, nullable=false)
	private Long com_id;

	@ManyToOne(optional=false)
	@JoinColumn(name="COM_ID", referencedColumnName="COM_ID")
	private Comunidade comunidade;
	
	
	@OneToMany(mappedBy="forum", targetEntity=Mensagem.class, fetch=FetchType.EAGER)
	private Collection<Mensagem> mensagens;
}
