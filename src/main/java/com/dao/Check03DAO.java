package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Check03 entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Check03DAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(Check03DAO.class);
	// property constants
	public static final String LABXONE0 = "labxone0";
	public static final String LABXONE1 = "labxone1";
	public static final String LABXONE2 = "labxone2";
	public static final String LABXONE3 = "labxone3";
	public static final String LABXONE4 = "labxone4";
	public static final String LABXONE5 = "labxone5";
	public static final String LABXONE6 = "labxone6";
	public static final String LABXONE7 = "labxone7";
	public static final String LABXONE8 = "labxone8";
	public static final String LABXONE9 = "labxone9";
	public static final String LABXONE10 = "labxone10";
	public static final String LABXONE11 = "labxone11";
	public static final String LABXONE12 = "labxone12";
	public static final String LABXONE13 = "labxone13";
	public static final String LABXONE14 = "labxone14";
	public static final String LABXONE15 = "labxone15";
	public static final String LABXONE16 = "labxone16";
	public static final String LABXONE17 = "labxone17";
	public static final String LABXONE18 = "labxone18";
	public static final String LABXONE19 = "labxone19";
	public static final String LABXONE20 = "labxone20";
	public static final String LABXONE21 = "labxone21";
	public static final String LABXONE22 = "labxone22";
	public static final String LABXONE23 = "labxone23";
	public static final String LABXONE24 = "labxone24";
	public static final String LABXONE25 = "labxone25";
	public static final String LABXONE26 = "labxone26";
	public static final String LABXONE27 = "labxone27";
	public static final String LABXONE28 = "labxone28";
	public static final String LABXONE29 = "labxone29";
	public static final String LABXONE30 = "labxone30";
	public static final String LABXONE31 = "labxone31";
	public static final String LABXONE32 = "labxone32";
	public static final String LABXONE33 = "labxone33";
	public static final String LABXONE34 = "labxone34";
	public static final String LABXONE35 = "labxone35";
	public static final String LABXONE36 = "labxone36";
	public static final String LABXONE37 = "labxone37";
	public static final String LABXONE38 = "labxone38";
	public static final String LABXONE39 = "labxone39";
	public static final String LABXONE40 = "labxone40";
	public static final String LABXONE41 = "labxone41";
	public static final String LABXONE42 = "labxone42";
	public static final String LABXONE43 = "labxone43";
	public static final String LABXONE44 = "labxone44";
	public static final String LABXONE45 = "labxone45";
	public static final String LABXONE46 = "labxone46";
	public static final String LABXONE47 = "labxone47";
	public static final String LABXONE48 = "labxone48";
	public static final String LABXONE49 = "labxone49";
	public static final String LABXONE50 = "labxone50";
	public static final String LABXONE51 = "labxone51";
	public static final String LABXONE52 = "labxone52";
	public static final String LABXONE53 = "labxone53";
	public static final String LABXONE54 = "labxone54";
	public static final String LABXONE55 = "labxone55";
	public static final String LABXONE56 = "labxone56";
	public static final String LABXONE57 = "labxone57";
	public static final String LABXONE58 = "labxone58";
	public static final String LABXONE59 = "labxone59";
	public static final String LABXONE60 = "labxone60";
	public static final String LABXONE61 = "labxone61";
	public static final String LABXONE62 = "labxone62";
	public static final String LABXONE63 = "labxone63";
	public static final String LABXONE64 = "labxone64";
	public static final String LABXONE65 = "labxone65";
	public static final String LABXONE66 = "labxone66";
	public static final String LABXONE67 = "labxone67";
	public static final String LABXONE68 = "labxone68";
	public static final String LABXONE69 = "labxone69";
	public static final String LABXONE70 = "labxone70";
	public static final String LABXONE71 = "labxone71";
	public static final String LABXONE72 = "labxone72";
	public static final String LABXONE73 = "labxone73";
	public static final String LABXONE74 = "labxone74";
	public static final String LABXONE75 = "labxone75";
	public static final String LABXONE76 = "labxone76";
	public static final String LABXONE77 = "labxone77";
	public static final String LABXONE78 = "labxone78";
	public static final String LABXONE79 = "labxone79";
	public static final String LABXONE80 = "labxone80";
	public static final String LABXONE81 = "labxone81";
	public static final String LABXONE82 = "labxone82";
	public static final String LABXONE83 = "labxone83";
	public static final String LABXONE84 = "labxone84";
	public static final String LABXONE85 = "labxone85";
	public static final String LABXONE86 = "labxone86";
	public static final String LABXONE87 = "labxone87";
	public static final String LABXONE88 = "labxone88";
	public static final String LABXONE89 = "labxone89";
	public static final String LABXONE90 = "labxone90";
	public static final String LABXONE91 = "labxone91";
	public static final String LABXONE92 = "labxone92";
	public static final String LABXONE93 = "labxone93";
	public static final String LABXONE94 = "labxone94";
	public static final String LABXONE95 = "labxone95";
	public static final String LABXONE96 = "labxone96";
	public static final String LABXONE97 = "labxone97";
	public static final String LABXONE98 = "labxone98";
	public static final String LABXONE99 = "labxone99";
	public static final String LABXONE100 = "labxone100";
	public static final String LABXONE101 = "labxone101";
	public static final String LABXONE102 = "labxone102";
	public static final String LABXONE103 = "labxone103";
	public static final String LABXONE104 = "labxone104";
	public static final String LABXONE105 = "labxone105";
	public static final String LABXONE106 = "labxone106";
	public static final String LABXONE107 = "labxone107";
	public static final String LABXONE108 = "labxone108";
	public static final String LABXONE109 = "labxone109";
	public static final String LABXONE110 = "labxone110";
	public static final String LABXONE111 = "labxone111";
	public static final String LABXONE112 = "labxone112";
	public static final String LABXONE113 = "labxone113";
	public static final String LABXONE114 = "labxone114";
	public static final String LABXONE115 = "labxone115";
	public static final String LABXONE116 = "labxone116";
	public static final String LABXONE117 = "labxone117";
	public static final String LABXONE118 = "labxone118";
	public static final String LABXONE119 = "labxone119";
	public static final String LABXONE120 = "labxone120";
	public static final String LABXONE121 = "labxone121";
	public static final String LABXONE122 = "labxone122";
	public static final String LABXONE123 = "labxone123";
	public static final String LABXONE124 = "labxone124";
	public static final String LABXONE125 = "labxone125";
	public static final String LABXONE126 = "labxone126";
	public static final String LABXONE127 = "labxone127";
	public static final String LABXONE128 = "labxone128";
	public static final String LABXONE129 = "labxone129";
	public static final String LABXONE130 = "labxone130";
	public static final String LABXONE131 = "labxone131";
	public static final String LABXONE132 = "labxone132";
	public static final String LABXONE133 = "labxone133";
	public static final String LABXONE134 = "labxone134";

	public void save(Check03 transientInstance) {
        
		log.debug("saving Check03 instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Check03 persistentInstance) {
		log.debug("deleting Check03 instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Check03 findById(Integer id) {
		log.debug("getting Check03 instance with id: " + id);
		try {
			Check03 instance = (Check03) getSession().get("com.dao.Check03", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Check03 instance) {
		log.debug("finding Check03 instance by example");
		try {
			List results = getSession().createCriteria("com.dao.Check03").add(
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
		log.debug("finding Check03 instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Check03 as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLabxone0(Object labxone0) {
		return findByProperty(LABXONE0, labxone0);
	}

	public List findByLabxone1(Object labxone1) {
		return findByProperty(LABXONE1, labxone1);
	}

	public List findByLabxone2(Object labxone2) {
		return findByProperty(LABXONE2, labxone2);
	}

	public List findByLabxone3(Object labxone3) {
		return findByProperty(LABXONE3, labxone3);
	}

	public List findByLabxone4(Object labxone4) {
		return findByProperty(LABXONE4, labxone4);
	}

	public List findByLabxone5(Object labxone5) {
		return findByProperty(LABXONE5, labxone5);
	}

	public List findByLabxone6(Object labxone6) {
		return findByProperty(LABXONE6, labxone6);
	}

	public List findByLabxone7(Object labxone7) {
		return findByProperty(LABXONE7, labxone7);
	}

	public List findByLabxone8(Object labxone8) {
		return findByProperty(LABXONE8, labxone8);
	}

	public List findByLabxone9(Object labxone9) {
		return findByProperty(LABXONE9, labxone9);
	}

	public List findByLabxone10(Object labxone10) {
		return findByProperty(LABXONE10, labxone10);
	}

	public List findByLabxone11(Object labxone11) {
		return findByProperty(LABXONE11, labxone11);
	}

	public List findByLabxone12(Object labxone12) {
		return findByProperty(LABXONE12, labxone12);
	}

	public List findByLabxone13(Object labxone13) {
		return findByProperty(LABXONE13, labxone13);
	}

	public List findByLabxone14(Object labxone14) {
		return findByProperty(LABXONE14, labxone14);
	}

	public List findByLabxone15(Object labxone15) {
		return findByProperty(LABXONE15, labxone15);
	}

	public List findByLabxone16(Object labxone16) {
		return findByProperty(LABXONE16, labxone16);
	}

	public List findByLabxone17(Object labxone17) {
		return findByProperty(LABXONE17, labxone17);
	}

	public List findByLabxone18(Object labxone18) {
		return findByProperty(LABXONE18, labxone18);
	}

	public List findByLabxone19(Object labxone19) {
		return findByProperty(LABXONE19, labxone19);
	}

	public List findByLabxone20(Object labxone20) {
		return findByProperty(LABXONE20, labxone20);
	}

	public List findByLabxone21(Object labxone21) {
		return findByProperty(LABXONE21, labxone21);
	}

	public List findByLabxone22(Object labxone22) {
		return findByProperty(LABXONE22, labxone22);
	}

	public List findByLabxone23(Object labxone23) {
		return findByProperty(LABXONE23, labxone23);
	}

	public List findByLabxone24(Object labxone24) {
		return findByProperty(LABXONE24, labxone24);
	}

	public List findByLabxone25(Object labxone25) {
		return findByProperty(LABXONE25, labxone25);
	}

	public List findByLabxone26(Object labxone26) {
		return findByProperty(LABXONE26, labxone26);
	}

	public List findByLabxone27(Object labxone27) {
		return findByProperty(LABXONE27, labxone27);
	}

	public List findByLabxone28(Object labxone28) {
		return findByProperty(LABXONE28, labxone28);
	}

	public List findByLabxone29(Object labxone29) {
		return findByProperty(LABXONE29, labxone29);
	}

	public List findByLabxone30(Object labxone30) {
		return findByProperty(LABXONE30, labxone30);
	}

	public List findByLabxone31(Object labxone31) {
		return findByProperty(LABXONE31, labxone31);
	}

	public List findByLabxone32(Object labxone32) {
		return findByProperty(LABXONE32, labxone32);
	}

	public List findByLabxone33(Object labxone33) {
		return findByProperty(LABXONE33, labxone33);
	}

	public List findByLabxone34(Object labxone34) {
		return findByProperty(LABXONE34, labxone34);
	}

	public List findByLabxone35(Object labxone35) {
		return findByProperty(LABXONE35, labxone35);
	}

	public List findByLabxone36(Object labxone36) {
		return findByProperty(LABXONE36, labxone36);
	}

	public List findByLabxone37(Object labxone37) {
		return findByProperty(LABXONE37, labxone37);
	}

	public List findByLabxone38(Object labxone38) {
		return findByProperty(LABXONE38, labxone38);
	}

	public List findByLabxone39(Object labxone39) {
		return findByProperty(LABXONE39, labxone39);
	}

	public List findByLabxone40(Object labxone40) {
		return findByProperty(LABXONE40, labxone40);
	}

	public List findByLabxone41(Object labxone41) {
		return findByProperty(LABXONE41, labxone41);
	}

	public List findByLabxone42(Object labxone42) {
		return findByProperty(LABXONE42, labxone42);
	}

	public List findByLabxone43(Object labxone43) {
		return findByProperty(LABXONE43, labxone43);
	}

	public List findByLabxone44(Object labxone44) {
		return findByProperty(LABXONE44, labxone44);
	}

	public List findByLabxone45(Object labxone45) {
		return findByProperty(LABXONE45, labxone45);
	}

	public List findByLabxone46(Object labxone46) {
		return findByProperty(LABXONE46, labxone46);
	}

	public List findByLabxone47(Object labxone47) {
		return findByProperty(LABXONE47, labxone47);
	}

	public List findByLabxone48(Object labxone48) {
		return findByProperty(LABXONE48, labxone48);
	}

	public List findByLabxone49(Object labxone49) {
		return findByProperty(LABXONE49, labxone49);
	}

	public List findByLabxone50(Object labxone50) {
		return findByProperty(LABXONE50, labxone50);
	}

	public List findByLabxone51(Object labxone51) {
		return findByProperty(LABXONE51, labxone51);
	}

	public List findByLabxone52(Object labxone52) {
		return findByProperty(LABXONE52, labxone52);
	}

	public List findByLabxone53(Object labxone53) {
		return findByProperty(LABXONE53, labxone53);
	}

	public List findByLabxone54(Object labxone54) {
		return findByProperty(LABXONE54, labxone54);
	}

	public List findByLabxone55(Object labxone55) {
		return findByProperty(LABXONE55, labxone55);
	}

	public List findByLabxone56(Object labxone56) {
		return findByProperty(LABXONE56, labxone56);
	}

	public List findByLabxone57(Object labxone57) {
		return findByProperty(LABXONE57, labxone57);
	}

	public List findByLabxone58(Object labxone58) {
		return findByProperty(LABXONE58, labxone58);
	}

	public List findByLabxone59(Object labxone59) {
		return findByProperty(LABXONE59, labxone59);
	}

	public List findByLabxone60(Object labxone60) {
		return findByProperty(LABXONE60, labxone60);
	}

	public List findByLabxone61(Object labxone61) {
		return findByProperty(LABXONE61, labxone61);
	}

	public List findByLabxone62(Object labxone62) {
		return findByProperty(LABXONE62, labxone62);
	}

	public List findByLabxone63(Object labxone63) {
		return findByProperty(LABXONE63, labxone63);
	}

	public List findByLabxone64(Object labxone64) {
		return findByProperty(LABXONE64, labxone64);
	}

	public List findByLabxone65(Object labxone65) {
		return findByProperty(LABXONE65, labxone65);
	}

	public List findByLabxone66(Object labxone66) {
		return findByProperty(LABXONE66, labxone66);
	}

	public List findByLabxone67(Object labxone67) {
		return findByProperty(LABXONE67, labxone67);
	}

	public List findByLabxone68(Object labxone68) {
		return findByProperty(LABXONE68, labxone68);
	}

	public List findByLabxone69(Object labxone69) {
		return findByProperty(LABXONE69, labxone69);
	}

	public List findByLabxone70(Object labxone70) {
		return findByProperty(LABXONE70, labxone70);
	}

	public List findByLabxone71(Object labxone71) {
		return findByProperty(LABXONE71, labxone71);
	}

	public List findByLabxone72(Object labxone72) {
		return findByProperty(LABXONE72, labxone72);
	}

	public List findByLabxone73(Object labxone73) {
		return findByProperty(LABXONE73, labxone73);
	}

	public List findByLabxone74(Object labxone74) {
		return findByProperty(LABXONE74, labxone74);
	}

	public List findByLabxone75(Object labxone75) {
		return findByProperty(LABXONE75, labxone75);
	}

	public List findByLabxone76(Object labxone76) {
		return findByProperty(LABXONE76, labxone76);
	}

	public List findByLabxone77(Object labxone77) {
		return findByProperty(LABXONE77, labxone77);
	}

	public List findByLabxone78(Object labxone78) {
		return findByProperty(LABXONE78, labxone78);
	}

	public List findByLabxone79(Object labxone79) {
		return findByProperty(LABXONE79, labxone79);
	}

	public List findByLabxone80(Object labxone80) {
		return findByProperty(LABXONE80, labxone80);
	}

	public List findByLabxone81(Object labxone81) {
		return findByProperty(LABXONE81, labxone81);
	}

	public List findByLabxone82(Object labxone82) {
		return findByProperty(LABXONE82, labxone82);
	}

	public List findByLabxone83(Object labxone83) {
		return findByProperty(LABXONE83, labxone83);
	}

	public List findByLabxone84(Object labxone84) {
		return findByProperty(LABXONE84, labxone84);
	}

	public List findByLabxone85(Object labxone85) {
		return findByProperty(LABXONE85, labxone85);
	}

	public List findByLabxone86(Object labxone86) {
		return findByProperty(LABXONE86, labxone86);
	}

	public List findByLabxone87(Object labxone87) {
		return findByProperty(LABXONE87, labxone87);
	}

	public List findByLabxone88(Object labxone88) {
		return findByProperty(LABXONE88, labxone88);
	}

	public List findByLabxone89(Object labxone89) {
		return findByProperty(LABXONE89, labxone89);
	}

	public List findByLabxone90(Object labxone90) {
		return findByProperty(LABXONE90, labxone90);
	}

	public List findByLabxone91(Object labxone91) {
		return findByProperty(LABXONE91, labxone91);
	}

	public List findByLabxone92(Object labxone92) {
		return findByProperty(LABXONE92, labxone92);
	}

	public List findByLabxone93(Object labxone93) {
		return findByProperty(LABXONE93, labxone93);
	}

	public List findByLabxone94(Object labxone94) {
		return findByProperty(LABXONE94, labxone94);
	}

	public List findByLabxone95(Object labxone95) {
		return findByProperty(LABXONE95, labxone95);
	}

	public List findByLabxone96(Object labxone96) {
		return findByProperty(LABXONE96, labxone96);
	}

	public List findByLabxone97(Object labxone97) {
		return findByProperty(LABXONE97, labxone97);
	}

	public List findByLabxone98(Object labxone98) {
		return findByProperty(LABXONE98, labxone98);
	}

	public List findByLabxone99(Object labxone99) {
		return findByProperty(LABXONE99, labxone99);
	}

	public List findByLabxone100(Object labxone100) {
		return findByProperty(LABXONE100, labxone100);
	}

	public List findByLabxone101(Object labxone101) {
		return findByProperty(LABXONE101, labxone101);
	}

	public List findByLabxone102(Object labxone102) {
		return findByProperty(LABXONE102, labxone102);
	}

	public List findByLabxone103(Object labxone103) {
		return findByProperty(LABXONE103, labxone103);
	}

	public List findByLabxone104(Object labxone104) {
		return findByProperty(LABXONE104, labxone104);
	}

	public List findByLabxone105(Object labxone105) {
		return findByProperty(LABXONE105, labxone105);
	}

	public List findByLabxone106(Object labxone106) {
		return findByProperty(LABXONE106, labxone106);
	}

	public List findByLabxone107(Object labxone107) {
		return findByProperty(LABXONE107, labxone107);
	}

	public List findByLabxone108(Object labxone108) {
		return findByProperty(LABXONE108, labxone108);
	}

	public List findByLabxone109(Object labxone109) {
		return findByProperty(LABXONE109, labxone109);
	}

	public List findByLabxone110(Object labxone110) {
		return findByProperty(LABXONE110, labxone110);
	}

	public List findByLabxone111(Object labxone111) {
		return findByProperty(LABXONE111, labxone111);
	}

	public List findByLabxone112(Object labxone112) {
		return findByProperty(LABXONE112, labxone112);
	}

	public List findByLabxone113(Object labxone113) {
		return findByProperty(LABXONE113, labxone113);
	}

	public List findByLabxone114(Object labxone114) {
		return findByProperty(LABXONE114, labxone114);
	}

	public List findByLabxone115(Object labxone115) {
		return findByProperty(LABXONE115, labxone115);
	}

	public List findByLabxone116(Object labxone116) {
		return findByProperty(LABXONE116, labxone116);
	}

	public List findByLabxone117(Object labxone117) {
		return findByProperty(LABXONE117, labxone117);
	}

	public List findByLabxone118(Object labxone118) {
		return findByProperty(LABXONE118, labxone118);
	}

	public List findByLabxone119(Object labxone119) {
		return findByProperty(LABXONE119, labxone119);
	}

	public List findByLabxone120(Object labxone120) {
		return findByProperty(LABXONE120, labxone120);
	}

	public List findByLabxone121(Object labxone121) {
		return findByProperty(LABXONE121, labxone121);
	}

	public List findByLabxone122(Object labxone122) {
		return findByProperty(LABXONE122, labxone122);
	}

	public List findByLabxone123(Object labxone123) {
		return findByProperty(LABXONE123, labxone123);
	}

	public List findByLabxone124(Object labxone124) {
		return findByProperty(LABXONE124, labxone124);
	}

	public List findByLabxone125(Object labxone125) {
		return findByProperty(LABXONE125, labxone125);
	}

	public List findByLabxone126(Object labxone126) {
		return findByProperty(LABXONE126, labxone126);
	}

	public List findByLabxone127(Object labxone127) {
		return findByProperty(LABXONE127, labxone127);
	}

	public List findByLabxone128(Object labxone128) {
		return findByProperty(LABXONE128, labxone128);
	}

	public List findByLabxone129(Object labxone129) {
		return findByProperty(LABXONE129, labxone129);
	}

	public List findByLabxone130(Object labxone130) {
		return findByProperty(LABXONE130, labxone130);
	}

	public List findByLabxone131(Object labxone131) {
		return findByProperty(LABXONE131, labxone131);
	}

	public List findByLabxone132(Object labxone132) {
		return findByProperty(LABXONE132, labxone132);
	}

	public List findByLabxone133(Object labxone133) {
		return findByProperty(LABXONE133, labxone133);
	}

	public List findByLabxone134(Object labxone134) {
		return findByProperty(LABXONE134, labxone134);
	}

	public List findAll() {
		log.debug("finding all Check03 instances");
		try {
			String queryString = "from Check03";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Check03 merge(Check03 detachedInstance) {
		log.debug("merging Check03 instance");
		try {
			Check03 result = (Check03) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Check03 instance) {
		log.debug("attaching dirty Check03 instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Check03 instance) {
		log.debug("attaching clean Check03 instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}