package com.nicat.spring.DBRepositories;

import com.nicat.spring.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DBWorker implements DBWorkerInterface {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public User getUserByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        User u = session.createQuery("from User u where u.username =" + username, User.class).getSingleResult();
        return u;
    }
}
