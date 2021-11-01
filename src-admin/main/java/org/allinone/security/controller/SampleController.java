package org.allinone.security.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/sample")
public class SampleController {

    @GetMapping("/doAll")
    public void doAll() {
        log.warn("doAll....................");
    }

    @PreAuthorize("isAuthenticated()")  //인증된(로그인한) 모든 사용자
    @GetMapping("/doMember")
    public void doMember() {
        log.warn("doMember....................");
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")  //해당 권한 있는 사용자
    @GetMapping("/doAdmin")
    public void doAdmin() {
        log.warn("doAdmin....................");
    }

}