package org.allinone.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.dto.ReportDTO;
import org.allinone.member.service.ReportService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/report/*")
@Log4j2
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/list")
    public void getList(@ModelAttribute PageRequestDTO pageRequestDTO, Model model){
        log.info("c    getList........"+ pageRequestDTO);
        log.info("c    getList........"+ pageRequestDTO);

        PageResponseDTO<ReportDTO> responseDTO = reportService.getDTOList(pageRequestDTO);

        model.addAttribute("reportList", responseDTO.getDtoList());


        model.addAttribute("pageMaker", new PageMaker(pageRequestDTO.getPage(), pageRequestDTO.getSize(), responseDTO.getCount()));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/detail")
    public void getReporterList(PageRequestDTO pageRequestDTO, String detailtype, ReportDTO reportDTO, Model model){

        log.info("c.............getReportList" + detailtype);
        log.info("c.............getReportList" + reportDTO);

        model.addAttribute("reportList", reportService.getDetailList(detailtype, reportDTO));
        model.addAttribute("category", reportService.categoryCount(detailtype, reportDTO));
    }

    @PostMapping("/signout")
    public String status(PageRequestDTO pageRequestDTO, String detailtype, ReportDTO reportDTO, RedirectAttributes redirectAttributes){

        log.info("c.............status" + detailtype);
        log.info("c.............status" + reportDTO);

        reportService.signout(detailtype, reportDTO);

        redirectAttributes.addAttribute("rid", reportDTO.getRid());
        redirectAttributes.addAttribute("reporter", reportDTO.getReporter());
        redirectAttributes.addAttribute("detailtype", detailtype);

        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        if (pageRequestDTO.getType() != null) {
            redirectAttributes.addAttribute("type", pageRequestDTO.getType());
            redirectAttributes.addAttribute("keyword", pageRequestDTO.getKeyword());
        }

        if (pageRequestDTO.getFilterArr() != null) {
            redirectAttributes.addAttribute("filterArr", pageRequestDTO.getFilterArr());
        }

        return "redirect:/report/detail";
    }

}
