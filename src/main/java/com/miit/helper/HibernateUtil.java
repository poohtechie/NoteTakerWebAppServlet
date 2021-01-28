package com.miit.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory sessionFactory = null;

	// This Method Is Used To Create The Hibernate's SessionFactory Object
	public static SessionFactory buildSessionFactory(String fileName) {
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			sessionFactory = new Configuration().configure(fileName).buildSessionFactory();

			return sessionFactory;
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory(String fileName) {
		if (sessionFactory == null) {
			sessionFactory = buildSessionFactory(fileName);
		}
		return sessionFactory;
	}

	public void closeSessionFactory() {
		if (sessionFactory.isOpen()) {
			sessionFactory.close();
		}
	}

}
