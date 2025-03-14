import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.spi.ServiceException;

public class HibernateConn {
    private SessionFactory sessionFactory;
    private Session session;

    public void openSession() {
        try {
            sessionFactory = new Configuration().configure("resources/hibernate.cfg.xml").buildSessionFactory();
            session = sessionFactory.openSession();

            if (session.isOpen()) {
                System.out.println("La sesión se ha abierto correctamente.");
            } else {
                System.out.println("La sesión no se ha abierto.");
            }
        } catch (ServiceException e) {
            System.err.println("Error de comunicación con la base de datos: " + e.getMessage());
            e.printStackTrace();
        } catch (HibernateException e) {
            System.err.println("Error de Hibernate: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error desconocido: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void closeSession() {
        if (session != null && session.isOpen()) {
            session.close();
        }
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }

        public static void main(String[] args) throws HibernateException {
            HibernateConn hibernateConnection = new HibernateConn();

            hibernateConnection.openSession();

        }


}
