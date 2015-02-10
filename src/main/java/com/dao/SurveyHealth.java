package com.dao;

/**
 * SurveyHealth entity. @author MyEclipse Persistence Tools
 */

public class SurveyHealth implements java.io.Serializable {

	// Fields

	private Integer uid;
	private String isFaRe;
	private String isTried;
	private String isInappetence;
	private String isTouTong;
	private String isTouYun;
	private String isXiongTong;
	private String isHuXi;
	private String isKeSou;
	private String isKeTan;
	private String isDaHuLu;
	private String isKeShui;
	private String isTunYanKunNan;
	private String isShangFuTong;
	private String isBianMi;
	private String isFuXie;
	private String isDaBian;
	private String isPaiNiaoNan;
	private String isNiaoTong;
	private String isGuanJieTong;
	private String isYaoTong;
	private String isShiMian;
	private String hasZhiQiGuan;
	private String hasXiaoChuan;
	private String hasFeiQiZhong;
	private String hasFeiJieHe;
	private String hasFeiBing;
	private String hasFeiXinBing;
	private String hasGaoXieYa;
	private String hasGuanXinBing;
	private String hasXinLiShuaiJie;
	private String hasZhongFeng;
	private String hasTangNiaoBing;
	private String hasWeiYan;
	private String hasChangDao;
	private String hasZhiChuang;
	private String hasGanYan;
	private String hasGanYingHua;
	private String hasPinXue;
	private String hasShenShuaiJie;
	private String hasGuShuSong;
	private String hasTongFeng;
	private String hasFeiAi;
	private String hasWeiAi;
	private String hasGanAi;
	private String hasDaChangAi;
	private String hasOther;
	
	
	private String hasQiGuanYan;
	private String hasAllFeiJieHe;
	private String hasAtangNiaoBing;
	private String hasAllTangNiao;
	private String hasGaoXueYa;
	private String hasAllGaoXueYa;
	private String hasAguanXinBing;
	private String hasAzhongFeng;
	private String hasAganYan;
	private String hasAfeiAi;
	private String hasAganAi;
	private String hasAweiAi;
	private String hasAdaChangAi;
	
	
	private String firstYj;
	private String isJueJing;
	private String ageOfM;
	private String isHasChild;
	private String isWeiNai;
	private String hasGongJing;
	private String fuyongCiJs;
	private String hasRuXianZs;
	private String hasRuXianAi;
	private String hasOruXianAi;
	private String howCheckRuXianAi;
	private String isCookOfthen;

	// Constructors

	/** default constructor */
	public SurveyHealth() {
	}

	/** minimal constructor */
	public SurveyHealth(Integer uid) {
		this.uid = uid;
	}

