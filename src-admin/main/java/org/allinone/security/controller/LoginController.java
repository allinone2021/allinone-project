package org.allinone.security.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
public class LoginController {

    @GetMapping("/customLogin")
    public void loginCustom() { //631p
        log.warn("custom login ... get");
        log.warn("custom login ... get");
        log.warn("custom login ... get");
        log.warn("custom login ... get");
        log.warn("custom login ... get");
        log.warn("custom login ... get");
    }

    @GetMapping("/accessError")
    public void accessDenied() {
        log.info("access Denied");
        log.info("access Denied");
        log.info("access Denied");
        log.info("access Denied");
        log.info("access Denied");
        log.info("access Denied");

    }
}
