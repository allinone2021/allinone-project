package org.allinone.event.mapper;

import org.allinone.event.domain.Event;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EventRestMapper {

    List<Event> list(@Param("evtShop") String evtShop, @Param("evtCheck") Long evtCheck);

}
