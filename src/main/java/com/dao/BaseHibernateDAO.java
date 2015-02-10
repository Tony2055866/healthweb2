package com.dao;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO implements IBaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(BaseHibernateDAO.class);
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
	public void saveOrUpdate(Object o) {
		log.debug("saving SurveyHealth instance");
		try {
			getSession().clear();
			getSession().evict(o);
			getSession().saveOrUpdate(o);
			log.debug("saveOrUpdate successful");
			getSession().flush();
			getSession().close();
		} catch (RuntimeException re) {
			log.error("saveOrUpdate failed", re);
			throw re;
		}
	}
}