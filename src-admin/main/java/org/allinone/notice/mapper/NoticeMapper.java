package org.allinone.notice.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.notice.domain.Notice;
import org.allinone.notice.domain.NoticeAttach;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {

    void insert(Notice notice);

    List<Notice> getList(PageRequestDTO pageRequestDTO);

    Notice select(Long nno);

    int delete(Long nno);

    int update(Notice notice);

    int getCount(PageRequestDTO pageRequestDTO);

    Long prevNum(Long nno);
    Long nextNum(Long nno);

    int viewCount(Long qno); // 조회수

    int updateReplyCnt(@Param("nno") Long nno, @Param("num") int num);

    int insertAttach(NoticeAttach attach);
    int deleteAttach(Long bno);
}
