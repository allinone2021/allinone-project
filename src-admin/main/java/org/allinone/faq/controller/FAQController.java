package org.allinone.faq.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.faq.dto.FAQDTO;
import org.allinone.faq.service.FAQService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@RequestMapping("/faq/*")
@RequiredArgsConstructor
@Controller
public class FAQController {
    private final FAQService faqService;


    @PostMapping("/register")
    public String registerPost(FAQDTO faqDTO, RedirectAttributes redirectAttributes) {
        log.info("=============== c registerPost ===============");
        log.info("=============== c registerPost ===============");
        log.info(" faqDTO : " + faqDTO);
        Long fno = faqService.register(faqDTO);
        log.info(" fno : " + fno);
        redirectAttributes.addFlashAttribute("result",fno);
        return "redirect:/faq/list";
    }


    @GetMapping(value = {"/list", "/modify"})
    public void getList(PageRequestDTO pageRequestDTO, Model model) {
        log.info("=============== c getList ===============");
        log.info("=============== c getList ===============");
        log.info(" pageRequestDTO : " + pageRequestDTO);
        PageResponseDTO<FAQDTO> responseDTO = faqService.getList(pageRequestDTO);
        log.info(" responseDTO : " + responseDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));
    }


    @GetMapping("/register")
    public void registerGet() {
        log.info("=============== c registerGet ===============");
        log.info("=============== c registerGet ===============");
    }

    @PreAuthorize("principal.mid == #faqDTO.writer")
    @PostMapping("/remove")
    public String remove(Long fno, RedirectAttributes redirectAttributes) {
        log.info("=============== c remove ===============");
        log.info("=============== c remove ===============");
        log.info(" fno : " + fno);
        if (faqService.remove(fno)) {
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/faq/list";
    }

    @PreAuthorize("principal.mid == #faqDTO.writer")
    @PostMapping("/list")
    public String modify(FAQDTO faqDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {
        log.info("=============== c modify ===============");
        log.info("=============== c modify ===============");
        log.info(" faqDTO : " + faqDTO);
        log.info(" pageRequestDTO : " + pageRequestDTO);
        if (faqService.modify(faqDTO)) {
            redirectAttributes.addFlashAttribute("result", "modify");
        }
        redirectAttributes.addAttribute("fno", faqDTO.getFno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());
        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }
        return "redirect:/faq/list";
    }

}
