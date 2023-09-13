package com.pro.alysson.primeiroprojeto.dao;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.pro.alysson.primeiroprojeto.domain.Cidade;
import com.pro.alysson.primeiroprojeto.domain.Estado;

public class CidadeDAOTeste {
	@Test
	public void salvar() {
		EstadoDAO estadoDAO = new EstadoDAO();
		Estado estado = estadoDAO.buscar(3);

		Cidade cidade = new Cidade();
		cidade.setNome("Rio de Janeiro");
		cidade.setEstado(estado);

		CidadeDAO cidadeDAO = new CidadeDAO();
		cidadeDAO.salvar(cidade);
	}

	@Test
	public void listar() {
		CidadeDAO cidadeDAO = new CidadeDAO();
		List<Cidade> resultado = cidadeDAO.listar();

		for (Cidade cidade : resultado) {
			System.out.println("Código da Cidade " + cidade.getCodigo());
			System.out.println("Nome da Cidade " + cidade.getNome());
			System.out.println("Código do Estado " + cidade.getEstado().getSigla());
			System.out.println("Sigla do Estado " + cidade.getEstado().getSigla());
		}
	}

	@Test
	public void buscar() {
		int codigo = 1;
		CidadeDAO cidadeDAO = new CidadeDAO();
		Cidade cidade = cidadeDAO.buscar(codigo);

		System.out.println("Código da Cidade " + cidade.getCodigo());
		System.out.println("Nome da Cidade " + cidade.getNome());
		System.out.println("Código do Estado " + cidade.getEstado().getSigla());
		System.out.println("Sigla do Estado " + cidade.getEstado().getSigla());
	}

	@Test
	public void excluir() {
		int codigo = 1;
		CidadeDAO cidadeDAO = new CidadeDAO();
		Cidade cidade = cidadeDAO.buscar(codigo);

		cidadeDAO.excluir(cidade);

	}

	@Test
	public void editar() {
		int codigo = 4;
		CidadeDAO cidadeDAO = new CidadeDAO();
		Cidade cidade = cidadeDAO.buscar(codigo);
		
		System.out.println("Cidade que vai ser editada");
		System.out.println("Código da Cidade " + cidade.getCodigo());
		System.out.println("Nome da Cidade " + cidade.getNome());
		System.out.println("Código do Estado " + cidade.getEstado().getSigla());
		System.out.println("Sigla do Estado " + cidade.getEstado().getSigla());
		
		cidade.setNome("São Gonçalo do Amarante");
		cidadeDAO.editar(cidade);
		
		System.out.println("Cidade Editada Com Sucesso");
		System.out.println("Código da Cidade " + cidade.getCodigo());
		System.out.println("Nome da Cidade " + cidade.getNome());
		System.out.println("Código do Estado " + cidade.getEstado().getSigla());
		System.out.println("Sigla do Estado " + cidade.getEstado().getSigla());
	}
}
