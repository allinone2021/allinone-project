package org.allinone.event.service;

import org.allinone.event.dto.EventDTO;

import java.util.List;

public interface EventRestService {

    List<EventDTO> list(String evtShop, Long evtCheck);

}
