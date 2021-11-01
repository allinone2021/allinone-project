package org.allinone.freeBoard.service;

import org.allinone.freeBoard.domain.BoardReply;
import org.allinone.freeBoard.dto.BoardReplyDTO;

import java.util.List;

public interface BoardReplyService {

    List<BoardReplyDTO> getRepliesByFbno(Long fbno);

    int add(BoardReplyDTO replyDTO);

    int remove(Long rno);

    int modify(BoardReplyDTO replyDTO);

    default BoardReplyDTO entityToDTO(BoardReply reply) {
        BoardReplyDTO replyDTO = BoardReplyDTO.builder()
                .rno(reply.getRno())
                .fbno(reply.getFbno())
                .reply(reply.getReply())
                .replyer(reply.getReplyer())
                .replyDate(reply.getReplyDate())
                .modDate(reply.getModDate())
                .build();
        return  replyDTO;
    }

    default BoardReply dtoToEntity(BoardReplyDTO dto) {
        BoardReply reply = BoardReply.builder()
                .rno(dto.getRno())
                .fbno(dto.getFbno())
                .reply(dto.getReply())
                .replyer(dto.getReplyer())
                .replyDate(dto.getReplyDate())
                .modDate(dto.getModDate())
                .build();
        return reply;
    }
}
