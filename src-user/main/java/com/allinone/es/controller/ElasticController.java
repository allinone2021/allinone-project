package com.allinone.es.controller;

import com.allinone.es.service.ElasticService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/elastic")
@Log4j2
public class ElasticController {

    private final ElasticService elasticService;

    @GetMapping("/get")
    public GetResponse get(Model model) throws IOException {
        log.info("--------c   elastic get----------");

        String index = "main_db";
        String id = "iLTHxXwBfTsmTFkU6XdO";

        log.info(elasticService.getDocument(index,id));

        return elasticService.getDocument(index,id);
    }

    @GetMapping("/search")
    public SearchResponse search() throws IOException {
        log.info("--------c   elastic search----------");

        String index = "main_db";
        String keyword = "Store";

        return elasticService.search(index,keyword);
    }

}
