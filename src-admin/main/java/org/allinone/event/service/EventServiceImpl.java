package org.allinone.event.service;

import org.allinone.event.domain.Event;
import org.allinone.event.dto.EventDTO;
import org.allinone.event.mapper.EventMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {

    private final EventMapper eventMapper;

    @Override
    public EventDTO read(Long eno, String shop) {
        return eventMapper.read(eno, shop).getEventDTO();
    }

    @Override
    public void remove(Long eno) {
        eventMapper.delete(eno);
    }

    @Override
    public void updateCheck(Long eno) {
        eventMapper.updateCheck(eno);
    }

    @Override
    public void register(EventDTO eventDTO, String evtDate) {
        String[] arr = evtDate.split("~");
        String startDate = arr[0];
        String endDate = arr[1];
        eventDTO = EventDTO.builder()
                .evtTitle(eventDTO.getEvtTitle())
                .evtShop(eventDTO.getEvtShop())
                .evtContents(eventDTO.getEvtContents())
                .startDate(startDate)
                .endDate(endDate)
                .evtMenu(eventDTO.getEvtMenu())
                .evtAmount(eventDTO.getEvtAmount())
                .evtPrice(eventDTO.getEvtPrice())
                .image(eventDTO.getImage())
                .build();

        Event event = eventDTO.getDomain();
        log.info("!!!!!!!!!event!!!!!!!!!"+event);
        eventMapper.insert(event);

        Long eno = event.getEno();
        event.getEvtAttachList().forEach(attach -> {
            attach.setEno(eno);
            eventMapper.insertAttach(attach);
            log.info("!!!!!!!!!!!attach"+attach);
        });
    }

    @Override
    public List<EventDTO> evtList(String shop) {
        List<EventDTO> eventDTOList = eventMapper.evtList(shop).stream().map(event -> event.getEventDTO()).collect(Collectors.toList());
        return eventDTOList;
    }

    @Override
    public List<EventDTO> endEvtList(String shop) {
        List<EventDTO> endEventDTOList = eventMapper.endEvtList(shop).stream().map(event -> event.getEventDTO()).collect(Collectors.toList());
        return endEventDTOList;
    }

}
