package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Formdata entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.dao.Formdata
 * @author MyEclipse Persistence Tools
 */

public class FormdataDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(FormdataDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String LABEL = "label";
	public static final String TYPE = "type";
	public static final String MAXVALUE = "maxvalue";
	public static final String MINVALUE = "minvalue";
	public static final String UNIT = "unit";
	public static final String NORMAL_VALUES = "normalValues";
	public static final String OTHER1 = "other1";
	public static final String OTHER2 = "other2";
	public static final String OTHER3 = "other3";

	public void save(Formdata transientInstance) {
		log.debug("saving Formdata instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Formdata persistentInstance) {
		log.debug("deleting Formdata instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Formdata findById(java.lang.Integer id) {
		log.debug("getting Formdata instance with id: " + id);
		try {
			Formdata instance = (Formdata) getSession().get("com.dao.Formdata",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Formdata instance) {
		log.debug("finding Formdata instance by example");
		try {
			List results = getSession().createCriteria("com.dao.Formdata").add(
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
		log.debug("finding Formdata instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Formdata as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByLabel(Object label) {
		return findByProperty(LABEL, label);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByMaxvalue(Object maxvalue) {
		return findByProperty(MAXVALUE, maxvalue);
	}

	public List findByMinvalue(Object minvalue) {
		return findByProperty(MINVALUE, minvalue);
	}

	public List findByUnit(Object unit) {
		return findByProperty(UNIT, unit);
	}

	public List findByNormalValues(Object normalValues) {
		return findByProperty(NORMAL_VALUES, normalValues);
	}

	public List findByOther1(Object other1) {
		return findByProperty(OTHER1, other1);
	}

	public List findByOther2(Object other2) {
		return findByProperty(OTHER2, other2);
	}

	public List findByOther3(Object other3) {
		return findByProperty(OTHER3, other3);
	}

	public List findAll() {
		log.debug("finding all Formdata instances");
		try {
			String queryString = "from Formdata";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Formdata merge(Formdata detachedInstance) {
		log.debug("merging Formdata instance");
		try {
			Formdata result = (Formdata) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Formdata instance) {
		log.debug("attaching dirty Formdata instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Formdata instance) {
		log.debug("attaching clean Formdata instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}