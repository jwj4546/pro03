package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Product;
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
	public List<Product> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public List<Product> getCategoryList(String category) {
		return productDAO.getCategoryList(category);
	}

	@Override
	public Product getProduct(int pno) {
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
