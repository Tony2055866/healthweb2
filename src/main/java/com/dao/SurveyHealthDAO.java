package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * SurveyHealth entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.dao.SurveyHealth
 * @author MyEclipse Persistence Tools
 */

public class SurveyHealthDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SurveyHealthDAO.class);
	// property constants
	public static final String IS_FA_RE = "isFaRe";
	public static final String IS_TRIED = "isTried";
	public static final String IS_INAPPETENCE = "isInappetence";
	public static final String IS_TOU_TONG = "isTouTong";
	public static final String IS_TOU_YUN = "isTouYun";
	public static final String IS_XIONG_TONG = "isXiongTong";
	public static final String IS_HU_XI = "isHuXi";
	public static final String IS_KE_SOU = "isKeSou";
	public static final String IS_KE_TAN = "isKeTan";
	public static final String IS_DA_HU_LU = "isDaHuLu";
	public static final String IS_KE_SHUI = "isKeShui";
	public static final String IS_TUN_YAN_KUN_NAN = "isTunYanKunNan";
	public static final String IS_SHANG_FU_TONG = "isShangFuTong";
	public static final String IS_BIAN_MI = "isBianMi";
	public static final String IS_FU_XIE = "isFuXie";
	public static final String IS_DA_BIAN = "isDaBian";
	public static final String IS_PAI_NIAO_NAN = "isPaiNiaoNan";
	public static final String IS_NIAO_TONG = "isNiaoTong";
	public static final String IS_GUAN_JIE_TONG = "isGuanJieTong";
	public static final String IS_YAO_TONG = "isYaoTong";
	public static final String IS_SHI_MIAN = "isShiMian";
	public static final String HAS_ZHI_QI_GUAN = "hasZhiQiGuan";
	public static final String HAS_XIAO_CHUAN = "hasXiaoChuan";
	public static final String HAS_FEI_QI_ZHONG = "hasFeiQiZhong";
	public static final String HAS_FEI_JIE_HE = "hasFeiJieHe";
	public static final String HAS_FEI_BING = "hasFeiBing";
	public static final String HAS_FEI_XIN_BING = "hasFeiXinBing";
	public static final String HAS_GAO_XIE_YA = "hasGaoXieYa";
	public static final String HAS_GUAN_XIN_BING = "hasGuanXinBing";
	public static final String HAS_XIN_LI_SHUAI_JIE = "hasXinLiShuaiJie";
	public static final String HAS_ZHONG_FENG = "hasZhongFeng";
	public static final String HAS_TANG_NIAO_BING = "hasTangNiaoBing";
	public static final String HAS_WEI_YAN = "hasWeiYan";
	public static final String HAS_CHANG_DAO = "hasChangDao";
	public static final String HAS_ZHI_CHUANG = "hasZhiChuang";
	public static final String HAS_GAN_YAN = "hasGanYan";
	public static final String HAS_GAN_YING_HUA = "hasGanYingHua";
	public static final String HAS_PIN_XUE = "hasPinXue";
	public static final String HAS_SHEN_SHUAI_JIE = "hasShenShuaiJie";
	public static final String HAS_GU_SHU_SONG = "hasGuShuSong";
	public static final String HAS_TONG_FENG = "hasTongFeng";
	public static final String HAS_FEI_AI = "hasFeiAi";
	public static final String HAS_WEI_AI = "hasWeiAi";
	public static final String HAS_GAN_AI = "hasGanAi";
	public static final String HAS_DA_CHANG_AI = "hasDaChangAi";
	public static final String HAS_OTHER = "hasOther";
	public static final String HAS_QI_GUAN_YAN = "hasQiGuanYan";
	public static final String HAS_ALL_FEI_JIE_HE = "hasAllFeiJieHe";
	public static final String HAS_ATANG_NIAO_BING = "hasAtangNiaoBing";
	public static final String HAS_ALL_TANG_NIAO = "hasAllTangNiao";
	public static final String HAS_GAO_XUE_YA = "hasGaoXueYa";
	public static final String HAS_ALL_GAO_XUE_YA = "hasAllGaoXueYa";
	public static final String HAS_AGUAN_XIN_BING = "hasAguanXinBing";
	public static final String HAS_AZHONG_FENG = "hasAzhongFeng";
	public static final String HAS_AGAN_YAN = "hasAganYan";
	public static final String HAS_AFEI_AI = "hasAfeiAi";
	public static final String HAS_AGAN_AI = "hasAganAi";
	public static final String HAS_AWEI_AI = "hasAweiAi";
	public static final String HAS_ADA_CHANG_AI = "hasAdaChangAi";
	public static final String FIRST_YJ = "firstYj";
	public static final String IS_JUE_JING = "isJueJing";
	public static final String AGE_OF_M = "ageOfM";
	public static final String IS_HAS_CHILD = "isHasChild";
	public static final String IS_WEI_NAI = "isWeiNai";
	public static final String HAS_GONG_JING = "hasGongJing";
	public static final String FUYONG_CI_JS = "fuyongCiJs";
	public static final String HAS_RU_XIAN_ZS = "hasRuXianZs";
	public static final String HAS_RU_XIAN_AI = "hasRuXianAi";
	public static final String HAS_ORU_XIAN_AI = "hasOruXianAi";
	public static final String HOW_CHECK_RU_XIAN_AI = "howCheckRuXianAi";
	public static final String IS_COOK_OFTHEN = "isCookOfthen";

	public void save(SurveyHealth transientInstance) {
		log.debug("saving SurveyHealth instance");
		try {
			getSession().save(transientInstance);
			getSession().flush();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SurveyHealth persistentInstance) {
		log.debug("deleting SurveyHealth instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SurveyHealth findById(java.lang.Integer id) {
		log.debug("getting SurveyHealth instance with id: " + id);
		try {
			SurveyHealth instance = (SurveyHealth) getSession().get(
					"com.dao.SurveyHealth", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SurveyHealth instance) {
		log.debug("finding SurveyHealth instance by example");
		try {
			List results = getSession().createCriteria("com.dao.SurveyHealth")
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
		log.debug("finding SurveyHealth instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SurveyHealth as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByIsFaRe(Object isFaRe) {
		return findByProperty(IS_FA_RE, isFaRe);
	}

	public List findByIsTried(Object isTried) {
		return findByProperty(IS_TRIED, isTried);
	}

	public List findByIsInappetence(Object isInappetence) {
		return findByProperty(IS_INAPPETENCE, isInappetence);
	}

	public List findByIsTouTong(Object isTouTong) {
		return findByProperty(IS_TOU_TONG, isTouTong);
	}

	public List findByIsTouYun(Object isTouYun) {
		return findByProperty(IS_TOU_YUN, isTouYun);
	}

	public List findByIsXiongTong(Object isXiongTong) {
		return findByProperty(IS_XIONG_TONG, isXiongTong);
	}

	public List findByIsHuXi(Object isHuXi) {
		return findByProperty(IS_HU_XI, isHuXi);
	}

	public List findByIsKeSou(Object isKeSou) {
		return findByProperty(IS_KE_SOU, isKeSou);
	}

	public List findByIsKeTan(Object isKeTan) {
		return findByProperty(IS_KE_TAN, isKeTan);
	}

	public List findByIsDaHuLu(Object isDaHuLu) {
		return findByProperty(IS_DA_HU_LU, isDaHuLu);
	}

	public List findByIsKeShui(Object isKeShui) {
		return findByProperty(IS_KE_SHUI, isKeShui);
	}

	public List findByIsTunYanKunNan(Object isTunYanKunNan) {
		return findByProperty(IS_TUN_YAN_KUN_NAN, isTunYanKunNan);
	}

	public List findByIsShangFuTong(Object isShangFuTong) {
		return findByProperty(IS_SHANG_FU_TONG, isShangFuTong);
	}

	public List findByIsBianMi(Object isBianMi) {
		return findByProperty(IS_BIAN_MI, isBianMi);
	}

	public List findByIsFuXie(Object isFuXie) {
		return findByProperty(IS_FU_XIE, isFuXie);
	}

	public List findByIsDaBian(Object isDaBian) {
		return findByProperty(IS_DA_BIAN, isDaBian);
	}

	public List findByIsPaiNiaoNan(Object isPaiNiaoNan) {
		return findByProperty(IS_PAI_NIAO_NAN, isPaiNiaoNan);
	}

	public List findByIsNiaoTong(Object isNiaoTong) {
		return findByProperty(IS_NIAO_TONG, isNiaoTong);
	}

	public List findByIsGuanJieTong(Object isGuanJieTong) {
		return findByProperty(IS_GUAN_JIE_TONG, isGuanJieTong);
	}

	public List findByIsYaoTong(Object isYaoTong) {
		return findByProperty(IS_YAO_TONG, isYaoTong);
	}

	public List findByIsShiMian(Object isShiMian) {
		return findByProperty(IS_SHI_MIAN, isShiMian);
	}

	public List findByHasZhiQiGuan(Object hasZhiQiGuan) {
		return findByProperty(HAS_ZHI_QI_GUAN, hasZhiQiGuan);
	}

	public List findByHasXiaoChuan(Object hasXiaoChuan) {
		return findByProperty(HAS_XIAO_CHUAN, hasXiaoChuan);
	}

	public List findByHasFeiQiZhong(Object hasFeiQiZhong) {
		return findByProperty(HAS_FEI_QI_ZHONG, hasFeiQiZhong);
	}

	public List findByHasFeiJieHe(Object hasFeiJieHe) {
		return findByProperty(HAS_FEI_JIE_HE, hasFeiJieHe);
	}

	public List findByHasFeiBing(Object hasFeiBing) {
		return findByProperty(HAS_FEI_BING, hasFeiBing);
	}

	public List findByHasFeiXinBing(Object hasFeiXinBing) {
		return findByProperty(HAS_FEI_XIN_BING, hasFeiXinBing);
	}

	public List findByHasGaoXieYa(Object hasGaoXieYa) {
		return findByProperty(HAS_GAO_XIE_YA, hasGaoXieYa);
	}

	public List findByHasGuanXinBing(Object hasGuanXinBing) {
		return findByProperty(HAS_GUAN_XIN_BING, hasGuanXinBing);
	}

	public List findByHasXinLiShuaiJie(Object hasXinLiShuaiJie) {
		return findByProperty(HAS_XIN_LI_SHUAI_JIE, hasXinLiShuaiJie);
	}

	public List findByHasZhongFeng(Object hasZhongFeng) {
		return findByProperty(HAS_ZHONG_FENG, hasZhongFeng);
	}

	public List findByHasTangNiaoBing(Object hasTangNiaoBing) {
		return findByProperty(HAS_TANG_NIAO_BING, hasTangNiaoBing);
	}

	public List findByHasWeiYan(Object hasWeiYan) {
		return findByProperty(HAS_WEI_YAN, hasWeiYan);
	}

	public List findByHasChangDao(Object hasChangDao) {
		return findByProperty(HAS_CHANG_DAO, hasChangDao);
	}

	public List findByHasZhiChuang(Object hasZhiChuang) {
		return findByProperty(HAS_ZHI_CHUANG, hasZhiChuang);
	}

	public List findByHasGanYan(Object hasGanYan) {
		return findByProperty(HAS_GAN_YAN, hasGanYan);
	}

	public List findByHasGanYingHua(Object hasGanYingHua) {
		return findByProperty(HAS_GAN_YING_HUA, hasGanYingHua);
	}

	public List findByHasPinXue(Object hasPinXue) {
		return findByProperty(HAS_PIN_XUE, hasPinXue);
	}

	public List findByHasShenShuaiJie(Object hasShenShuaiJie) {
		return findByProperty(HAS_SHEN_SHUAI_JIE, hasShenShuaiJie);
	}

	public List findByHasGuShuSong(Object hasGuShuSong) {
		return findByProperty(HAS_GU_SHU_SONG, hasGuShuSong);
	}

	public List findByHasTongFeng(Object hasTongFeng) {
		return findByProperty(HAS_TONG_FENG, hasTongFeng);
	}

	public List findByHasFeiAi(Object hasFeiAi) {
		return findByProperty(HAS_FEI_AI, hasFeiAi);
	}

	public List findByHasWeiAi(Object hasWeiAi) {
		return findByProperty(HAS_WEI_AI, hasWeiAi);
	}

	public List findByHasGanAi(Object hasGanAi) {
		return findByProperty(HAS_GAN_AI, hasGanAi);
	}

	public List findByHasDaChangAi(Object hasDaChangAi) {
		return findByProperty(HAS_DA_CHANG_AI, hasDaChangAi);
	}

	public List findByHasOther(Object hasOther) {
		return findByProperty(HAS_OTHER, hasOther);
	}

	public List findByHasQiGuanYan(Object hasQiGuanYan) {
		return findByProperty(HAS_QI_GUAN_YAN, hasQiGuanYan);
	}

	public List findByHasAllFeiJieHe(Object hasAllFeiJieHe) {
		return findByProperty(HAS_ALL_FEI_JIE_HE, hasAllFeiJieHe);
	}

	public List findByHasAtangNiaoBing(Object hasAtangNiaoBing) {
		return findByProperty(HAS_ATANG_NIAO_BING, hasAtangNiaoBing);
	}

	public List findByHasAllTangNiao(Object hasAllTangNiao) {
		return findByProperty(HAS_ALL_TANG_NIAO, hasAllTangNiao);
	}

	public List findByHasGaoXueYa(Object hasGaoXueYa) {
		return findByProperty(HAS_GAO_XUE_YA, hasGaoXueYa);
	}

	public List findByHasAllGaoXueYa(Object hasAllGaoXueYa) {
		return findByProperty(HAS_ALL_GAO_XUE_YA, hasAllGaoXueYa);
	}

	public List findByHasAguanXinBing(Object hasAguanXinBing) {
		return findByProperty(HAS_AGUAN_XIN_BING, hasAguanXinBing);
	}

	public List findByHasAzhongFeng(Object hasAzhongFeng) {
		return findByProperty(HAS_AZHONG_FENG, hasAzhongFeng);
	}

	public List findByHasAganYan(Object hasAganYan) {
		return findByProperty(HAS_AGAN_YAN, hasAganYan);
	}

	public List findByHasAfeiAi(Object hasAfeiAi) {
		return findByProperty(HAS_AFEI_AI, hasAfeiAi);
	}

	public List findByHasAganAi(Object hasAganAi) {
		return findByProperty(HAS_AGAN_AI, hasAganAi);
	}

	public List findByHasAweiAi(Object hasAweiAi) {
		return findByProperty(HAS_AWEI_AI, hasAweiAi);
	}

	public List findByHasAdaChangAi(Object hasAdaChangAi) {
		return findByProperty(HAS_ADA_CHANG_AI, hasAdaChangAi);
	}

	public List findByFirstYj(Object firstYj) {
		return findByProperty(FIRST_YJ, firstYj);
	}

	public List findByIsJueJing(Object isJueJing) {
		return findByProperty(IS_JUE_JING, isJueJing);
	}

	public List findByAgeOfM(Object ageOfM) {
		return findByProperty(AGE_OF_M, ageOfM);
	}

	public List findByIsHasChild(Object isHasChild) {
		return findByProperty(IS_HAS_CHILD, isHasChild);
	}

	public List findByIsWeiNai(Object isWeiNai) {
		return findByProperty(IS_WEI_NAI, isWeiNai);
	}

	public List findByHasGongJing(Object hasGongJing) {
		return findByProperty(HAS_GONG_JING, hasGongJing);
	}

	public List findByFuyongCiJs(Object fuyongCiJs) {
		return findByProperty(FUYONG_CI_JS, fuyongCiJs);
	}

	public List findByHasRuXianZs(Object hasRuXianZs) {
		return findByProperty(HAS_RU_XIAN_ZS, hasRuXianZs);
	}

	public List findByHasRuXianAi(Object hasRuXianAi) {
		return findByProperty(HAS_RU_XIAN_AI, hasRuXianAi);
	}

	public List findByHasOruXianAi(Object hasOruXianAi) {
		return findByProperty(HAS_ORU_XIAN_AI, hasOruXianAi);
	}

	public List findByHowCheckRuXianAi(Object howCheckRuXianAi) {
		return findByProperty(HOW_CHECK_RU_XIAN_AI, howCheckRuXianAi);
	}

	public List findByIsCookOfthen(Object isCookOfthen) {
		return findByProperty(IS_COOK_OFTHEN, isCookOfthen);
	}

	public List findAll() {
		log.debug("finding all SurveyHealth instances");
		try {
			String queryString = "from SurveyHealth";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SurveyHealth merge(SurveyHealth detachedInstance) {
		log.debug("merging SurveyHealth instance");
		try {
			SurveyHealth result = (SurveyHealth) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SurveyHealth instance) {
		log.debug("attaching dirty SurveyHealth instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SurveyHealth instance) {
		log.debug("attaching clean SurveyHealth instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}