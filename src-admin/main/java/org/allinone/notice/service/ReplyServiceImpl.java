package org.allinone.notice.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.notice.domain.Reply;
import org.allinone.notice.dto.ReplyDTO;
import org.allinone.notice.mapper.NoticeMapper;
import org.allinone.notice.mapper.ReplyMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class ReplyServiceImpl implements ReplyService {

    private final ReplyMapper replyMapper;
    private final NoticeMapper noticeMapper;


    @Override
    public Long add(ReplyDTO replyDTO) {
        Long count = replyMapper.insert(dtoToEntity(replyDTO));
        log.info(count);
        noticeMapper.updateReplyCnt(replyDTO.getNno(),1);
        return count;
    }


    @Override
    public int remove(Long rno) {
        Reply reply = replyMapper.read(rno);
        noticeMapper.updateReplyCnt(reply.getNno(),-1);
        return replyMapper.delete(rno);
    }

    @Override
    public int modify(ReplyDTO replyDTO) {
        return replyMapper.update(dtoToEntity(replyDTO));
    }

    @Override
    public PageResponseDTO<ReplyDTO> getRepliesWithNno(PageRequestDTO pageRequestDTO,Long nno) {
//        return replyMapper.getListWithNotice(nno).stream()
//                .map(reply -> entityToDTO(reply)).collect(Collectors.toList());
        List<ReplyDTO> dtoList =     replyMapper.getListWithNotice(pageRequestDTO, nno).stream()
                .map(reply -> entityToDTO(reply)).collect(Collectors.toList());

        int count = replyMapper.getCount(nno);


        PageResponseDTO<ReplyDTO> pageResponseDTO = PageResponseDTO.<ReplyDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return  pageResponseDTO;

    }
}