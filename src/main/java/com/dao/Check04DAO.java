package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Check04 entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see dao.Check04
 * @author MyEclipse Persistence Tools
 */

public class Check04DAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(Check04DAO.class);
	// property constants
	public static final String OPER1 = "oper1";
	public static final String OPER2 = "oper2";
	public static final String OPER3 = "oper3";
	public static final String OPER4 = "oper4";
	public static final String OPER5 = "oper5";
	public static final String OPER6 = "oper6";
	public static final String OPER7 = "oper7";
	public static final String OPER8 = "oper8";
	public static final String OPER9 = "oper9";
	public static final String OPER10 = "oper10";
	public static final String OPER11 = "oper11";
	public static final String OPER12 = "oper12";
	public static final String OPER13 = "oper13";
	public static final String OPER14 = "oper14";
	public static final String OPER15 = "oper15";
	public static final String OPER16 = "oper16";
	public static final String OPER17 = "oper17";
	public static final String OPER18 = "oper18";
	public static final String OPER19 = "oper19";
	public static final String OPER20 = "oper20";
	public static final String OPER21 = "oper21";
	public static final String OPER22 = "oper22";
	public static final String OPER23 = "oper23";
	public static final String OPER24 = "oper24";
	public static final String OPER25 = "oper25";
	public static final String OPER26 = "oper26";

	public void save(Check04 transientInstance) {
		log.debug("saving Check04 instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Check04 persistentInstance) {
		log.debug("deleting Check04 instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Check04 findById(Integer id) {
		log.debug("getting Check04 instance with id: " + id);
		try {
			Check04 instance = (Check04) getSession().get("dao.Check04", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Check04 instance) {
		log.debug("finding Check04 instance by example");
		try {
			List results = getSession().createCriteria("dao.Check04").add(
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
		log.debug("finding Check04 instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Check04 as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOper1(Object oper1) {
		return findByProperty(OPER1, oper1);
	}

	public List findByOper2(Object oper2) {
		return findByProperty(OPER2, oper2);
	}

	public List findByOper3(Object oper3) {
		return findByProperty(OPER3, oper3);
	}

	public List findByOper4(Object oper4) {
		return findByProperty(OPER4, oper4);
	}

	public List findByOper5(Object oper5) {
		return findByProperty(OPER5, oper5);
	}

	public List findByOper6(Object oper6) {
		return findByProperty(OPER6, oper6);
	}

	public List findByOper7(Object oper7) {
		return findByProperty(OPER7, oper7);
	}

	public List findByOper8(Object oper8) {
		return findByProperty(OPER8, oper8);
	}

	public List findByOper9(Object oper9) {
		return findByProperty(OPER9, oper9);
	}

	public List findByOper10(Object oper10) {
		return findByProperty(OPER10, oper10);
	}

	public List findByOper11(Object oper11) {
		return findByProperty(OPER11, oper11);
	}

	public List findByOper12(Object oper12) {
		return findByProperty(OPER12, oper12);
	}

	public List findByOper13(Object oper13) {
		return findByProperty(OPER13, oper13);
	}

	public List findByOper14(Object oper14) {
		return findByProperty(OPER14, oper14);
	}

	public List findByOper15(Object oper15) {
		return findByProperty(OPER15, oper15);
	}

	public List findByOper16(Object oper16) {
		return findByProperty(OPER16, oper16);
	}

	public List findByOper17(Object oper17) {
		return findByProperty(OPER17, oper17);
	}

	public List findByOper18(Object oper18) {
		return findByProperty(OPER18, oper18);
	}

	public List findByOper19(Object oper19) {
		return findByProperty(OPER19, oper19);
	}

	public List findByOper20(Object oper20) {
		return findByProperty(OPER20, oper20);
	}

	public List findByOper21(Object oper21) {
		return findByProperty(OPER21, oper21);
	}

	public List findByOper22(Object oper22) {
		return findByProperty(OPER22, oper22);
	}

	public List findByOper23(Object oper23) {
		return findByProperty(OPER23, oper23);
	}

	public List findByOper24(Object oper24) {
		return findByProperty(OPER24, oper24);
	}

	public List findByOper25(Object oper25) {
		return findByProperty(OPER25, oper25);
	}

	public List findByOper26(Object oper26) {
		return findByProperty(OPER26, oper26);
	}

	public List findAll() {
		log.debug("finding all Check04 instances");
		try {
			String queryString = "from Check04";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Check04 merge(Check04 detachedInstance) {
		log.debug("merging Check04 instance");
		try {
			Check04 result = (Check04) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Check04 instance) {
		log.debug("attaching dirty Check04 instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Check04 instance) {
		log.debug("attaching clean Check04 instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}