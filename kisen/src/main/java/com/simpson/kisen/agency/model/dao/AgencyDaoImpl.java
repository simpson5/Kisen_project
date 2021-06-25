package com.simpson.kisen.agency.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simpson.kisen.agency.model.vo.Agency;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.idol.model.vo.IdolImg;
import com.simpson.kisen.idol.model.vo.IdolMv;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AgencyDaoImpl implements AgencyDao {
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public List<Idol> selectIdolList(String fanNo,Map<String, Object> param) {
		List<Idol> idolList=null;
		if(param !=null) {
			int offset = (int)param.get("offset");
			int limit = (int)param.get("limit");
			RowBounds rowBounds = new RowBounds(offset, limit);	
			idolList = session.selectList("agency-artist.selectIdolList",fanNo,rowBounds);
		}
		else {
			idolList = session.selectList("agency-artist.selectIdolList",fanNo);
		}
		log.info("IdolList@dao={}",idolList);
		return idolList;
	}
	
	@Override
	public int insertIdol(Idol idol) {
		return session.insert("agency-artist.insertIdol", idol);
	}

	@Override
	public int insertIdolImg(IdolImg idolImg) {
		return session.insert("agency-artist.insertIdolImg",idolImg);
	}

	@Override
	public Idol selectOneIdol(String idolName) {
		return session.selectOne("agency-artist.selectOneIdol",idolName);
	}

	@Override
	public int insertIdolMv(IdolMv idolMv) {
		return session.insert("agency-artist.insertIdolMv",idolMv);
	}

	@Override
	public Agency selectAgency(String fanNo) {
		return session.selectOne("agency.selectAgency",fanNo);
	}

	@Override
	public int selectIdolTotalContents(String fanNo) {
		return session.selectOne("agency-artist.selectIdolTotalContents",fanNo);
	}

	@Override
	public Idol selectIdol(int idolNo) {
		return session.selectOne("agency-artist.selectIdol",idolNo);
	}

	@Override
	public int selectPdCnt(int idolNo) {
		return session.selectOne("agency.selectPdCnt",idolNo);
	}

	@Override
	public int updateIdol(Idol idol) {
		return session.update("agency-artist.updateIdol",idol);
	}

	@Override
	public int updateIdolImg(IdolImg idolImg) {
		return session.update("agency-artist.updateIdolImg",idolImg);
	}

	@Override
	public int updateIdolMv(IdolMv idolMv) {
		return session.update("agency-artist.updateIdolMv",idolMv);
	}

	@Override
	public List<Idol> selectIdolNameList(String fanNo) {
		return session.selectList("agency-artist.selectIdolNameList", fanNo);
	}

	
//	상품
	@Override
	public int insertProduct(ProductImgExt product) {
		return session.insert("agency-product.insertProduct", product);
	}

	@Override
	public int insertProductImg(ProductImg productImg) {
		return session.insert("agency-product.insertProductImg", productImg);
	}

	@Override
	public List<ProductImgExt> selectProductList(String fanNo, Map<String, Object> param) {
		return session.selectList("agency-product.selectProductList", fanNo);
	}

	@Override
	public int selectProductTotalContents(String fanNo) {
		return session.selectOne("agency-product.selectProductTotalContents", fanNo);
	}

	@Override
	public ProductImgExt selectOneProduct(String pdNo) {
		return session.selectOne("agency-product.selectOneProduct", pdNo);
	}

	@Override
	public int updateProduct(ProductImgExt product) {
		return session.update("agency-product.updateIdolMv",product);
	}

	@Override
	public int updateProductImg(ProductImg productImg) {
		return session.update("agency-product.updateProductImg",productImg);
	}

	@Override
	public int deleteProduct(String pdNo) {
		return session.delete("agency-product.deleteProduct",pdNo);
	}

	@Override
	public int insertProductOption(ProductOption productOption) {
		return session.insert("agency-product.insertProductOption", productOption);
	}

	@Override
	public int updateProductOption(ProductOption productOption) {
		return session.update("agency-product.updateProductOption", productOption);
	}

	@Override
	public int deleteOption(int optionNum) {
		return session.update("agency-product.deleteOption", optionNum);
	}

	@Override
	public List<ProductImgExt> selectIdolProductList(Map<String, Object> param) {
		return session.selectList("agency-product.selectIdolProductList", param);
	}

	
}
