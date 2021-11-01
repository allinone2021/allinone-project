package org.allinone.faq.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.faq.domain.FAQ;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FAQMapper {


    int getCount(PageRequestDTO pageRequestDTO); // total

    List<FAQ> getList(PageRequestDTO pageRequestDTO);  // 리스트

    void insertFAQ(FAQ faq);  //  자주묻는 질문 등록

    int remove(Long fno);  // 삭제

    int update(FAQ faq);  // 수정

    Long prevNum(Long fno);

    Long nextNum(Long fno);


}
