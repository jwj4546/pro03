package com.vt.biz;

import java.util.List;

import com.vt.domain.Product;
import com.vt.domain.ProductVO;

public interface ProductBiz {
	public int getTotalCount();
	public List<ProductVO> getProductList();
	public List<ProductVO> getCategoryList(String category);
	public ProductVO getProduct(int pno);
	public void insProduct(Product product);
	public void upProduct(Product product);
	public void delProduct(int pno);
}