	/** full constructor */
	public SurveyHealth(Integer uid, String isFaRe, String isTried,
			String isInappetence, String isTouTong, String isTouYun,
			String isXiongTong, String isHuXi, String isKeSou, String isKeTan,
			String isDaHuLu, String isKeShui, String isTunYanKunNan,
			String isShangFuTong, String isBianMi, String isFuXie,
			String isDaBian, String isPaiNiaoNan, String isNiaoTong,
			String isGuanJieTong, String isYaoTong, String isShiMian,
			String hasZhiQiGuan, String hasXiaoChuan, String hasFeiQiZhong,
			String hasFeiJieHe, String hasFeiBing, String hasFeiXinBing,
			String hasGaoXieYa, String hasGuanXinBing, String hasXinLiShuaiJie,
			String hasZhongFeng, String hasTangNiaoBing, String hasWeiYan,
			String hasChangDao, String hasZhiChuang, String hasGanYan,
			String hasGanYingHua, String hasPinXue, String hasShenShuaiJie,
			String hasGuShuSong, String hasTongFeng, String hasFeiAi,
			String hasWeiAi, String hasGanAi, String hasDaChangAi,
			String hasOther, String hasQiGuanYan, String hasAllFeiJieHe,
			String hasAtangNiaoBing, String hasAllTangNiao, String hasGaoXueYa,
			String hasAllGaoXueYa, String hasAguanXinBing,
			String hasAzhongFeng, String hasAganYan, String hasAfeiAi,
			String hasAganAi, String hasAweiAi, String hasAdaChangAi,
			String firstYj, String isJueJing, String ageOfM, String isHasChild,
			String isWeiNai, String hasGongJing, String fuyongCiJs,
			String hasRuXianZs, String hasRuXianAi, String hasOruXianAi,
			String howCheckRuXianAi, String isCookOfthen) {
		this.uid = uid;
		this.isFaRe = isFaRe;
		this.isTried = isTried;
		this.isInappetence = isInappetence;
		this.isTouTong = isTouTong;
		this.isTouYun = isTouYun;
		this.isXiongTong = isXiongTong;
		this.isHuXi = isHuXi;
		this.isKeSou = isKeSou;
		this.isKeTan = isKeTan;
		this.isDaHuLu = isDaHuLu;
		this.isKeShui = isKeShui;
		this.isTunYanKunNan = isTunYanKunNan;
		this.isShangFuTong = isShangFuTong;
		this.isBianMi = isBianMi;
		this.isFuXie = isFuXie;
		this.isDaBian = isDaBian;
		this.isPaiNiaoNan = isPaiNiaoNan;
		this.isNiaoTong = isNiaoTong;
		this.isGuanJieTong = isGuanJieTong;
		this.isYaoTong = isYaoTong;
		this.isShiMian = isShiMian;
		this.hasZhiQiGuan = hasZhiQiGuan;
		this.hasXiaoChuan = hasXiaoChuan;
		this.hasFeiQiZhong = hasFeiQiZhong;
		this.hasFeiJieHe = hasFeiJieHe;
		this.hasFeiBing = hasFeiBing;
		this.hasFeiXinBing = hasFeiXinBing;
		this.hasGaoXieYa = hasGaoXieYa;
		this.hasGuanXinBing = hasGuanXinBing;
		this.hasXinLiShuaiJie = hasXinLiShuaiJie;
		this.hasZhongFeng = hasZhongFeng;
		this.hasTangNiaoBing = hasTangNiaoBing;
		this.hasWeiYan = hasWeiYan;
		this.hasChangDao = hasChangDao;
		this.hasZhiChuang = hasZhiChuang;
		this.hasGanYan = hasGanYan;
		this.hasGanYingHua = hasGanYingHua;
		this.hasPinXue = hasPinXue;
		this.hasShenShuaiJie = hasShenShuaiJie;
		this.hasGuShuSong = hasGuShuSong;
		this.hasTongFeng = hasTongFeng;
		this.hasFeiAi = hasFeiAi;
		this.hasWeiAi = hasWeiAi;
		this.hasGanAi = hasGanAi;
		this.hasDaChangAi = hasDaChangAi;
		this.hasOther = hasOther;
		this.hasQiGuanYan = hasQiGuanYan;
		this.hasAllFeiJieHe = hasAllFeiJieHe;
		this.hasAtangNiaoBing = hasAtangNiaoBing;
		this.hasAllTangNiao = hasAllTangNiao;
		this.hasGaoXueYa = hasGaoXueYa;
		this.hasAllGaoXueYa = hasAllGaoXueYa;
		this.hasAguanXinBing = hasAguanXinBing;
		this.hasAzhongFeng = hasAzhongFeng;
		this.hasAganYan = hasAganYan;
		this.hasAfeiAi = hasAfeiAi;
		this.hasAganAi = hasAganAi;
		this.hasAweiAi = hasAweiAi;
		this.hasAdaChangAi = hasAdaChangAi;
		this.firstYj = firstYj;
		this.isJueJing = isJueJing;
		this.ageOfM = ageOfM;
		this.isHasChild = isHasChild;
		this.isWeiNai = isWeiNai;
		this.hasGongJing = hasGongJing;
		this.fuyongCiJs = fuyongCiJs;
		this.hasRuXianZs = hasRuXianZs;
		this.hasRuXianAi = hasRuXianAi;
		this.hasOruXianAi = hasOruXianAi;
		this.howCheckRuXianAi = howCheckRuXianAi;
		this.isCookOfthen = isCookOfthen;
	}

	// Property accessors

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getIsFaRe() {
		return this.isFaRe;
	}

	public void setIsFaRe(String isFaRe) {
		this.isFaRe = isFaRe;
	}

	public String getIsTried() {
		return this.isTried;
	}

	public void setIsTried(String isTried) {
		this.isTried = isTried;
	}

	public String getIsInappetence() {
		return this.isInappetence;
	}

	public void setIsInappetence(String isInappetence) {
		this.isInappetence = isInappetence;
	}

	public String getIsTouTong() {
		return this.isTouTong;
	}

