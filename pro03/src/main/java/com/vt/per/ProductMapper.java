package com.vt.per;

import java.util.List;


import com.vt.domain.Product;

public interface ProductMapper {
	public int getTotalCount();
	public List<Product> getProductList();
	public List<Product> getCategoryList(String category);
	public Product getProduct(int pno);
	public void insProduct(Product product);
	public void upProduct(Product product);
	public void delProduct(int pno);
}
