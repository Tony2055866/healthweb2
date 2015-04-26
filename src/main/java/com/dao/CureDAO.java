package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Cure
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.dao.Cure
 * @author MyEclipse Persistence Tools
 */

public class CureDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(CureDAO.class);
	// property constants
	public static final String TIME = "time";
	public static final String ADDRESS = "address";
	public static final String CATE = "cate";
	public static final String RES = "res";
	public static final String OTHER = "other";

	public void save(Cure transientInstance) {
		log.debug("saving Cure instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Cure persistentInstance) {
		log.debug("deleting Cure instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Cure findById(Integer id) {
		log.debug("getting Cure instance with id: " + id);
		try {
			Cure instance = (Cure) getSession().get("com.dao.Cure", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Cure instance) {
		log.debug("finding Cure instance by example");
		try {
			List results = getSession().createCriteria("com.dao.Cure").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Cure instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Cure as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTime(Object time) {
		return findByProperty(TIME, time);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByCate(Object cate) {
		return findByProperty(CATE, cate);
	}

	public List findByRes(Object res) {
		return findByProperty(RES, res);
	}

	public List findByOther(Object other) {
		return findByProperty(OTHER, other);
	}

	public List findAll() {
		log.debug("finding all Cure instances");
		try {
			String queryString = "from Cure";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Cure merge(Cure detachedInstance) {
		log.debug("merging Cure instance");
		try {
			Cure result = (Cure) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Cure instance) {
		log.debug("attaching dirty Cure instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Cure instance) {
		log.debug("attaching clean Cure instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}