package org.allinone.storeinfo.mapper;

import org.allinone.storeinfo.domain.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {

    //추가
    int insertMenu(Menu menu);

    //목록
    List<Menu> getListWithStore(Long sno);

    //수정
    int updateMenu(Menu menu);

    //삭제
    int deleteMenu(Long mno);

    //품절 업데이트
    int soldOutMenu(@Param("mno") Long mno, @Param("soldOut") boolean soldOut);

}
