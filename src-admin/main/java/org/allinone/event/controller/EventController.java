package org.allinone.event.controller;

import org.allinone.event.dto.EventDTO;
import org.allinone.event.service.EventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event/*")
@Log4j2
@RequiredArgsConstructor
public class EventController {

    private final EventService eventService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/read")
    public void read(Long eno, @AuthenticationPrincipal User user, Model model) {
        model.addAttribute("eventDTO", eventService.read(eno, user.getUsername()));
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public void list(Model model, @AuthenticationPrincipal User user) {
        log.info(user);
        log.info("!!!!!!!!!!!!!!!!!!!");
        log.info("!!!!!!!!!!!!!!!!!!!");
        log.info("!!!!!!!!!!!!!!!!!!!");
        log.info("!!!!!!!!!!!!!!!!!!!");
        log.info("!!!!!!!!!!!!!!!!!!!");
        model.addAttribute("eventDTO", eventService.evtList(user.getUsername()));
        model.addAttribute("endEventDTO", eventService.endEvtList(user.getUsername()));
    }

    @PostMapping("/remove")
    public String remove(Long eno) {
        eventService.remove(eno);
        return "redirect:/event/list";
    }

    @PostMapping("/updateCheck")
    public String updateCheck(Long eno) {
        eventService.updateCheck(eno);
        return "redirect:/event/list";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/register")
    public void register() {

    }

    @PostMapping("/register")
    public String registerPost(EventDTO eventDTO, String evtDate) {
        log.info("controller!!!!!!!!!!!!!!!" + eventDTO);
        log.info("controller!!!!!!!!!!!!!!!" + eventDTO.getImage());
        eventService.register(eventDTO, evtDate);
        return "redirect:/event/list";
    }
}
