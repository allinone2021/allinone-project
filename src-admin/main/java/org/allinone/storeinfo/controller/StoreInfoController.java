package org.allinone.storeinfo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.member.service.StoreService;
import org.allinone.storeinfo.dto.MenuDTO;
import org.allinone.storeinfo.dto.ReviewDTO;
import org.allinone.storeinfo.dto.StoreInfoDTO;
import org.allinone.storeinfo.service.ReviewService;
import org.allinone.storeinfo.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/store/*")
@Log4j2
@RequiredArgsConstructor
public class StoreInfoController {

    private final StoreService storeService;
    private final ReviewService reviewService;
    private final MenuService menuService;

    @GetMapping({"/info","infoModify"})
    public void read(Long sno, Model model) {
        log.info("-------------- c store read ------------");
        log.info("-------------- c store read ------------");
        log.info("-------------- "+sno+" ------------");
        log.info("-------------- c store read ------------");
        log.info("-------------- c store read ------------");

        model.addAttribute("infoDTO", storeService.readInfoSno(sno));
    }

    @PostMapping({ "infoModify"})
    public String modify(StoreInfoDTO infoDTO, RedirectAttributes redirectAttributes) {
        log.info("-------------- c store modify ------------");
        log.info("-------------- c store modify ------------");
        log.info("-------------- "+infoDTO+" ------------");
        log.info("-------------- c store modify ------------");
        log.info("-------------- c store modify ------------");

        redirectAttributes.addAttribute("sno", infoDTO.getSno());

        if (storeService.updateInfo(infoDTO)) {
            redirectAttributes.addFlashAttribute("result", "modified");
        }
        return "redirect:/store/info";
    }

    @GetMapping("/review")
    public List<ReviewDTO> review(Long sno, Model model) {
        log.info("-------------- c review list ------------");
        log.info("-------------- c review list ------------");
        log.info("-------------- "+ sno +" ------------");
        log.info("-------------- c review list ------------");
        log.info("-------------- c review list ------------");

        model.addAttribute("reviewList", reviewService.getReviewList(sno));
        return reviewService.getReviewList(sno);
    }

    @PostMapping("/review")
    public String add(ReviewDTO reviewDTO) {
        log.info("-------------- c review add ------------");
        log.info("-------------- c review add ------------");
        log.info("-------------- "+reviewDTO+" ------------");
        log.info("-------------- c review add ------------");
        log.info("-------------- c review add ------------");

        reviewService.add(reviewDTO);
        return "redirect:/store/review";
    }

    @GetMapping("/menu")
    public List<MenuDTO> menuList(Long sno, Model model) {
        log.info("-------------- c menu list  ------------");
        log.info("-------------- c menu list  ------------");
        log.info("-------------- "+sno+"  ------------");
        log.info("-------------- c menu list  ------------");
        log.info("-------------- c menu list  ------------");

        model.addAttribute("storeDTO", storeService.getReadSno(sno));
        return menuService.getMenusWithSno(sno);
    }



}
