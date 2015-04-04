package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Check02 entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.dao.Check02
 * @author MyEclipse Persistence Tools
 */

public class Check02DAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(Check02DAO.class);
	// property constants
	public static final String LABN1 = "labn1";
	public static final String LABN2 = "labn2";
	public static final String LABN3 = "labn3";
	public static final String LABN4 = "labn4";
	public static final String LABN5 = "labn5";
	public static final String LABN6 = "labn6";
	public static final String LABN7 = "labn7";
	public static final String LABN8 = "labn8";
	public static final String LABN9 = "labn9";
	public static final String LABN10 = "labn10";
	public static final String LABN11 = "labn11";
	public static final String LABN12 = "labn12";
	public static final String LABN13 = "labn13";
	public static final String LABN14 = "labn14";
	public static final String LABN15 = "labn15";
	public static final String LABN16 = "labn16";
	public static final String LABN17 = "labn17";
	public static final String LABN18 = "labn18";
	public static final String LABN19 = "labn19";
	public static final String LABN20 = "labn20";
	public static final String LABN21 = "labn21";
	public static final String LABN22 = "labn22";
	public static final String LABN23 = "labn23";
	public static final String LABN24 = "labn24";
	public static final String LABN25 = "labn25";
	public static final String LABN26 = "labn26";
	public static final String LABN27 = "labn27";
	public static final String LABN28 = "labn28";
	public static final String LABN29 = "labn29";
	public static final String LABN30 = "labn30";
	public static final String LABN31 = "labn31";
	public static final String LABN32 = "labn32";
	public static final String LABN33 = "labn33";
	public static final String LABN34 = "labn34";
	public static final String LABN35 = "labn35";
	public static final String LABN36 = "labn36";
	public static final String LABN37 = "labn37";
	public static final String LABN38 = "labn38";
	public static final String LABN39 = "labn39";
	public static final String LABN40 = "labn40";
	public static final String LABN41 = "labn41";
	public static final String LABN42 = "labn42";
	public static final String LABN43 = "labn43";
	public static final String LABN44 = "labn44";
	public static final String LABN45 = "labn45";

	public void save(Check02 transientInstance) {
		log.debug("saving Check02 instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Check02 persistentInstance) {
		log.debug("deleting Check02 instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Check02 findById(Integer id) {
		log.debug("getting Check02 instance with id: " + id);
		try {
			Check02 instance = (Check02) getSession().get("com.dao.Check02", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Check02 instance) {
		log.debug("finding Check02 instance by example");
		try {
			List results = getSession().createCriteria("com.dao.Check02").add(
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
		log.debug("finding Check02 instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Check02 as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLabn1(Object labn1) {
		return findByProperty(LABN1, labn1);
	}

	public List findByLabn2(Object labn2) {
		return findByProperty(LABN2, labn2);
	}

	public List findByLabn3(Object labn3) {
		return findByProperty(LABN3, labn3);
	}

	public List findByLabn4(Object labn4) {
		return findByProperty(LABN4, labn4);
	}

	public List findByLabn5(Object labn5) {
		return findByProperty(LABN5, labn5);
	}

	public List findByLabn6(Object labn6) {
		return findByProperty(LABN6, labn6);
	}

	public List findByLabn7(Object labn7) {
		return findByProperty(LABN7, labn7);
	}

	public List findByLabn8(Object labn8) {
		return findByProperty(LABN8, labn8);
	}

	public List findByLabn9(Object labn9) {
		return findByProperty(LABN9, labn9);
	}

	public List findByLabn10(Object labn10) {
		return findByProperty(LABN10, labn10);
	}

	public List findByLabn11(Object labn11) {
		return findByProperty(LABN11, labn11);
	}

	public List findByLabn12(Object labn12) {
		return findByProperty(LABN12, labn12);
	}

	public List findByLabn13(Object labn13) {
		return findByProperty(LABN13, labn13);
	}

	public List findByLabn14(Object labn14) {
		return findByProperty(LABN14, labn14);
	}

	public List findByLabn15(Object labn15) {
		return findByProperty(LABN15, labn15);
	}

	public List findByLabn16(Object labn16) {
		return findByProperty(LABN16, labn16);
	}

	public List findByLabn17(Object labn17) {
		return findByProperty(LABN17, labn17);
	}

	public List findByLabn18(Object labn18) {
		return findByProperty(LABN18, labn18);
	}

	public List findByLabn19(Object labn19) {
		return findByProperty(LABN19, labn19);
	}

	public List findByLabn20(Object labn20) {
		return findByProperty(LABN20, labn20);
	}

	public List findByLabn21(Object labn21) {
		return findByProperty(LABN21, labn21);
	}

	public List findByLabn22(Object labn22) {
		return findByProperty(LABN22, labn22);
	}

	public List findByLabn23(Object labn23) {
		return findByProperty(LABN23, labn23);
	}

	public List findByLabn24(Object labn24) {
		return findByProperty(LABN24, labn24);
	}

	public List findByLabn25(Object labn25) {
		return findByProperty(LABN25, labn25);
	}

	public List findByLabn26(Object labn26) {
		return findByProperty(LABN26, labn26);
	}

	public List findByLabn27(Object labn27) {
		return findByProperty(LABN27, labn27);
	}

	public List findByLabn28(Object labn28) {
		return findByProperty(LABN28, labn28);
	}

	public List findByLabn29(Object labn29) {
		return findByProperty(LABN29, labn29);
	}

	public List findByLabn30(Object labn30) {
		return findByProperty(LABN30, labn30);
	}

	public List findByLabn31(Object labn31) {
		return findByProperty(LABN31, labn31);
	}

	public List findByLabn32(Object labn32) {
		return findByProperty(LABN32, labn32);
	}

	public List findByLabn33(Object labn33) {
		return findByProperty(LABN33, labn33);
	}

	public List findByLabn34(Object labn34) {
		return findByProperty(LABN34, labn34);
	}

	public List findByLabn35(Object labn35) {
		return findByProperty(LABN35, labn35);
	}

	public List findByLabn36(Object labn36) {
		return findByProperty(LABN36, labn36);
	}

	public List findByLabn37(Object labn37) {
		return findByProperty(LABN37, labn37);
	}

	public List findByLabn38(Object labn38) {
		return findByProperty(LABN38, labn38);
	}

	public List findByLabn39(Object labn39) {
		return findByProperty(LABN39, labn39);
	}

	public List findByLabn40(Object labn40) {
		return findByProperty(LABN40, labn40);
	}

	public List findByLabn41(Object labn41) {
		return findByProperty(LABN41, labn41);
	}

	public List findByLabn42(Object labn42) {
		return findByProperty(LABN42, labn42);
	}

	public List findByLabn43(Object labn43) {
		return findByProperty(LABN43, labn43);
	}

	public List findByLabn44(Object labn44) {
		return findByProperty(LABN44, labn44);
	}

	public List findByLabn45(Object labn45) {
		return findByProperty(LABN45, labn45);
	}

	public List findAll() {
		log.debug("finding all Check02 instances");
		try {
			String queryString = "from Check02";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Check02 merge(Check02 detachedInstance) {
		log.debug("merging Check02 instance");
		try {
			Check02 result = (Check02) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Check02 instance) {
		log.debug("attaching dirty Check02 instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Check02 instance) {
		log.debug("attaching clean Check02 instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}