package org.allinone.event.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.event.dto.EventDTO;
import org.allinone.event.service.EventRestService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/eventRest/*")
@RequiredArgsConstructor
public class EventRestController {

    private final EventRestService eventRestService;

    @GetMapping("/list/{evtShop}/{evtCheck}")
    public List<EventDTO> list(@PathVariable(name = "evtShop")String evtShop,
                               @PathVariable(name = "evtCheck")Long evtCheck){
        log.info(evtShop);
        log.info(evtCheck);
        return eventRestService.list(evtShop, evtCheck);
    }

}