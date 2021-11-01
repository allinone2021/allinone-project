package org.allinone.notice.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.notice.dto.NoticeDTO;
import org.allinone.notice.service.NoticeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@RequestMapping("/notice/*")
@RequiredArgsConstructor
@Controller
public class NoticeController {
    private final NoticeService noticeService;


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/register")
    public String registerPost(NoticeDTO noticeDTO, RedirectAttributes redirectAttributes) {
        log.info("     c     registerPost  noticeDTO  :  " + noticeDTO);
        Long nno = noticeService.register(noticeDTO);
        log.info("     c     registerPost  nno  :  "+nno);
        redirectAttributes.addFlashAttribute("result",nno);
        return "redirect:/notice/list";
    }


    @GetMapping("/list")
    public void getList(PageRequestDTO pageRequestDTO, Model model) {
        log.info("     c     getList     ");
        PageResponseDTO<NoticeDTO> responseDTO = noticeService.getList(pageRequestDTO);
        log.info("     c     getList     responseDTO  :  " + responseDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));

    }


    @GetMapping("/register")
    public void registerGet() {
        log.info("     c     registerGet     ");

    }



    @GetMapping(value = {"/read", "/modify"})
    public void read(Long nno, PageRequestDTO pageRequestDTO, Model model) {
        log.info("c     read............................." + nno);
        model.addAttribute("noticeDTO", noticeService.read(nno));
        model.addAttribute("prevNum", noticeService.prevNum(nno));
        model.addAttribute("nextNum", noticeService.nextNum(nno));
        PageResponseDTO<NoticeDTO> responseDTO = noticeService.getList(pageRequestDTO);
        log.info(responseDTO);
        log.info(responseDTO.getDtoList());
        log.info("=======================");
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/remove")
    public String remove(Long nno, RedirectAttributes redirectAttributes) {
        log.info("c      remove:" + nno);
        if (noticeService.remove(nno)) {
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/notice/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/modify")
    public String modify(NoticeDTO noticeDTO,PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {
        log.info("c                                modify :" + noticeDTO);
        if (noticeDTO.getFiles().size() > 0) {
            noticeDTO.getFiles().forEach(dto -> log.info(dto));
        }
        log.info("-------------------------------------------------");
        log.info("-------------------------------------------------");
        log.info("-------------------------------------------------");

        if (noticeService.modify(noticeDTO)) {
            redirectAttributes.addFlashAttribute("result", "modify");
        }

        redirectAttributes.addAttribute("nno", noticeDTO.getNno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }
        return "redirect:/notice/read";
    }
}
