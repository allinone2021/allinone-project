package org.allinone.statement.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statement.dto.StatementDTO;
import org.allinone.statement.service.StatementService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/statement/*")
@Log4j2
@RequiredArgsConstructor
public class StatementController {

    private final StatementService statementService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public void getList(DateCalculatorDTO dateCalculatorDTO, @AuthenticationPrincipal User user , Model model) {
        log.info("===============  Controller List  ===============");
        log.info("===============  Controller List  ===============");

        PageResponseDTO<StatementDTO> responseDTO = statementService.getDTOList(dateCalculatorDTO, user.getUsername());

        List<StatementDTO> statementDTOList = responseDTO.getDtoList();

        model.addAttribute("dateMaker", dateCalculatorDTO);
        model.addAttribute("dtoList", statementDTOList);

        int total = responseDTO.getCount();
        int page = dateCalculatorDTO.getPage();
        int size = dateCalculatorDTO.getSize();

        log.info(total);
        log.info(page);
        log.info(size);

        model.addAttribute("pageMaker", new PageMaker(page, size, total));

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/dailylist")
    public void getDailyList(DateCalculatorDTO dateCalculatorDTO, @AuthenticationPrincipal User user , Model model) {
        log.info("===============  Controller getDailyList  ===============");
        log.info("===============  Controller getDailyList  ===============");

        List<StatementDTO> dtoDailyList = statementService.getDTODailyList(dateCalculatorDTO, user.getUsername());

        log.info(dtoDailyList);

        Gson gson = new Gson();
        String dtoStr = gson.toJson(dtoDailyList);

        log.info(dtoStr);


        model.addAttribute("dateMaker", dateCalculatorDTO);
        model.addAttribute("dtoDailyList", dtoDailyList);
        model.addAttribute("dtoStr", dtoStr);

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/monthlylist")
    public void getMonthlyList(DateCalculatorDTO dateCalculatorDTO, @AuthenticationPrincipal User user , Model model) {
        log.info("===============  Controller getMonthlyList  ===============");
        log.info("===============  Controller getMonthlyList  ===============");

        model.addAttribute("dateMaker", dateCalculatorDTO);
        model.addAttribute("dtoMonthlyList", statementService.getDTOMonthlyList(dateCalculatorDTO, user.getUsername()));
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/yearlist")
    public void getYearList(DateCalculatorDTO dateCalculatorDTO, @AuthenticationPrincipal User user , Model model) {
        log.info("===============  Controller getYearList  ===============");
        log.info("===============  Controller getYearList  ===============");

        model.addAttribute("dateMaker", dateCalculatorDTO);
        model.addAttribute("dtoYearList", statementService.getDTOYearList(dateCalculatorDTO, user.getUsername()));
    }

}
