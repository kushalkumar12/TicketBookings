package com.work;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AvailableSettings;
import org.hibernate.cfg.Configuration;

import com.model.Bookings;
import com.model.Location;
import com.model.Show;
import com.model.Theatre;
import com.model.User;

public class HibernateUtil {
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {

		if(sessionFactory == null) {
			Configuration configuration = new Configuration();
			Properties properties = new Properties();
			properties.put(AvailableSettings.DRIVER, "oracle.jdbc.driver.OracleDriver");
			properties.put(AvailableSettings.URL, "jdbc:oracle:thin:@localhost:1521:xe");
			properties.put(AvailableSettings.USER, "TICKET_BOOKING");
			properties.put(AvailableSettings.PASS, "ticketpwd");
			properties.put(AvailableSettings.DIALECT, "org.hibernate.dialect.Oracle10gDialect");
			properties.put(AvailableSettings.SHOW_SQL, true);

			configuration.setProperties(properties);
			configuration.addAnnotatedClass(User.class);
			configuration.addAnnotatedClass(Location.class);
			configuration.addAnnotatedClass(Theatre.class);
			configuration.addAnnotatedClass(Show.class);
			configuration.addAnnotatedClass(Bookings.class);
			StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		}
		return sessionFactory;
	}
}
