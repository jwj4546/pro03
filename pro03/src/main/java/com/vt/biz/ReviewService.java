package com.vt.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vt.domain.Review;
import com.vt.per.ReviewMapper;

@Service
public class ReviewService implements ReviewBiz {

	@Autowired 
	private ReviewMapper reviewDAO;

	@Override
	public List<Review> getReviewList() {
		return reviewDAO.getReviewList();
	}

	@Override
	public Review getReview(int no) {
		return reviewDAO.getReview(no);
	}

	@Override
	public int getTotalCount() {
		return reviewDAO.getTotalCount();
	}

	@Override
	public void insReview(Review review) {
		reviewDAO.insReview(review);
	}

	@Override
	public void upReview(Review review) {
		reviewDAO.upReview(review);
	}

	@Override
	public void delReview(int no) {
		reviewDAO.delReview(no);
	}
}
