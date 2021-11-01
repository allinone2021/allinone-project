package org.allinone.qna.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.qna.domain.QnA;
import org.allinone.qna.dto.QnADTO;
import org.allinone.qna.mapper.QnAMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
public class QnAServiceImpl implements QnAService{
    private final QnAMapper qnaMapper;

    @Override
    public PageResponseDTO<QnADTO> getList(PageRequestDTO pageRequestDTO) {
        List<QnADTO> dtoList = qnaMapper.getList(pageRequestDTO).stream().map(qna -> entityToDTO(qna)).collect(Collectors.toList());
        int count = qnaMapper.getCount(pageRequestDTO);
        PageResponseDTO<QnADTO> pageResponseDTO =
                PageResponseDTO.<QnADTO>builder()
                        .dtoList(dtoList)
                        .count(count)
                        .build();
        return pageResponseDTO;
    }

    @Override
    public Long regAnswer(QnADTO qnaDTO) {
        QnA qna = dtoToEntity(qnaDTO);
        qnaMapper.insertAnswer(qna);
        return qnaDTO.getQno();
    }

    @Override
    public Long register(QnADTO qnaDTO) {
        QnA qna = dtoToEntity(qnaDTO);
        log.info(qna);
        qnaMapper.insertQnA(qna);
        Long qno = qna.getQno();
       qnaMapper.pno(qno);
            qna.getAttachList().forEach(attach -> {
            attach.setQno(qno);
            qnaMapper.insertAttach(attach);
        });
        return qnaDTO.getQno();
    }

    @Override
    public QnADTO read(Long qno) {
        QnA qna = qnaMapper.select(qno);
         log.info("============================");
         log.info("===================="+qno);
         log.info("============================");
         qnaMapper.viewCount(qno);
        if (qna != null) {
            return entityToDTO(qna);
        }
        return null;
    }

    @Override
    public QnADTO readAns(Long pno)  {
        QnA qna = qnaMapper.readAns(pno);
           log.info("============================");
        log.info("====================qno");
        log.info("======================pno"+pno);

        if (qna != null) {

           return entityToDTO(qna);
        }
        return null;
    }



    @Override
    public boolean remove(Long qno) {

        return qnaMapper.delete(qno) > 0;
    }

    @Override
    public boolean modify(QnADTO qnaDTO) {
        log.info("==================");
        log.info("qnaDTO" + qnaDTO);
        log.info("==================");
        qnaMapper.deleteAttach(qnaDTO.getQno());
        log.info("********************1");
        QnA qna = dtoToEntity(qnaDTO);
        return qnaMapper.update(dtoToEntity(qnaDTO)) > 0;
    }

    @Override
    public Long prevNum(Long nno) {
        return qnaMapper.prevNum(nno);
    }

    @Override
    public Long nextNum(Long nno) {
        return qnaMapper.nextNum(nno);
    }
}
