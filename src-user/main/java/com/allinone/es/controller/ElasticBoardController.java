package com.allinone.es.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/es")
@Log4j2
public class ElasticBoardController {

    @GetMapping("/get")
    public void get(){
        log.info("--------c   get----------");
    }

}
