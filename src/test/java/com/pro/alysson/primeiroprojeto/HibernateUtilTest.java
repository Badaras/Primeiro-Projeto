package com.pro.alysson.primeiroprojeto;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;

public class HibernateUtilTest {
	@Test
	public void conectar(){
		Session sessao = HibernateUtil.getFabricaDeSessoes().openSession();
		sessao.close();
		HibernateUtil.getFabricaDeSessoes().close();
	}
}