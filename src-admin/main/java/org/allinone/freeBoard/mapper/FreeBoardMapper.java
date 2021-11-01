package org.allinone.freeBoard.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.freeBoard.domain.FreeBoard;
import org.allinone.freeBoard.domain.FreeBoardAttach;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FreeBoardMapper {

    void insert(FreeBoard freeBoard);

    int insertAttach(FreeBoardAttach attach);

    int deleteAttach(Long fbno);

    List<FreeBoard> getList(PageRequestDTO pageRequestDTO);

    FreeBoard select(Long fbno);

    int delete(Long fbno);

    int update(FreeBoard freeBoard);

    int updateReplyCnt(@Param("fbno") Long fbno, @Param("num") int num);

    int getCount(PageRequestDTO pageRequestDTO);

    Long prevNum(Long fbno);
    Long nextNum(Long fbno);
}
