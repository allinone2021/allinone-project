package org.allinone.freeBoard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.freeBoard.domain.BoardReply;
import org.allinone.freeBoard.dto.BoardReplyDTO;
import org.allinone.freeBoard.mapper.FreeBoardMapper;
import org.allinone.freeBoard.mapper.BoardReplyMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class BoardReplyServiceImpl implements BoardReplyService {

    private final BoardReplyMapper replyMapper;
    private final FreeBoardMapper freeBoardMapper;


    @Override
    public List<BoardReplyDTO> getRepliesByFbno(Long fbno) {

        List<BoardReplyDTO> replyDTOS = replyMapper.getReplyOfFreeBoard(fbno).stream().map(reply -> entityToDTO(reply)).collect(Collectors.toList());

        return replyDTOS;
    }

    @Override
    public int add(BoardReplyDTO replyDTO) {
        freeBoardMapper.updateReplyCnt(replyDTO.getFbno(), 1);

        return replyMapper.insert(dtoToEntity(replyDTO));
    }

    @Override
    public int remove(Long rno) {

        BoardReply reply = replyMapper.read(rno);

        freeBoardMapper.updateReplyCnt(reply.getFbno(), -1);

        return replyMapper.delete(rno);
    }

    @Override
    public int modify(BoardReplyDTO replyDTO) {
        return replyMapper.update(dtoToEntity(replyDTO));
    }
}
