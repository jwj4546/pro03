package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Product;
import com.vt.domain.ProductVO;
import com.vt.domain.ProductVO;
import com.vt.per.ProductMapper;

@Service
public class ProductService implements ProductBiz {
	
	@Autowired
	private ProductMapper productDAO;

	@Override
	public int getTotalCount() {
		return productDAO.getTotalCount();
	}

	@Override
	public List<ProductVO> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public List<ProductVO> getCategoryList(String category) {
		return productDAO.getCategoryList(category);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return productDAO.getProduct(pno);
	}

	@Override
	public void insProduct(Product product) {
		productDAO.insProduct(product);
	}

	@Override
	public void upProduct(Product product) {
		productDAO.upProduct(product);
	}

	@Override
	public void delProduct(int pno) {
		productDAO.delProduct(pno);
	}
}