	public void setIsTouTong(String isTouTong) {
		this.isTouTong = isTouTong;
	}

	public String getIsTouYun() {
		return this.isTouYun;
	}

	public void setIsTouYun(String isTouYun) {
		this.isTouYun = isTouYun;
	}

	public String getIsXiongTong() {
		return this.isXiongTong;
	}

	public void setIsXiongTong(String isXiongTong) {
		this.isXiongTong = isXiongTong;
	}

	public String getIsHuXi() {
		return this.isHuXi;
	}

	public void setIsHuXi(String isHuXi) {
		this.isHuXi = isHuXi;
	}

	public String getIsKeSou() {
		return this.isKeSou;
	}

	public void setIsKeSou(String isKeSou) {
		this.isKeSou = isKeSou;
	}

	public String getIsKeTan() {
		return this.isKeTan;
	}

	public void setIsKeTan(String isKeTan) {
		this.isKeTan = isKeTan;
	}

	public String getIsDaHuLu() {
		return this.isDaHuLu;
	}

	public void setIsDaHuLu(String isDaHuLu) {
		this.isDaHuLu = isDaHuLu;
	}

	public String getIsKeShui() {
		return this.isKeShui;
	}

	public void setIsKeShui(String isKeShui) {
		this.isKeShui = isKeShui;
	}

	public String getIsTunYanKunNan() {
		return this.isTunYanKunNan;
	}

	public void setIsTunYanKunNan(String isTunYanKunNan) {
		this.isTunYanKunNan = isTunYanKunNan;
	}

	public String getIsShangFuTong() {
		return this.isShangFuTong;
	}

	public void setIsShangFuTong(String isShangFuTong) {
		this.isShangFuTong = isShangFuTong;
	}

	public String getIsBianMi() {
		return this.isBianMi;
	}

	public void setIsBianMi(String isBianMi) {
		this.isBianMi = isBianMi;
	}

	public String getIsFuXie() {
		return this.isFuXie;
	}

	public void setIsFuXie(String isFuXie) {
		this.isFuXie = isFuXie;
	}

	public String getIsDaBian() {
		return this.isDaBian;
	}

	public void setIsDaBian(String isDaBian) {
		this.isDaBian = isDaBian;
	}

	public String getIsPaiNiaoNan() {
		return this.isPaiNiaoNan;
	}

	public void setIsPaiNiaoNan(String isPaiNiaoNan) {
		this.isPaiNiaoNan = isPaiNiaoNan;
	}

	public String getIsNiaoTong() {
		return this.isNiaoTong;
	}

	public void setIsNiaoTong(String isNiaoTong) {
		this.isNiaoTong = isNiaoTong;
	}

	public String getIsGuanJieTong() {
		return this.isGuanJieTong;
	}

	public void setIsGuanJieTong(String isGuanJieTong) {
		this.isGuanJieTong = isGuanJieTong;
	}

	public String getIsYaoTong() {
		return this.isYaoTong;
	}

	public void setIsYaoTong(String isYaoTong) {
		this.isYaoTong = isYaoTong;
	}

	public String getIsShiMian() {
		return this.isShiMian;
	}

	public void setIsShiMian(String isShiMian) {
		this.isShiMian = isShiMian;
	}

	public String getHasZhiQiGuan() {
		return this.hasZhiQiGuan;
	}

	public void setHasZhiQiGuan(String hasZhiQiGuan) {
		this.hasZhiQiGuan = hasZhiQiGuan;
	}

	public String getHasXiaoChuan() {
		return this.hasXiaoChuan;
	}

	public void setHasXiaoChuan(String hasXiaoChuan) {
		this.hasXiaoChuan = hasXiaoChuan;
	}

	public String getHasFeiQiZhong() {
		return this.hasFeiQiZhong;
	}

	public void setHasFeiQiZhong(String hasFeiQiZhong) {
		this.hasFeiQiZhong = hasFeiQiZhong;
	}

	public String getHasFeiJieHe() {
		return this.hasFeiJieHe;
	}

	public void setHasFeiJieHe(String hasFeiJieHe) {
		this.hasFeiJieHe = hasFeiJieHe;
	}

	public String getHasFeiBing() {
		return this.hasFeiBing;
	}

	public void setHasFeiBing(String hasFeiBing) {
		this.hasFeiBing = hasFeiBing;
	}

