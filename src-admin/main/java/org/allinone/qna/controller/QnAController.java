package org.allinone.qna.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.qna.dto.QnADTO;
import org.allinone.qna.service.QnAService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@RequestMapping("/qna/*")
@RequiredArgsConstructor
@Controller
public class QnAController {
    private final QnAService qnaService;


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/register")
    public String registerPost(QnADTO qnaDTO, RedirectAttributes redirectAttributes) {
        log.info("qnaDTO : " + qnaDTO);
        Long qno = qnaService.register(qnaDTO);
        log.info(qno);
        redirectAttributes.addFlashAttribute("result",qno);
        return "redirect:/qna/list";
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("/regAnswer")
    public String readPost(QnADTO qnaDTO, RedirectAttributes redirectAttributes) {
        log.info("qnaDTO : " + qnaDTO);
        qnaService.regAnswer(qnaDTO);

        return "redirect:/qna/list";
    }



    @GetMapping("/list")
    public void getList(PageRequestDTO pageRequestDTO, Model model) {
        log.info("c      getList......................................");
        PageResponseDTO<QnADTO> responseDTO = qnaService.getList(pageRequestDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));

    }

    @GetMapping("/faq")
    public void faqGet() {
        log.info("registerGET.........");
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/register")
    public void registerGet() {   log.info("registerGET.........");
    }


    @GetMapping(value = {"/read", "/modify"})
    public void read(Long qno, PageRequestDTO pageRequestDTO, Model model) {
        log.info("c     read............................." + qno);
        log.info("c     read............................." + pageRequestDTO);
        QnADTO qnaDTO = qnaService.read(qno);
        model.addAttribute("qnaDTO", qnaDTO);
              Long pno = qnaDTO.getPno();
        model.addAttribute("readAns", qnaService.readAns(pno));
        model.addAttribute("prevNum", qnaService.prevNum(qno));
        model.addAttribute("nextNum", qnaService.nextNum(qno));
        PageResponseDTO<QnADTO> responseDTO = qnaService.getList(pageRequestDTO);
        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));
    }


    @PostMapping("/remove")
    public String remove(Long qno, RedirectAttributes redirectAttributes) {
        log.info("c      remove:" + qno);
        if (qnaService.remove(qno)) {
            redirectAttributes.addFlashAttribute("result", "success");
        }
        return "redirect:/qna/list";
    }

    @PostMapping("/modify")
    public String modify(QnADTO qnaDTO,PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {
        log.info("c                                modify :" + qnaDTO);


        if (qnaService.modify(qnaDTO)) {
            redirectAttributes.addFlashAttribute("result", "modify");
        }

        redirectAttributes.addAttribute("qno", qnaDTO.getQno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }
        return "redirect:/qna/read";
    }

}
