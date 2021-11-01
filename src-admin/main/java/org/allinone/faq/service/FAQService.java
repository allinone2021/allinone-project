package org.allinone.faq.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.faq.domain.FAQ;
import org.allinone.faq.dto.FAQDTO;
import org.allinone.qna.dto.QnADTO;

public interface FAQService {


    PageResponseDTO<FAQDTO> getList(PageRequestDTO pageRequestDTO);

    Long register(FAQDTO faqDTO);
    boolean remove(Long fno);
    boolean modify(FAQDTO faqDTO);

    Long prevNum(Long nno);
    Long nextNum(Long nno);

    //Domain  역할
    default FAQ dtoToEntity(FAQDTO dto){
        FAQ faq = FAQ.builder()
                .fno(dto.getFno())
                .title(dto.getTitle())
                .category(dto.getCategory())
                .content(dto.getContent())
                .build();
                return faq;
    }


    default FAQDTO entityToDTO(FAQ faq){
        FAQDTO faqDTO = FAQDTO.builder()
                .fno(faq.getFno())
                .title(faq.getTitle())
                .content(faq.getContent())
                .category(faq.getCategory())
                .build();
        return faqDTO;
    }


}
