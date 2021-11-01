package org.allinone.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.dto.MemberDTO;
import org.allinone.member.service.MemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
@Log4j2
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/register")
    public void registerGet(){

    }

    @PostMapping("/register")
    public String registerPost(MemberDTO memberDTO){
        log.info("memberDTO:      " + memberDTO);

        memberService.register(memberDTO);

        return "redirect:/member/list";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/list")
    public void getList(@ModelAttribute PageRequestDTO pageRequestDTO, Model model){
        log.info("c    getList........"+ pageRequestDTO);
        log.info("c    getList........"+ pageRequestDTO);

        PageResponseDTO<MemberDTO> responseDTO = memberService.getDTOList(pageRequestDTO);

        model.addAttribute("memberDTOList", responseDTO.getDtoList());


        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping(value = {"/read", "/modify"})
    public void read(PageRequestDTO pageRequestDTO, Long mno, Model model){
        log.warn("c    read........" + pageRequestDTO);

        model.addAttribute("memberDTO", memberService.read(mno));
    }

    @PostMapping("/modify")
    public String modify(MemberDTO memberDTO, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes){
        log.info("----------------------------------");
        log.info("----------------------------------");
        log.warn("----------------------------------");

        log.warn("c    modify........" + memberDTO);
        log.info("c    modify........" + pageRequestDTO);

        memberService.modify(memberDTO);

        redirectAttributes.addAttribute("mno", memberDTO.getMno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        if (pageRequestDTO.getFilterArr() != null) {
            redirectAttributes.addAttribute("filterArr", pageRequestDTO.getFilterArr());
        }
        return "redirect:/member/read";
    }

    @PostMapping("/status")
    public String status(PageRequestDTO pageRequestDTO, MemberDTO memberDTO, RedirectAttributes redirectAttributes){
        log.info("c    check........" + memberDTO);
        log.info("c    check........" + pageRequestDTO);

        memberService.status(memberDTO);

        redirectAttributes.addAttribute("mno", memberDTO.getMno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        if (pageRequestDTO.getFilterArr() != null) {
            redirectAttributes.addAttribute("filterArr", pageRequestDTO.getFilterArr());
        }

        return "redirect:/member/read";
    }

}
