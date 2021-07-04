package com.simpson.kisen.agency.model.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.admin.model.vo.Sales;
import com.simpson.kisen.admin.model.vo.SalesTotalPrice;
import com.simpson.kisen.agency.model.dao.AgencyDao;
import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.payment.model.vo.PaymentExt;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AgencyServiceImpl implements AgencyService {
	
	@Autowired
	private AgencyDao agencyDao;

	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertIdol(Idol idol) {
		int result =0;
		
		//1. idol 등록
		result = agencyDao.insertIdol(idol);
		if(idol.getIdolImg() != null) {
			//2. 해당 idol의 이미지 등록
			IdolImg idolImg = idol.getIdolImg();
			idolImg.setIdolNo(idol.getIdolNo());
			result = insertIdolImg(idolImg);
		}
		
		if(idol.getIdolMv().size()>0) {
			//3. 해당 idol의 뮤비 등록
			for(IdolMv mv : idol.getIdolMv()) {
				mv.setIdolNo(idol.getIdolNo());
				result = insertIdolMv(mv);
			}
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertIdolImg(IdolImg idolImg) {
		return agencyDao.insertIdolImg(idolImg);
	}

	/**
	 * mv table 추가
	 * @param idolImg
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertIdolMv(IdolMv idolMv) {
		return agencyDao.insertIdolMv(idolMv);
	}



	@Override
	public Idol selectOneIdol(String idolName) {
		return agencyDao.selectOneIdol(idolName);
	}


	@Override
	public Agency selectAgency(String fanNo) {
		return agencyDao.selectAgency(fanNo);
	}


	@Override
	public List<Idol> selectIdolList(String fanNo, Map<String, Object> param) {
		return agencyDao.selectIdolList(fanNo,param);
	}

	@Override
	public int selectIdolTotalContents(String fanNo) {
		return agencyDao.selectIdolTotalContents(fanNo);
	}

	@Override
	public Idol selectIdol(int no) {
		return agencyDao.selectIdol(no);
	}

	@Override
	public int selectPdCnt(int no) {
		return agencyDao.selectPdCnt(no);
	}

	@Override
	public int updateIdol(Idol idol) {
		int result =0;
		
		//1. idol_name change
		result = agencyDao.updateIdol(idol);
		if(idol.getIdolImg() != null) {
			//2. 해당 idol의 이미지 등록
			IdolImg idolImg = idol.getIdolImg();
			idolImg.setIdolNo(idol.getIdolNo());
			result = updateIdolImg(idolImg);
		}
		
		if(idol.getIdolMv() !=null) {
			//3. 해당 idol의 뮤비 등록
			for(IdolMv mv : idol.getIdolMv()) {
				mv.setIdolNo(idol.getIdolNo());
				result = updateIdolMv(mv);
			}
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updateIdolImg(IdolImg idolImg) {
		return agencyDao.updateIdolImg(idolImg);
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateIdolMv(IdolMv idolMv) {
		return agencyDao.updateIdolMv(idolMv);
	}

	
//	Product 관련
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertProduct(ProductImgExt product) {
		int result = 0;
		result = agencyDao.insertProduct(product);
		
		if(product.getPdImgList().size()>0) {
			for(ProductImg pdImg : product.getPdImgList()) {
				pdImg.setPdNo(product.getPdNo());
				result = insertProductImg(pdImg);
			}
		}

		if(product.getPdOptionList() !=null) {
			//3. 해당 idol의 뮤비 등록
			for(ProductOption po: product.getPdOptionList()) {
				po.setPdNo(product.getPdNo());
				result = insertProductOption(po);
			}
		}
		return result;
	}
	@Transactional(rollbackFor = Exception.class)
	public int insertProductImg(ProductImg productImg) {
		return agencyDao.insertProductImg(productImg);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertProductOption(ProductOption productOption) {
		return agencyDao.insertProductOption(productOption);
	}

	@Override
	public List<ProductImgExt> selectProductList(String fanNo, Map<String, Object> param) {
		return agencyDao.selectProductList(fanNo,param);
	}

	@Override
	public int selectProductTotalContents(String fanNo) {
		return agencyDao.selectProductTotalContents(fanNo);
	}

	@Override
	public ProductImgExt selectOneProduct(String pdNo) {
		return agencyDao.selectOneProduct(pdNo);
	}

	@Override
	public List<Idol> selectIdolNameList(String fanNo) {
		return agencyDao.selectIdolNameList(fanNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateProduct(ProductImgExt product) {
		int result =0;

		result = agencyDao.updateProduct(product);
		
		if(product.getPdImgList().size()>0) {
			for(ProductImg pdImg : product.getPdImgList()) {
				pdImg.setPdNo(product.getPdNo());
				result = updateProductImg(pdImg);
			}
		}		
		if(product.getPdOptionList() !=null) {
			for(ProductOption po: product.getPdOptionList()) {
				po.setPdNo(product.getPdNo());
				result = insertProductOption(po);
			}
		}
		
		return result;
	}
	@Transactional(rollbackFor = Exception.class)
	public int updateProductImg(ProductImg productImg) {
		return agencyDao.updateProductImg(productImg);
	}
	
	
	@Override
	public int deleteProduct(String pdNo) {
		return agencyDao.deleteProduct(pdNo);
	}

	@Override
	public int deleteOption(int optionNum) {
		return agencyDao.deleteOption(optionNum);
	}

	@Override
	public List<ProductImgExt> selectIdolProductList(Map<String, Object> param) {
		return agencyDao.selectIdolProductList(param);
	}

	@Override
	public List<ProductImgExt> selectBestProductList(String fanNo) {
		return agencyDao.selectBestProductList(fanNo);
	}

	@Override
	public List<ProductImgExt> selectSoldOutProductList(String fanNo) {
		return agencyDao.selectSoldOutProductList(fanNo);
	}

	@Override
	public List<ProductImgExt> selectRandomProductList(String fanNo) {
		return agencyDao.selectRandomProductList(fanNo);
	}

	@Override
	public int updateStock(Map<String, Integer> map) {
		return agencyDao.updateStock(map);
	}

	
	
	
	/**
	 * Sales 관련
	 */
	@Override
	public List<PaymentExt> selectSalesList(Map<String, String> param) {
		return agencyDao.selectSalesList(param);
	}

	@Override
	public int updateWaybill(Payment payment) {
		return agencyDao.updateWaybill(payment);
	}


	@Override
	public List<SalesTotalPrice> selectTotalPrice(String fanNo) {
		List<SalesTotalPrice> totalList = new ArrayList<SalesTotalPrice>();
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String preYear = Integer.toString(currentCalendar.get(Calendar.YEAR)-1);
		String nowDay = df.format(currentCalendar.get(Calendar.DATE));
		if(nowDay.equals("31")) {
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		else if(nowDay.equals("30")){
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		else if(nowDay.equals("29")){
			nowDay= df.format(currentCalendar.get(Calendar.DATE)-5);
		}
		for(int i=0 ; i<12;i++) {
			Map<String, Object> param = new HashMap<String, Object>();
			String strMonth = df.format(currentCalendar.get(Calendar.MONTH) -i+1);	//현재 달 : +1
			String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
			if(strMonth.equals("00")) {
				strMonth="12";
				strYear=preYear;
			}
			else if(strMonth.equals("-01")) {
				strMonth="11";
				strYear=preYear;
			}
			else if(strMonth.equals("-02")) {
				strMonth="10";
				strYear=preYear;
			}
			else if(strMonth.equals("-03")) {
				strMonth="09";
				strYear=preYear;
			}
			else if(strMonth.equals("-04")) {
				strMonth="08";
				strYear=preYear;
			}
			else if(strMonth.equals("-05")) {
				strMonth="07";
				strYear=preYear;
			}
			else if(strMonth.equals("-04")) {
				strMonth="06";
				strYear=preYear;
			}
			else if(strMonth.equals("-03")) {
				strMonth="05";
				strYear=preYear;
			}
			else if(strMonth.equals("-02")) {
				strMonth="04";
				strYear=preYear;
			}
			else if(strMonth.equals("-01")) {
				strMonth="03";
				strYear=preYear;
			}
			else if(strMonth.equals("-06")) {
				strMonth="02";
				strYear=preYear;
			}
			else if(strMonth.equals("-06")) {
				strMonth="01";
				strYear=preYear;
			}
			
			
			String strDate = strYear+"-" + strMonth+"-" + nowDay;
			String strMonthly= strYear+"-" + strMonth;
			
			log.info("strDate={}",strDate);
			param.put("strDate", strDate);
			param.put("fanNo", fanNo);
			SalesTotalPrice sales = agencyDao.selectTotalPrice(param);
			if (sales==null) {
				sales = new SalesTotalPrice();
				sales.setMonth(strMonthly);
			}
			totalList.add(sales);
		}
		return totalList;
	}
	
	
	
	@Override
	public List<Sales> selectDaySales(String yearMonth, String lastDay, String fanNo) {
		log.info("lastDay={}",lastDay);
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String nowDay = df.format(currentCalendar.get(Calendar.DATE));
		String strDate = yearMonth+"-"+nowDay;

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("strDate", strDate);
		param.put("fanNo", fanNo);
		
		List<Sales> salesList = agencyDao.selectDaySales(param);
		
		List<Sales> newSalesList = new ArrayList<Sales>();;
		int end = Integer.parseInt(lastDay);
		for(int i=1 ; i<=end ; i++) {
			String day = i<10 ? "0"+i  : ""+i;
			Sales sales = new Sales();
			sales.setPayDate(day);;
			sales.setTotal(0);
			newSalesList.add(sales);				
		}
		
		for(Sales s : newSalesList) {
			for(Sales s2 : salesList) {
				if (s.getPayDate().equals(s2.getPayDate())) {
					s.setTotal(s2.getTotal());
				}
			}
		}
		log.info("newSalesList={}",newSalesList);
		
		// TODO Auto-generated method stub
		return newSalesList;
	}

	@Override
	public void  insertMvLink(List<IdolMv> idolMvInsertList) {
		for(IdolMv idolMv: idolMvInsertList) {
			 agencyDao.insertIdolMv(idolMv);
		}
	}


	
	
	
}
