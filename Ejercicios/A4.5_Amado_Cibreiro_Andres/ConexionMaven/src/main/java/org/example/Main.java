package org.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Main {
    private static SessionFactory sessionFactory;

    public static void main(String[] args) {
        try {
            // Configuración de Hibernate
            sessionFactory = new Configuration().configure().buildSessionFactory();

            // Abre una sesión para verificar la conexión
            try (Session session = sessionFactory.openSession()) {
                System.out.println("Conexión establecida con la base de datos.");
            }
        } catch (Throwable ex) {
            // Manejo de errores al inicializar SessionFactory
            System.err.println("Error al inicializar SessionFactory: " + ex);
            throw new ExceptionInInitializerError(ex);
        } finally {
            if (sessionFactory != null) {
                sessionFactory.close();
            }
        }
    }
}
