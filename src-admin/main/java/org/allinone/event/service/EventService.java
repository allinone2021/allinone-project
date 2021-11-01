package org.allinone.event.service;

import org.allinone.event.domain.Event;
import org.allinone.event.dto.EventDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface EventService {

    EventDTO read(Long eno, String shop);

    void remove(Long eno);

    void updateCheck(Long eno);

    void register(EventDTO eventDTO, String evtDate);

    List<EventDTO> evtList(String shop);

    List<EventDTO> endEvtList(String shop);
}
