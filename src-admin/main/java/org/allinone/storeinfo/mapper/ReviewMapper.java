package org.allinone.storeinfo.mapper;

import org.allinone.storeinfo.domain.Review;

import java.util.List;

public interface ReviewMapper {

    Long insertReview(Review review);

    List<Review> reviewList(Long sno);


}
