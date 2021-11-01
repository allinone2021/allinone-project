package org.allinone.storeinfo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.storeinfo.dto.MenuDTO;
import org.allinone.storeinfo.service.MenuService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/menus")
@RequiredArgsConstructor
public class MenuController {

    private final MenuService menuService;

    @GetMapping("/list/{sno}")
    public List<MenuDTO> getStoreMenus(@PathVariable(name = "sno") Long sno) {
        log.info("-------------- c getStoreMenus --------------");
        log.info("-------------- c getStoreMenus --------------");
        log.info("-------------- "+ sno +" --------------");
        log.info("-------------- c getStoreMenus --------------");
        log.info("-------------- c getStoreMenus --------------");

        return menuService.getMenusWithSno(sno);
    }

    @PostMapping("")
    public int add(@RequestBody MenuDTO menuDTO) {
        log.info("-------------- c  menu add --------------");
        log.info("-------------- c  menu add --------------");
        log.info("-------------- "+ menuDTO +" --------------");
        log.info("-------------- c  menu add --------------");
        log.info("-------------- c  menu add --------------");

        return menuService.add(menuDTO);
    }

    @DeleteMapping("/{mno}")
    public String remove(@PathVariable(name = "mno") Long mno) {
        log.info("-------------- c menu remove --------------");
        log.info("-------------- c menu remove --------------");
        log.info("-------------- "+ mno +" --------------");
        log.info("-------------- c menu remove --------------");
        log.info("-------------- c menu remove --------------");

        menuService.remove(mno);
        return "success";
    }

    @PutMapping("/{mno}")
    public String modify(@PathVariable(name = "mno") Long mno,
                         @RequestBody MenuDTO menuDTO) {
        log.info("-------------- c menu modify ------------");
        log.info("-------------- c menu modify ------------");
        log.info("-------------- "+mno+" ------------");
        log.info(menuDTO);
        log.info("-------------- c menu modify ------------");
        log.info("-------------- c menu modify ------------");
        menuService.modify(menuDTO);
        return "success";
    }

    @PutMapping("/{mno}/{soldOut}")
    public String updateSoldOut(@PathVariable(name = "mno") Long mno, @PathVariable(name = "soldOut") boolean soldOut) {
        log.info("-------------- c menu soldOut ------------");
        log.info("-------------- c menu soldOut ------------");
        log.info("-------------- "+mno+soldOut+" ------------");
        log.info("-------------- c menu soldOut ------------");
        log.info("-------------- c menu soldOut ------------");
        menuService.updateSoldOut(mno, soldOut);
        return "success";
    }



}