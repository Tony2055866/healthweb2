package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * SurveyEat entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.dao.SurveyEat
 * @author MyEclipse Persistence Tools
 */
public class SurveyEatDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SurveyEatDAO.class);
	// property constants
	public static final String EAT01 = "eat01";
	public static final String EAT02 = "eat02";
	public static final String EAT03 = "eat03";
	public static final String EAT04 = "eat04";
	public static final String EAT05 = "eat05";
	public static final String EAT06 = "eat06";
	public static final String EAT07 = "eat07";
	public static final String EAT08 = "eat08";
	public static final String EAT09 = "eat09";
	public static final String EAT10 = "eat10";
	public static final String EATH01 = "eath01";
	public static final String EATH02 = "eath02";
	public static final String EATH03 = "eath03";
	public static final String EATT = "eatt";
	public static final String IS_XIYAN = "isXiyan";
	public static final String ZHUYAO_CHOU = "zhuyaoChou";
	public static final String HOW_MANY_YAN = "howManyYan";
	public static final String WHEN_XI_YAN = "whenXiYan";
	public static final String HAS_OTHER_CHOU = "hasOtherChou";
	public static final String WHEN_JIE_YAN = "whenJieYan";
	public static final String ISDRINK = "isdrink";
	public static final String HOWLONG_DRINK = "howlongDrink";
	public static final String HOWMUCH_DRINK = "howmuchDrink";
	public static final String ISMUST_DRINK = "ismustDrink";
	public static final String WORK = "work";
	public static final String JIAOTONG = "jiaotong";
	public static final String JIAWU = "jiawu";
	public static final String TIYU01 = "tiyu01";
	public static final String TIYU02 = "tiyu02";
	public static final String TIYU03 = "tiyu03";
	public static final String TIYU04 = "tiyu04";
	public static final String ZHIYE01 = "zhiye01";
	public static final String ZHIYE02 = "zhiye02";
	public static final String ZHIYE03 = "zhiye03";
	public static final String ZHIYE04 = "zhiye04";
	public static final String ZHIYE05 = "zhiye05";
	public static final String ZHIYE06 = "zhiye06";

	public void save(SurveyEat transientInstance) {
		log.debug("saving SurveyEat instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SurveyEat persistentInstance) {
		log.debug("deleting SurveyEat instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SurveyEat findById(java.lang.Integer id) {
		log.debug("getting SurveyEat instance with id: " + id);
		try {
			SurveyEat instance = (SurveyEat) getSession().get(
					"com.dao.SurveyEat", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SurveyEat instance) {
		log.debug("finding SurveyEat instance by example");
		try {
			List results = getSession().createCriteria("com.dao.SurveyEat")
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
		log.debug("finding SurveyEat instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SurveyEat as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByEat01(Object eat01) {
		return findByProperty(EAT01, eat01);
	}

	public List findByEat02(Object eat02) {
		return findByProperty(EAT02, eat02);
	}

	public List findByEat03(Object eat03) {
		return findByProperty(EAT03, eat03);
	}

	public List findByEat04(Object eat04) {
		return findByProperty(EAT04, eat04);
	}

	public List findByEat05(Object eat05) {
		return findByProperty(EAT05, eat05);
	}

	public List findByEat06(Object eat06) {
		return findByProperty(EAT06, eat06);
	}

	public List findByEat07(Object eat07) {
		return findByProperty(EAT07, eat07);
	}

	public List findByEat08(Object eat08) {
		return findByProperty(EAT08, eat08);
	}

	public List findByEat09(Object eat09) {
		return findByProperty(EAT09, eat09);
	}

	public List findByEat10(Object eat10) {
		return findByProperty(EAT10, eat10);
	}

	public List findByEath01(Object eath01) {
		return findByProperty(EATH01, eath01);
	}

	public List findByEath02(Object eath02) {
		return findByProperty(EATH02, eath02);
	}

	public List findByEath03(Object eath03) {
		return findByProperty(EATH03, eath03);
	}

	public List findByEatt(Object eatt) {
		return findByProperty(EATT, eatt);
	}

	public List findByIsXiyan(Object isXiyan) {
		return findByProperty(IS_XIYAN, isXiyan);
	}

	public List findByZhuyaoChou(Object zhuyaoChou) {
		return findByProperty(ZHUYAO_CHOU, zhuyaoChou);
	}

	public List findByHowManyYan(Object howManyYan) {
		return findByProperty(HOW_MANY_YAN, howManyYan);
	}

	public List findByWhenXiYan(Object whenXiYan) {
		return findByProperty(WHEN_XI_YAN, whenXiYan);
	}

	public List findByHasOtherChou(Object hasOtherChou) {
		return findByProperty(HAS_OTHER_CHOU, hasOtherChou);
	}

	public List findByWhenJieYan(Object whenJieYan) {
		return findByProperty(WHEN_JIE_YAN, whenJieYan);
	}

	public List findByIsdrink(Object isdrink) {
		return findByProperty(ISDRINK, isdrink);
	}

	public List findByHowlongDrink(Object howlongDrink) {
		return findByProperty(HOWLONG_DRINK, howlongDrink);
	}

	public List findByHowmuchDrink(Object howmuchDrink) {
		return findByProperty(HOWMUCH_DRINK, howmuchDrink);
	}

	public List findByIsmustDrink(Object ismustDrink) {
		return findByProperty(ISMUST_DRINK, ismustDrink);
	}

	public List findByWork(Object work) {
		return findByProperty(WORK, work);
	}

	public List findByJiaotong(Object jiaotong) {
		return findByProperty(JIAOTONG, jiaotong);
	}

	public List findByJiawu(Object jiawu) {
		return findByProperty(JIAWU, jiawu);
	}

	public List findByTiyu01(Object tiyu01) {
		return findByProperty(TIYU01, tiyu01);
	}

	public List findByTiyu02(Object tiyu02) {
		return findByProperty(TIYU02, tiyu02);
	}

	public List findByTiyu03(Object tiyu03) {
		return findByProperty(TIYU03, tiyu03);
	}

	public List findByTiyu04(Object tiyu04) {
		return findByProperty(TIYU04, tiyu04);
	}

	public List findByZhiye01(Object zhiye01) {
		return findByProperty(ZHIYE01, zhiye01);
	}

	public List findByZhiye02(Object zhiye02) {
		return findByProperty(ZHIYE02, zhiye02);
	}

	public List findByZhiye03(Object zhiye03) {
		return findByProperty(ZHIYE03, zhiye03);
	}

	public List findByZhiye04(Object zhiye04) {
		return findByProperty(ZHIYE04, zhiye04);
	}

	public List findByZhiye05(Object zhiye05) {
		return findByProperty(ZHIYE05, zhiye05);
	}

	public List findByZhiye06(Object zhiye06) {
		return findByProperty(ZHIYE06, zhiye06);
	}

	public List findAll() {
		log.debug("finding all SurveyEat instances");
		try {
			String queryString = "from SurveyEat";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SurveyEat merge(SurveyEat detachedInstance) {
		log.debug("merging SurveyEat instance");
		try {
			SurveyEat result = (SurveyEat) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SurveyEat instance) {
		log.debug("attaching dirty SurveyEat instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SurveyEat instance) {
		log.debug("attaching clean SurveyEat instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}