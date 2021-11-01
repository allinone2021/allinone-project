package org.allinone.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.member.service.CheckService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/register")
@Log4j2
@RequiredArgsConstructor
public class CheckContorller {

    private final CheckService checkService;

    @GetMapping("/checkid/{type}/{id}")
    public int checkID(@PathVariable(name= "type") String type, @PathVariable(name= "id") String id){

        log.info("c...........checkID Controller");
        log.info("c...........checkID "+ type);


        return checkService.checkID(type, id);
    }

    @GetMapping("/checkemail/{type}/{email}")
    public int checkEmail(@PathVariable(name= "type") String type, @PathVariable(name= "email") String email){

        log.info("c...........checkEmail Controller");
        log.info("c...........checkEmail "+ type);

        return checkService.checkEmail(type, email);
    }

    @GetMapping("/checkregnum/{regnum}")
    public int checkRegnum(@PathVariable(name= "regnum") Long regnum){

        log.info("c...........checkRegnum Controller");

        return checkService.checkRegnum(regnum);
    }
}