	public String getHasFeiXinBing() {
		return this.hasFeiXinBing;
	}

	public void setHasFeiXinBing(String hasFeiXinBing) {
		this.hasFeiXinBing = hasFeiXinBing;
	}

	public String getHasGaoXieYa() {
		return this.hasGaoXieYa;
	}

	public void setHasGaoXieYa(String hasGaoXieYa) {
		this.hasGaoXieYa = hasGaoXieYa;
	}

	public String getHasGuanXinBing() {
		return this.hasGuanXinBing;
	}

	public void setHasGuanXinBing(String hasGuanXinBing) {
		this.hasGuanXinBing = hasGuanXinBing;
	}

	public String getHasXinLiShuaiJie() {
		return this.hasXinLiShuaiJie;
	}

	public void setHasXinLiShuaiJie(String hasXinLiShuaiJie) {
		this.hasXinLiShuaiJie = hasXinLiShuaiJie;
	}

	public String getHasZhongFeng() {
		return this.hasZhongFeng;
	}

	public void setHasZhongFeng(String hasZhongFeng) {
		this.hasZhongFeng = hasZhongFeng;
	}

	public String getHasTangNiaoBing() {
		return this.hasTangNiaoBing;
	}

	public void setHasTangNiaoBing(String hasTangNiaoBing) {
		this.hasTangNiaoBing = hasTangNiaoBing;
	}

	public String getHasWeiYan() {
		return this.hasWeiYan;
	}

	public void setHasWeiYan(String hasWeiYan) {
		this.hasWeiYan = hasWeiYan;
	}

	public String getHasChangDao() {
		return this.hasChangDao;
	}

	public void setHasChangDao(String hasChangDao) {
		this.hasChangDao = hasChangDao;
	}

	public String getHasZhiChuang() {
		return this.hasZhiChuang;
	}

	public void setHasZhiChuang(String hasZhiChuang) {
		this.hasZhiChuang = hasZhiChuang;
	}

	public String getHasGanYan() {
		return this.hasGanYan;
	}

	public void setHasGanYan(String hasGanYan) {
		this.hasGanYan = hasGanYan;
	}

	public String getHasGanYingHua() {
		return this.hasGanYingHua;
	}

	public void setHasGanYingHua(String hasGanYingHua) {
		this.hasGanYingHua = hasGanYingHua;
	}

	public String getHasPinXue() {
		return this.hasPinXue;
	}

	public void setHasPinXue(String hasPinXue) {
		this.hasPinXue = hasPinXue;
	}

	public String getHasShenShuaiJie() {
		return this.hasShenShuaiJie;
	}

	public void setHasShenShuaiJie(String hasShenShuaiJie) {
		this.hasShenShuaiJie = hasShenShuaiJie;
	}

	public String getHasGuShuSong() {
		return this.hasGuShuSong;
	}

	public void setHasGuShuSong(String hasGuShuSong) {
		this.hasGuShuSong = hasGuShuSong;
	}

	public String getHasTongFeng() {
		return this.hasTongFeng;
	}

	public void setHasTongFeng(String hasTongFeng) {
		this.hasTongFeng = hasTongFeng;
	}

	public String getHasFeiAi() {
		return this.hasFeiAi;
	}

	public void setHasFeiAi(String hasFeiAi) {
		this.hasFeiAi = hasFeiAi;
	}

	public String getHasWeiAi() {
		return this.hasWeiAi;
	}

	public void setHasWeiAi(String hasWeiAi) {
		this.hasWeiAi = hasWeiAi;
	}

	public String getHasGanAi() {
		return this.hasGanAi;
	}

	public void setHasGanAi(String hasGanAi) {
		this.hasGanAi = hasGanAi;
	}

	public String getHasDaChangAi() {
		return this.hasDaChangAi;
	}

	public void setHasDaChangAi(String hasDaChangAi) {
		this.hasDaChangAi = hasDaChangAi;
	}

	public String getHasOther() {
		return this.hasOther;
	}

	public void setHasOther(String hasOther) {
		this.hasOther = hasOther;
	}

	public String getHasQiGuanYan() {
		return this.hasQiGuanYan;
	}

	public void setHasQiGuanYan(String hasQiGuanYan) {
		this.hasQiGuanYan = hasQiGuanYan;
	}

	public String getHasAllFeiJieHe() {
		return this.hasAllFeiJieHe;
	}

