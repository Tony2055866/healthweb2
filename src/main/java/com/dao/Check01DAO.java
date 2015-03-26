package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Check01 entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see dao.Check01
 * @author MyEclipse Persistence Tools
 */

public class Check01DAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(Check01DAO.class);
	// property constants
	public static final String NORMAL1 = "normal1";
	public static final String NORMAL2 = "normal2";
	public static final String NORMAL3 = "normal3";
	public static final String NORMAL4 = "normal4";
	public static final String NORMAL5 = "normal5";
	public static final String NORMAL6 = "normal6";
	public static final String NORMAL7 = "normal7";
	public static final String NORMAL8 = "normal8";
	public static final String NORMAL9 = "normal9";
	public static final String NORMAL10 = "normal10";
	public static final String NORMAL11 = "normal11";
	public static final String NORMAL12 = "normal12";
	public static final String NORMAL13 = "normal13";
	public static final String NORMAL14 = "normal14";
	public static final String NORMAL15 = "normal15";
	public static final String NORMAL16 = "normal16";
	public static final String NORMAL17 = "normal17";
	public static final String NORMAL18 = "normal18";
	public static final String NORMAL19 = "normal19";
	public static final String NORMAL20 = "normal20";
	public static final String NORMAL21 = "normal21";
	public static final String NORMAL22 = "normal22";
	public static final String NORMAL23 = "normal23";
	public static final String NORMAL24 = "normal24";
	public static final String NORMAL25 = "normal25";
	public static final String NORMAL26 = "normal26";
	public static final String NORMAL27 = "normal27";
	public static final String NORMAL28 = "normal28";
	public static final String NORMAL29 = "normal29";
	public static final String NORMAL30 = "normal30";
	public static final String NORMAL31 = "normal31";

	public void save(Check01 transientInstance) {
       
		log.debug("saving Check01 instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Check01 persistentInstance) {
		log.debug("deleting Check01 instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Check01 findById(Integer id) {
		log.debug("getting Check01 instance with id: " + id);
		try {
			Check01 instance = (Check01) getSession().get("dao.Check01", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Check01 instance) {
		log.debug("finding Check01 instance by example");
		try {
			List results = getSession().createCriteria("dao.Check01").add(
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
		log.debug("finding Check01 instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Check01 as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByNormal1(Object normal1) {
		return findByProperty(NORMAL1, normal1);
	}

	public List findByNormal2(Object normal2) {
		return findByProperty(NORMAL2, normal2);
	}

	public List findByNormal3(Object normal3) {
		return findByProperty(NORMAL3, normal3);
	}

	public List findByNormal4(Object normal4) {
		return findByProperty(NORMAL4, normal4);
	}

	public List findByNormal5(Object normal5) {
		return findByProperty(NORMAL5, normal5);
	}

	public List findByNormal6(Object normal6) {
		return findByProperty(NORMAL6, normal6);
	}

	public List findByNormal7(Object normal7) {
		return findByProperty(NORMAL7, normal7);
	}

	public List findByNormal8(Object normal8) {
		return findByProperty(NORMAL8, normal8);
	}

	public List findByNormal9(Object normal9) {
		return findByProperty(NORMAL9, normal9);
	}

	public List findByNormal10(Object normal10) {
		return findByProperty(NORMAL10, normal10);
	}

	public List findByNormal11(Object normal11) {
		return findByProperty(NORMAL11, normal11);
	}

	public List findByNormal12(Object normal12) {
		return findByProperty(NORMAL12, normal12);
	}

	public List findByNormal13(Object normal13) {
		return findByProperty(NORMAL13, normal13);
	}

	public List findByNormal14(Object normal14) {
		return findByProperty(NORMAL14, normal14);
	}

	public List findByNormal15(Object normal15) {
		return findByProperty(NORMAL15, normal15);
	}

	public List findByNormal16(Object normal16) {
		return findByProperty(NORMAL16, normal16);
	}

	public List findByNormal17(Object normal17) {
		return findByProperty(NORMAL17, normal17);
	}

	public List findByNormal18(Object normal18) {
		return findByProperty(NORMAL18, normal18);
	}

	public List findByNormal19(Object normal19) {
		return findByProperty(NORMAL19, normal19);
	}

	public List findByNormal20(Object normal20) {
		return findByProperty(NORMAL20, normal20);
	}

	public List findByNormal21(Object normal21) {
		return findByProperty(NORMAL21, normal21);
	}

	public List findByNormal22(Object normal22) {
		return findByProperty(NORMAL22, normal22);
	}

	public List findByNormal23(Object normal23) {
		return findByProperty(NORMAL23, normal23);
	}

	public List findByNormal24(Object normal24) {
		return findByProperty(NORMAL24, normal24);
	}

	public List findByNormal25(Object normal25) {
		return findByProperty(NORMAL25, normal25);
	}

	public List findByNormal26(Object normal26) {
		return findByProperty(NORMAL26, normal26);
	}

	public List findByNormal27(Object normal27) {
		return findByProperty(NORMAL27, normal27);
	}

	public List findByNormal28(Object normal28) {
		return findByProperty(NORMAL28, normal28);
	}

	public List findByNormal29(Object normal29) {
		return findByProperty(NORMAL29, normal29);
	}

	public List findByNormal30(Object normal30) {
		return findByProperty(NORMAL30, normal30);
	}

	public List findByNormal31(Object normal31) {
		return findByProperty(NORMAL31, normal31);
	}

	public List findAll() {
		log.debug("finding all Check01 instances");
		try {
			String queryString = "from Check01";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Check01 merge(Check01 detachedInstance) {
		log.debug("merging Check01 instance");
		try {
			Check01 result = (Check01) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Check01 instance) {
		log.debug("attaching dirty Check01 instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Check01 instance) {
		log.debug("attaching clean Check01 instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}