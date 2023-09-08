package com.pro.alysson.primeiroprojeto.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity
public class Cidade extends GenericDomain {
	@Column
	private String nome;
	@ManyToOne
	@JoinColumn
	private Estado estado;

}
