package org.allinone.storeinfo.service;

import org.allinone.storeinfo.domain.Review;
import org.allinone.storeinfo.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {

    Long add(ReviewDTO reviewDTO);

    List<ReviewDTO> getReviewList(Long sno);

//    PageResponseDTO<ReviewDTO> getDTOList(PageRequestDTO pageRequestDTO, Long sno);

    default Review dtoToEntity(ReviewDTO dto) {
        Review review = Review.builder()
                .sno(dto.getSno())
                .rno(dto.getRno())
                .writer(dto.getWriter())
                .content(dto.getContent())
                .regdate(dto.getRegdate())
                .todayCnt(dto.getTodayCnt())
                .totalCnt(dto.getTotalCnt())
                .build();
        return review;
    }

    default ReviewDTO entityToDTO(Review review) {
        ReviewDTO reviewDTO = ReviewDTO.builder()
                .sno(review.getSno())
                .rno(review.getRno())
                .writer(review.getWriter())
                .content(review.getContent())
                .regdate(review.getRegdate())
                .todayCnt(review.getTodayCnt())
                .totalCnt(review.getTotalCnt())
                .build();
        return reviewDTO;
    }

}
