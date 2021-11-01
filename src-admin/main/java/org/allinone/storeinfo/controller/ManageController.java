package org.allinone.storeinfo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.member.service.StoreService;
import org.allinone.storeinfo.dto.RegionDTO;
import org.allinone.storeinfo.service.ManageService;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("/manage")
@RequiredArgsConstructor
public class ManageController {

    private final StoreService storeService;
    private final ManageService manageService;

    @PutMapping("/{sno}/{open}")
    public String updateOpen(@PathVariable(name = "sno") Long sno, @PathVariable(name = "open") boolean open) {
        log.info("-------------- c updateOpen --------------");
        log.info("-------------- " + sno + " " + open + " --------------");
        log.info("-------------- c updateOpen --------------");
        storeService.storeOpen(sno, open);
        return "success";
    }

    @GetMapping("/city")
    public List getCityList() {
        log.info("-------------- c getCityList --------------");
        log.info("-------------- c getCityList --------------");
        log.info("-------------- c getCityList --------------");
        return manageService.getCities();
    }

    @PutMapping("/city/countylist")
    public List getCountyList(@RequestBody HashMap<String, String> map) {
        log.info("-------------- c getCountyList --------------");
        log.info("-------------- c getCountyList --------------");
        log.info("-------------- c getCountyList --------------");
        return manageService.getCounties(map.get("city"));
    }

    @PutMapping("/city/cityCode")
    public int getCityCode(@RequestBody RegionDTO regionDTO) {
        log.info("-------------- c getCityCode --------------");
        log.info("-------------- c getCityCode --------------");
        log.info("-------------- c getCityCode --------------");
        log.info(regionDTO);

        int cityCode = manageService.getCityCode(regionDTO);
        log.info(cityCode);

        return cityCode;
    }


}
