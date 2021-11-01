package org.allinone.notice.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.notice.domain.Reply;
import org.allinone.notice.dto.ReplyDTO;

import java.util.List;

public interface ReplyService {
    Long add(ReplyDTO replyDTO);

    int remove(Long rno);

    int modify(ReplyDTO replyDTO);


    PageResponseDTO<ReplyDTO> getRepliesWithNno(PageRequestDTO pageRequestDTO, Long nno);


    default Reply dtoToEntity(ReplyDTO dto){
        Reply reply = Reply.builder()
                .rno(dto.getRno())
                .nno(dto.getNno())
                .reply(dto.getReply())
                .replyer(dto.getReplyer())
                .replyDate(dto.getReplyDate())
                .modDate(dto.getModDate())
                .build();
        return reply;
    }

    default ReplyDTO entityToDTO(Reply reply) {
        ReplyDTO replyDTO = ReplyDTO.builder()
                .rno(reply.getRno())
                .nno(reply.getNno())
                .reply(reply.getReply())
                .replyer(reply.getReplyer())
                .replyDate(reply.getReplyDate())
                .modDate(reply.getModDate())
                .build();

        return replyDTO;
    }


}