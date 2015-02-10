package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * SurveyCheck entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.dao.SurveyCheck
 * @author MyEclipse Persistence Tools
 */

public class SurveyCheckDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SurveyCheckDAO.class);
	// property constants
	public static final String HIGH = "high";
	public static final String WEIGHT = "weight";
	public static final String XIONGWEI = "xiongwei";
	public static final String GAOYA = "gaoya";
	public static final String DIYA = "diya";
	public static final String ZAOBO = "zaobo";
	public static final String STT = "stt";
	public static final String FANGCHAN = "fangchan";
	public static final String ZUOXINSHI = "zuoxinshi";
	public static final String XB01 = "xb01";
	public static final String XB02 = "xb02";
	public static final String XB03 = "xb03";
	public static final String XB04 = "xb04";
	public static final String XB05 = "xb05";
	public static final String XB06 = "xb06";
	public static final String XB07 = "xb07";
	public static final String XB08 = "xb08";
	public static final String SYS01 = "sys01";
	public static final String SYS02 = "sys02";
	public static final String SYS03 = "sys03";
	public static final String SYS04 = "sys04";
	public static final String SYS05 = "sys05";
	public static final String SYS06 = "sys06";
	public static final String SYS07 = "sys07";
	public static final String SYS08 = "sys08";
	public static final String SYS09 = "sys09";
	public static final String SYS10 = "sys10";
	public static final String SYS11 = "sys11";
	public static final String SYS12 = "sys12";
	public static final String SYS13 = "sys13";
	public static final String SYS14 = "sys14";
	public static final String SYS15 = "sys15";
	public static final String SYS16 = "sys16";
	public static final String SYS17 = "sys17";
	public static final String SYS18 = "sys18";
	public static final String SYS19 = "sys19";

	public void save(SurveyCheck transientInstance) {
		log.debug("saving SurveyCheck instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SurveyCheck persistentInstance) {
		log.debug("deleting SurveyCheck instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SurveyCheck findById(java.lang.Integer id) {
		log.debug("getting SurveyCheck instance with id: " + id);
		try {
			SurveyCheck instance = (SurveyCheck) getSession().get(
					"com.dao.SurveyCheck", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SurveyCheck instance) {
		log.debug("finding SurveyCheck instance by example");
		try {
			List results = getSession().createCriteria("com.dao.SurveyCheck")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding SurveyCheck instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SurveyCheck as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByHigh(Object high) {
		return findByProperty(HIGH, high);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findByXiongwei(Object xiongwei) {
		return findByProperty(XIONGWEI, xiongwei);
	}

	public List findByGaoya(Object gaoya) {
		return findByProperty(GAOYA, gaoya);
	}

	public List findByDiya(Object diya) {
		return findByProperty(DIYA, diya);
	}

	public List findByZaobo(Object zaobo) {
		return findByProperty(ZAOBO, zaobo);
	}

	public List findByStt(Object stt) {
		return findByProperty(STT, stt);
	}

	public List findByFangchan(Object fangchan) {
		return findByProperty(FANGCHAN, fangchan);
	}

	public List findByZuoxinshi(Object zuoxinshi) {
		return findByProperty(ZUOXINSHI, zuoxinshi);
	}

	public List findByXb01(Object xb01) {
		return findByProperty(XB01, xb01);
	}

	public List findByXb02(Object xb02) {
		return findByProperty(XB02, xb02);
	}

	public List findByXb03(Object xb03) {
		return findByProperty(XB03, xb03);
	}

	public List findByXb04(Object xb04) {
		return findByProperty(XB04, xb04);
	}

	public List findByXb05(Object xb05) {
		return findByProperty(XB05, xb05);
	}

	public List findByXb06(Object xb06) {
		return findByProperty(XB06, xb06);
	}

	public List findByXb07(Object xb07) {
		return findByProperty(XB07, xb07);
	}

	public List findByXb08(Object xb08) {
		return findByProperty(XB08, xb08);
	}

	public List findBySys01(Object sys01) {
		return findByProperty(SYS01, sys01);
	}

	public List findBySys02(Object sys02) {
		return findByProperty(SYS02, sys02);
	}

	public List findBySys03(Object sys03) {
		return findByProperty(SYS03, sys03);
	}

	public List findBySys04(Object sys04) {
		return findByProperty(SYS04, sys04);
	}

	public List findBySys05(Object sys05) {
		return findByProperty(SYS05, sys05);
	}

	public List findBySys06(Object sys06) {
		return findByProperty(SYS06, sys06);
	}

	public List findBySys07(Object sys07) {
		return findByProperty(SYS07, sys07);
	}

	public List findBySys08(Object sys08) {
		return findByProperty(SYS08, sys08);
	}

	public List findBySys09(Object sys09) {
		return findByProperty(SYS09, sys09);
	}

	public List findBySys10(Object sys10) {
		return findByProperty(SYS10, sys10);
	}

	public List findBySys11(Object sys11) {
		return findByProperty(SYS11, sys11);
	}

	public List findBySys12(Object sys12) {
		return findByProperty(SYS12, sys12);
	}

	public List findBySys13(Object sys13) {
		return findByProperty(SYS13, sys13);
	}

	public List findBySys14(Object sys14) {
		return findByProperty(SYS14, sys14);
	}

	public List findBySys15(Object sys15) {
		return findByProperty(SYS15, sys15);
	}

	public List findBySys16(Object sys16) {
		return findByProperty(SYS16, sys16);
	}

	public List findBySys17(Object sys17) {
		return findByProperty(SYS17, sys17);
	}

	public List findBySys18(Object sys18) {
		return findByProperty(SYS18, sys18);
	}

	public List findBySys19(Object sys19) {
		return findByProperty(SYS19, sys19);
	}

	public List findAll() {
		log.debug("finding all SurveyCheck instances");
		try {
			String queryString = "from SurveyCheck";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SurveyCheck merge(SurveyCheck detachedInstance) {
		log.debug("merging SurveyCheck instance");
		try {
			SurveyCheck result = (SurveyCheck) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SurveyCheck instance) {
		log.debug("attaching dirty SurveyCheck instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SurveyCheck instance) {
		log.debug("attaching clean SurveyCheck instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}