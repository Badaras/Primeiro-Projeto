package com.pro.alysson.primeiroprojeto.dao;

import org.junit.jupiter.api.Test;

import com.pro.alysson.primeiroprojeto.domain.Estado;

public class EstadoDAOTest {
	@Test
	public void salvar() {
		Estado estado = new Estado();
		estado.setNome("São Paulo");
		estado.setSigla("SP");
		
		EstadoDAO estadoDAO = new EstadoDAO();
		estadoDAO.salvar(estado);
	}
}
