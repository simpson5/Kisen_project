package com.simpson.kisen.product.model.service;

import java.util.List;

import com.simpson.kisen.product.model.vo.Product;
import com.simpson.kisen.product.model.vo.ProductExt;

public interface ProductService {

	List<Product> selectProductList();

	ProductExt selectOneProduct(int no);

}
