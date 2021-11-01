package org.allinone.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.dto.StoreDTO;
import org.allinone.member.service.StoreService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/store/*")
@Log4j2
@RequiredArgsConstructor
public class StoreController {

    private final StoreService storeService;

    @GetMapping("/register")
    public void registerGet(){

    }

    @PostMapping("/register")
    public String registerPost(StoreDTO storeDTO){
        log.info("storeDTO:      " + storeDTO);

        storeService.register(storeDTO);

        return "redirect:/store/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/list")
    public void getList(@ModelAttribute PageRequestDTO pageRequestDTO, Model model){
        log.info("c    getList........"+ pageRequestDTO);
        log.info("c    getList........"+ pageRequestDTO);

        PageResponseDTO<StoreDTO> responseDTO = storeService.getDTOList(pageRequestDTO);

        model.addAttribute("storeDTOList", responseDTO.getDtoList());

        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));

    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping(value = {"/read", "/modify"})
    public void read(PageRequestDTO pageRequestDTO, Long sno, Model model){
        log.info("c    read........" + pageRequestDTO);

        model.addAttribute("storeDTO", storeService.getReadSno(sno));
        model.addAttribute("storeinfoDTO", storeService.readInfoSno(sno));
    }

    @PostMapping("/modify")
    public String modify(StoreDTO storeDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes){
        log.info("----------------------------------");
        log.info("----------------------------------");
        log.warn("----------------------------------");

        if(storeDTO.getFiles().size() > 0){
            storeDTO.getFiles().forEach(dto -> log.info(dto));
        }

        log.warn("c    modify........" + storeDTO);
        log.warn("c    modify........" + pageRequestDTO);

        storeService.modify(storeDTO);

        redirectAttributes.addAttribute("sno", storeDTO.getSno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        if (pageRequestDTO.getFilterArr() != null) {
            redirectAttributes.addAttribute("filterArr", pageRequestDTO.getFilterArr());
        }

        return "redirect:/store/read";
    }


    @PostMapping("/status")
    public String status(PageRequestDTO pageRequestDTO, StoreDTO storeDTO, RedirectAttributes redirectAttributes){
        log.info("c    check........" + storeDTO);
        log.info("c    check........" + pageRequestDTO);

        storeService.status(storeDTO);

        redirectAttributes.addAttribute("sno", storeDTO.getSno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        if (pageRequestDTO.getFilterArr() != null) {
            redirectAttributes.addAttribute("filterArr", pageRequestDTO.getFilterArr());
        }
        return "redirect:/store/read";
    }
}
