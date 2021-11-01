package org.allinone.freeBoard.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.freeBoard.dto.FreeBoardDTO;
import org.allinone.freeBoard.service.FreeBoardService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@RequestMapping("/freeBoard/*")
@RequiredArgsConstructor
@Controller
public class FreeBoardController {
    private final FreeBoardService freeBoardService;


    @PostMapping("/register")
    public String registerPost(FreeBoardDTO freeBoardDTO, RedirectAttributes redirectAttributes) {
        log.info("======================  FreeBoardController registerPost  =======================");
        log.info("======================  FreeBoardController registerPost  =======================");
        log.info("freeBoardDTO : " + freeBoardDTO);
        Long fbno = freeBoardService.register(freeBoardDTO);

        log.info(fbno);
        redirectAttributes.addFlashAttribute("result",fbno);
        return "redirect:/freeBoard/list";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public void getList(PageRequestDTO pageRequestDTO, Model model) {
        log.info("======================  FreeBoardController getList  =======================");
        log.info("======================  FreeBoardController getList  =======================");
        PageResponseDTO<FreeBoardDTO> responseDTO = freeBoardService.getList(pageRequestDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/register")
    public void registerGet() {
        log.info("registerGET.........");
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping(value = {"/read", "/modify"})
    public void read(Long fbno, PageRequestDTO pageRequestDTO, Model model) {
        log.info("c---------------read............................." + fbno);
        log.info("c---------------read............................." + pageRequestDTO);
        model.addAttribute("freeBoardDTO", freeBoardService.read(fbno));
        model.addAttribute("prevNum", freeBoardService.prevNum(fbno));
        model.addAttribute("nextNum", freeBoardService.nextNum(fbno));
    }


    @PostMapping("/remove")
    public String remove(Long fbno, RedirectAttributes redirectAttributes) {
        log.info("c------------------------remove:" + fbno);
        if (freeBoardService.remove(fbno)) {
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/freeBoard/list";
    }

    @PreAuthorize("principal.mid == #freeBoardDTO.writer")
    @PostMapping("/modify")
    public String modify(FreeBoardDTO freeBoardDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {
        log.info("c--------------------------modify :" + freeBoardDTO);
        log.info("c--------------------------modify :" + pageRequestDTO);

        if (freeBoardService.modify(freeBoardDTO)) {
            redirectAttributes.addFlashAttribute("result", "modify");
        }


        redirectAttributes.addAttribute("fbno", freeBoardDTO.getFbno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        return "redirect:/freeBoard/read";
    }
}
