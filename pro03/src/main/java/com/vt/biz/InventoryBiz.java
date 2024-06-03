package com.vt.biz;

import java.util.List;

import com.vt.domain.CategoryVO;
import com.vt.domain.Inventory;

public interface InventoryBiz {
	int getTotalCount();
	List<Inventory> getInventoryList();
	List<CategoryVO> categoryLoading(String category);
	Inventory getInventory(int pno);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}
