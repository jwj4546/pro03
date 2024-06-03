package com.vt.biz;

import java.util.List;

import com.vt.domain.Review;


public interface ReviewBiz {

	public List<Review> getReviewList();
	public Review getReview(int no);
	public int getTotalCount();
	public void insReview(Review review);
	public void upReview(Review review);
	public void delReview(int no);
}