	public void setHasAllFeiJieHe(String hasAllFeiJieHe) {
		this.hasAllFeiJieHe = hasAllFeiJieHe;
	}

	public String getHasAtangNiaoBing() {
		return this.hasAtangNiaoBing;
	}

	public void setHasAtangNiaoBing(String hasAtangNiaoBing) {
		this.hasAtangNiaoBing = hasAtangNiaoBing;
	}

	public String getHasAllTangNiao() {
		return this.hasAllTangNiao;
	}

	public void setHasAllTangNiao(String hasAllTangNiao) {
		this.hasAllTangNiao = hasAllTangNiao;
	}

	public String getHasGaoXueYa() {
		return this.hasGaoXueYa;
	}

	public void setHasGaoXueYa(String hasGaoXueYa) {
		this.hasGaoXueYa = hasGaoXueYa;
	}

	public String getHasAllGaoXueYa() {
		return this.hasAllGaoXueYa;
	}

	public void setHasAllGaoXueYa(String hasAllGaoXueYa) {
		this.hasAllGaoXueYa = hasAllGaoXueYa;
	}

	public String getHasAguanXinBing() {
		return this.hasAguanXinBing;
	}

	public void setHasAguanXinBing(String hasAguanXinBing) {
		this.hasAguanXinBing = hasAguanXinBing;
	}

	public String getHasAzhongFeng() {
		return this.hasAzhongFeng;
	}

	public void setHasAzhongFeng(String hasAzhongFeng) {
		this.hasAzhongFeng = hasAzhongFeng;
	}

	public String getHasAganYan() {
		return this.hasAganYan;
	}

	public void setHasAganYan(String hasAganYan) {
		this.hasAganYan = hasAganYan;
	}

	public String getHasAfeiAi() {
		return this.hasAfeiAi;
	}

	public void setHasAfeiAi(String hasAfeiAi) {
		this.hasAfeiAi = hasAfeiAi;
	}

	public String getHasAganAi() {
		return this.hasAganAi;
	}

	public void setHasAganAi(String hasAganAi) {
		this.hasAganAi = hasAganAi;
	}

	public String getHasAweiAi() {
		return this.hasAweiAi;
	}

	public void setHasAweiAi(String hasAweiAi) {
		this.hasAweiAi = hasAweiAi;
	}

	public String getHasAdaChangAi() {
		return this.hasAdaChangAi;
	}

	public void setHasAdaChangAi(String hasAdaChangAi) {
		this.hasAdaChangAi = hasAdaChangAi;
	}

	public String getFirstYj() {
		return this.firstYj;
	}

	public void setFirstYj(String firstYj) {
		this.firstYj = firstYj;
	}

	public String getIsJueJing() {
		return this.isJueJing;
	}

	public void setIsJueJing(String isJueJing) {
		this.isJueJing = isJueJing;
	}

	public String getAgeOfM() {
		return this.ageOfM;
	}

	public void setAgeOfM(String ageOfM) {
		this.ageOfM = ageOfM;
	}

	public String getIsHasChild() {
		return this.isHasChild;
	}

	public void setIsHasChild(String isHasChild) {
		this.isHasChild = isHasChild;
	}

	public String getIsWeiNai() {
		return this.isWeiNai;
	}

	public void setIsWeiNai(String isWeiNai) {
		this.isWeiNai = isWeiNai;
	}

	public String getHasGongJing() {
		return this.hasGongJing;
	}

	public void setHasGongJing(String hasGongJing) {
		this.hasGongJing = hasGongJing;
	}

	public String getFuyongCiJs() {
		return this.fuyongCiJs;
	}

	public void setFuyongCiJs(String fuyongCiJs) {
		this.fuyongCiJs = fuyongCiJs;
	}

	public String getHasRuXianZs() {
		return this.hasRuXianZs;
	}

	public void setHasRuXianZs(String hasRuXianZs) {
		this.hasRuXianZs = hasRuXianZs;
	}

	public String getHasRuXianAi() {
		return this.hasRuXianAi;
	}

	public void setHasRuXianAi(String hasRuXianAi) {
		this.hasRuXianAi = hasRuXianAi;
	}

	public String getHasOruXianAi() {
		return this.hasOruXianAi;
	}

	public void setHasOruXianAi(String hasOruXianAi) {
		this.hasOruXianAi = hasOruXianAi;
	}

	public String getHowCheckRuXianAi() {
		return this.howCheckRuXianAi;
	}

