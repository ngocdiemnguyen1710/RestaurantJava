/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.repository.impl;

import com.restaurant.pojo.Hall;
import com.restaurant.repository.HallRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author HP
 */
@Repository
public class HallRepositoryImpl implements HallRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public List<Hall> getHalls(String kw) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Hall");
        return q.getResultList();
    }

    @Override
    @Transactional
    public Hall getHallById(int hallId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        return s.get(Hall.class, hallId);
    }
    
}
