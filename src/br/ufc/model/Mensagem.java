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
	
	@Column(name="TEXTO", nullable=false)
	private String texto;
	

}
