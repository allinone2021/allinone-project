package org.allinone.storeinfo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.storeinfo.dto.ReviewDTO;
import org.allinone.storeinfo.mapper.ReviewMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;


    @Override
    public Long add(ReviewDTO reviewDTO) {
        log.info("-------------- s review add --------------");
        log.info("-------------- s review add --------------");
        log.info("-------------- "+reviewDTO+" --------------");
        log.info("-------------- s review add --------------");
        log.info("-------------- s review add --------------");

        return reviewMapper.insertReview(dtoToEntity(reviewDTO));
    }

    @Override
    public List<ReviewDTO> getReviewList(Long sno) {
        log.info("-------------- s review list --------------");
        log.info("-------------- s review list --------------");
        log.info("-------------- "+sno+" --------------");
        log.info("-------------- s review list --------------");
        log.info("-------------- s review list --------------");

        List<ReviewDTO> reviewList = reviewMapper.reviewList(sno).stream()
                .map(review -> entityToDTO(review)).collect(Collectors.toList());
        return reviewList;
    }


}
