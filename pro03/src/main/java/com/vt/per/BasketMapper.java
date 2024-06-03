package com.vt.per;

import java.util.List;


import com.vt.domain.Basket;

public interface BasketMapper {
	public int getTotalCount();
	public List<Basket> getBasketList();
	public Basket getBasket(int bno);
	public void insBasket(Basket basket);
	public void upBasket(Basket basket);
	public void delBasket(int bno);
}
