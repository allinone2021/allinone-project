package org.allinone.member.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.member.domain.Store;
import org.allinone.member.domain.StoreAttach;
import org.allinone.storeinfo.domain.StoreInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreMapper {

    void joinStore(Store store);

    void insertRole(String sid);

    List<Store> getList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    Store select(Long sno);

    int update(Store store);

    int status(Store store);

    int insertAttach(StoreAttach attach);

    int deleteAttach(Long bno);


    void insertInfo(StoreInfo storeInfo);

    StoreInfo selectInfo(Long sno);

    int updateInfo(StoreInfo info);

    int storeOpen(@Param("sno") Long sno, @Param("open") boolean open);

}
