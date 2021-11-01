package org.allinone.freeBoard.mapper;

import org.allinone.freeBoard.domain.BoardReply;

import java.util.List;

public interface BoardReplyMapper {

    List<BoardReply> getReplyOfFreeBoard(Long fbno);

    int insert(BoardReply reply);

    int delete(Long rno);

    int update(BoardReply reply);

    BoardReply read(Long rno);  // 특정댓글 읽기
}