	public void setHowCheckRuXianAi(String howCheckRuXianAi) {
		this.howCheckRuXianAi = howCheckRuXianAi;
	}

	public String getIsCookOfthen() {
		return this.isCookOfthen;
	}

	public void setIsCookOfthen(String isCookOfthen) {
		this.isCookOfthen = isCookOfthen;
	}

	@Override
	public String toString() {
		return "SurveyHealth [uid=" + uid + ", isFaRe=" + isFaRe + ", isTried="
				+ isTried + ", isInappetence=" + isInappetence + ", isTouTong="
				+ isTouTong + ", isTouYun=" + isTouYun + ", isXiongTong="
				+ isXiongTong + ", isHuXi=" + isHuXi + ", isKeSou=" + isKeSou
				+ ", isKeTan=" + isKeTan + ", isDaHuLu=" + isDaHuLu
				+ ", isKeShui=" + isKeShui + ", isTunYanKunNan="
				+ isTunYanKunNan + ", isShangFuTong=" + isShangFuTong
				+ ", isBianMi=" + isBianMi + ", isFuXie=" + isFuXie
				+ ", isDaBian=" + isDaBian + ", isPaiNiaoNan=" + isPaiNiaoNan
				+ ", isNiaoTong=" + isNiaoTong + ", isGuanJieTong="
				+ isGuanJieTong + ", isYaoTong=" + isYaoTong + ", isShiMian="
				+ isShiMian + ", hasZhiQiGuan=" + hasZhiQiGuan
				+ ", hasXiaoChuan=" + hasXiaoChuan + ", hasFeiQiZhong="
				+ hasFeiQiZhong + ", hasFeiJieHe=" + hasFeiJieHe
				+ ", hasFeiBing=" + hasFeiBing + ", hasFeiXinBing="
				+ hasFeiXinBing + ", hasGaoXieYa=" + hasGaoXieYa
				+ ", hasGuanXinBing=" + hasGuanXinBing + ", hasXinLiShuaiJie="
				+ hasXinLiShuaiJie + ", hasZhongFeng=" + hasZhongFeng
				+ ", hasTangNiaoBing=" + hasTangNiaoBing + ", hasWeiYan="
				+ hasWeiYan + ", hasChangDao=" + hasChangDao
				+ ", hasZhiChuang=" + hasZhiChuang + ", hasGanYan=" + hasGanYan
				+ ", hasGanYingHua=" + hasGanYingHua + ", hasPinXue="
				+ hasPinXue + ", hasShenShuaiJie=" + hasShenShuaiJie
				+ ", hasGuShuSong=" + hasGuShuSong + ", hasTongFeng="
				+ hasTongFeng + ", hasFeiAi=" + hasFeiAi + ", hasWeiAi="
				+ hasWeiAi + ", hasGanAi=" + hasGanAi + ", hasDaChangAi="
				+ hasDaChangAi + ", hasOther=" + hasOther + ", hasQiGuanYan="
				+ hasQiGuanYan + ", hasAllFeiJieHe=" + hasAllFeiJieHe
				+ ", hasAtangNiaoBing=" + hasAtangNiaoBing
				+ ", hasAllTangNiao=" + hasAllTangNiao + ", hasGaoXueYa="
				+ hasGaoXueYa + ", hasAllGaoXueYa=" + hasAllGaoXueYa
				+ ", hasAguanXinBing=" + hasAguanXinBing + ", hasAzhongFeng="
				+ hasAzhongFeng + ", hasAganYan=" + hasAganYan + ", hasAfeiAi="
				+ hasAfeiAi + ", hasAganAi=" + hasAganAi + ", hasAweiAi="
				+ hasAweiAi + ", hasAdaChangAi=" + hasAdaChangAi + ", firstYj="
				+ firstYj + ", isJueJing=" + isJueJing + ", ageOfM=" + ageOfM
				+ ", isHasChild=" + isHasChild + ", isWeiNai=" + isWeiNai
				+ ", hasGongJing=" + hasGongJing + ", fuyongCiJs=" + fuyongCiJs
				+ ", hasRuXianZs=" + hasRuXianZs + ", hasRuXianAi="
				+ hasRuXianAi + ", hasOruXianAi=" + hasOruXianAi
				+ ", howCheckRuXianAi=" + howCheckRuXianAi + ", isCookOfthen="
				+ isCookOfthen + "]";
	}

	
}