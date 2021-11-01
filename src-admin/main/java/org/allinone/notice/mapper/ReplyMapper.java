package org.allinone.notice.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.notice.domain.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {
    //추가
    Long insert(Reply reply);
    //댓글 목록 출력
    List<Reply> getListWithNotice(@Param("pageRequestDTO")PageRequestDTO pageRequestDTO, @Param("nno")Long nno);

    //삭제
    int delete(Long rno);

    int getCount(Long nno);

    //수정
    int update(Reply reply);

    Reply read(Long rno); // 특정 댓글 읽기
}
