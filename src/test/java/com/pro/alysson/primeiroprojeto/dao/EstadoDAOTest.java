package com.pro.alysson.primeiroprojeto.dao;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.pro.alysson.primeiroprojeto.domain.Estado;

public class EstadoDAOTest {
	@Test
	public void salvar() {
		Estado estado = new Estado();
		estado.setNome("Rio de Janeiro");
		estado.setSigla("RJ");
		EstadoDAO estadoDAO = new EstadoDAO();
		estadoDAO.salvar(estado);
	}

	@Test
	public void listar() {
		EstadoDAO estadoDAO = new EstadoDAO();
		List<Estado> resultado = estadoDAO.listar();
		for (Estado estado : resultado) {
			System.out.println(estado.getNome() + "-" + estado.getSigla());
		}
	}

	@Test
	public void buscar() {
		int codigo = 1;
		EstadoDAO estadoDAO = new EstadoDAO();
		Estado estado = estadoDAO.buscar(codigo);
		System.out.println(estado.getCodigo() + " - " + estado.getNome() + " - " + estado.getSigla());
	}

	@Test
	public void excluir() {
		int codigo = 4;
		EstadoDAO estadoDAO = new EstadoDAO();
		Estado estado = estadoDAO.buscar(codigo);
		estadoDAO.excluir(estado);
	}

	@Test
	public void editar() {
		int codigo = 1;
		EstadoDAO estadoDAO = new EstadoDAO();
		Estado estado = estadoDAO.buscar(codigo);
		estado.setSigla("CE");
		estadoDAO.editar(estado);
	}

}
