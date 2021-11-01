package org.allinone.event.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.event.dto.EventDTO;
import org.allinone.event.mapper.EventRestMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class EventRestServiceImpl implements EventRestService {

    private final EventRestMapper eventRestMapper;

    @Override
    public List<EventDTO> list(String evtShop, Long evtCheck) {
        log.info("~~~~~~~~~~~~~~~~~~~~~");
        log.info(evtShop);
        log.info(evtCheck);
        List<EventDTO> eventDTOList = eventRestMapper.list(evtShop, evtCheck).stream().map(event -> event.getEventDTO()).collect(Collectors.toList());
        log.info(eventDTOList);
        return eventDTOList;
    }

}