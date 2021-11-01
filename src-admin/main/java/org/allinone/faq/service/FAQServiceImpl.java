package org.allinone.faq.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.faq.domain.FAQ;
import org.allinone.faq.dto.FAQDTO;
import org.allinone.faq.mapper.FAQMapper;
import org.allinone.faq.domain.FAQ;
import org.allinone.faq.dto.FAQDTO;
import org.allinone.notice.domain.Notice;
import org.allinone.notice.dto.NoticeDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
public class FAQServiceImpl implements FAQService {
    private final FAQMapper faqMapper;

    @Override
    public PageResponseDTO<FAQDTO> getList(PageRequestDTO pageRequestDTO) {
        log.info("~~~~~~~~~~~~~~~ s getList ~~~~~~~~~~~~~~~");
        log.info("~~~~~~~~~~~~~~~ s getList ~~~~~~~~~~~~~~~");
        List<FAQDTO> dtoList = faqMapper.getList(pageRequestDTO).stream().map(faq -> entityToDTO(faq)).collect(Collectors.toList());
        log.info(" dtoList : " + dtoList);
        int count = faqMapper.getCount(pageRequestDTO);
        log.info(" count : " + count);
        PageResponseDTO<FAQDTO> pageResponseDTO =
                PageResponseDTO.<FAQDTO>builder()
                        .dtoList(dtoList)
                        .count(count)
                        .build();
        return pageResponseDTO;
    }


    @Override
    public boolean remove(Long fno) {
        log.info("~~~~~~~~~~~~~~~ s remove ~~~~~~~~~~~~~~~");
        log.info("~~~~~~~~~~~~~~~ s remove ~~~~~~~~~~~~~~~");
        log.info(" fno : " + fno);
        return faqMapper.remove(fno) > 0;
    }


    @Override
    public Long register(FAQDTO faqDTO) {
        log.info("~~~~~~~~~~~~~~~ s register ~~~~~~~~~~~~~~~");
        log.info("~~~~~~~~~~~~~~~ s register ~~~~~~~~~~~~~~~");
        FAQ faq = dtoToEntity(faqDTO);
        log.info("faq : " + faq);
        faqMapper.insertFAQ(faq);
        return faqDTO.getFno();
    }

    @Override
    public boolean modify(FAQDTO faqDTO) {
        log.info("~~~~~~~~~~~~~~~ s modify ~~~~~~~~~~~~~~~");
        log.info("~~~~~~~~~~~~~~~ s modify ~~~~~~~~~~~~~~~");
        log.info("faqDTO : " + faqDTO);
        return faqMapper.update(dtoToEntity(faqDTO)) > 0;
    }

    @Override
    public Long prevNum(Long nno) {
        return faqMapper.prevNum(nno);
    }

    @Override
    public Long nextNum(Long nno) {
        return faqMapper.nextNum(nno);
    }


}
