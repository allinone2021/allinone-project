package org.allinone.event.mapper;

import org.allinone.event.domain.Event;
import org.allinone.event.domain.EvtAttach;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EventMapper {

    Event read(@Param("eno") Long eno, @Param("shop") String shop);

    void delete(Long eno);

    void updateCheck(Long eno);

    void insert(Event event);

    List<Event> evtList(String shop);

    List<Event> endEvtList(String shop);

    int insertAttach(EvtAttach attach);

}
