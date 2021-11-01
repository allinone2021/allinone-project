package org.allinone.statistic.controller;

import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statistic.dto.StatisticDTO;
import org.allinone.statistic.service.StatisticService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/statistic/*")
@Log4j2
@RequiredArgsConstructor
public class StatisticController {

    private final StatisticService statisticService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/dashboard")
    public void getDashBoard(DateCalculatorDTO dateCalculatorDTO, @AuthenticationPrincipal User user , Model model) {

        log.info("============== StatisticController getDashBoard ===============");
        log.info("============== StatisticController getDashBoard ===============");

        List<StatisticDTO> statisticTimeDTO = statisticService.getStatisticTimeDTO(dateCalculatorDTO, user.getUsername());
        List<StatisticDTO> statisticDayDTO = statisticService.getStatisticDayDTO(dateCalculatorDTO, user.getUsername());
        List<StatisticDTO> statisticMonthDTO = statisticService.getStatisticMonthDTO(dateCalculatorDTO, user.getUsername());
        List<StatisticDTO> getStatisticMenuDTO = statisticService.getStatisticMenuDTO(dateCalculatorDTO, user.getUsername());

        Gson gson = new Gson();
        String dtoTimeStr = gson.toJson(statisticTimeDTO);
        String dtoDayStr = gson.toJson(statisticDayDTO);
        String dtoMonthStr = gson.toJson(statisticMonthDTO);
        String dtoMenuStr = gson.toJson(getStatisticMenuDTO);

        log.info("dtoDayStr :" + dtoDayStr);

        model.addAttribute("dtoTimeList", statisticTimeDTO);
        model.addAttribute("dtoDayList", statisticDayDTO);
        model.addAttribute("dtoMonthList", statisticMonthDTO);
        model.addAttribute("dtoMenuList", getStatisticMenuDTO);

        model.addAttribute("dtoTimeStr", dtoTimeStr);
        model.addAttribute("dtoDayStr", dtoDayStr);
        model.addAttribute("dtoMonthStr", dtoMonthStr);
        model.addAttribute("dtoMenuStr", dtoMenuStr);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/memberBoard")
    public void getMemberBoard(DateCalculatorDTO dateCalculatorDTO, Model model) {

        log.info("============== StatisticController getMemberBoard ===============");
        log.info("============== StatisticController getMemberBoard ===============");

        List<StatisticDTO> ageDailyDTO = statisticService.getStatisticAgeDaily(dateCalculatorDTO);
        List<StatisticDTO> ageMonthlyDTO = statisticService.getStatisticAgeMonthly(dateCalculatorDTO);
        List<StatisticDTO> genderTotalDateDTO = statisticService.getStatisticGenderTotalDate(dateCalculatorDTO);
        List<StatisticDTO> maleTotalDateDTO = statisticService.getStatisticMaleTotalDate(dateCalculatorDTO);
        List<StatisticDTO> femaleTotalDateDTO = statisticService.getStatisticFemaleTotalDate(dateCalculatorDTO);
        List<StatisticDTO> genderTotalMonthDTO = statisticService.getStatisticGenderTotalMonth(dateCalculatorDTO);
        List<StatisticDTO> maleTotalMonthDTO = statisticService.getStatisticMaleTotalMonth(dateCalculatorDTO);
        List<StatisticDTO> femaleTotalMonthDTO = statisticService.getStatisticFemaleTotalMonth(dateCalculatorDTO);

        Gson gson = new Gson();
        String dtoAgeDailyStr = gson.toJson(ageDailyDTO);
        String dtoAgeMonthlyStr = gson.toJson(ageMonthlyDTO);
        String dtoGenderDateStr = gson.toJson(genderTotalDateDTO);
        String dtoMaleDateStr = gson.toJson(maleTotalDateDTO);
        String dtoFemaleDateStr = gson.toJson(femaleTotalDateDTO);
        String dtoGenderMonthStr = gson.toJson(genderTotalMonthDTO);
        String dtoMaleMonthStr = gson.toJson(maleTotalMonthDTO);
        String dtoFemaleMonthStr = gson.toJson(femaleTotalMonthDTO);

        log.info(dtoAgeDailyStr);
        log.info(dtoAgeMonthlyStr);
        log.info(dtoGenderDateStr);
        log.info(dtoMaleDateStr);
        log.info(dtoFemaleDateStr);
        log.info(dtoGenderMonthStr);
        log.info(dtoMaleMonthStr);
        log.info(dtoFemaleMonthStr);

        model.addAttribute("ageDailyList", ageDailyDTO);
        model.addAttribute("ageMonthlyList", ageMonthlyDTO);
        model.addAttribute("genderTotalDateList", genderTotalDateDTO);
        model.addAttribute("maleTotalDateList", maleTotalDateDTO);
        model.addAttribute("femaleTotalDateList", femaleTotalDateDTO);
        model.addAttribute("genderTotalMonthList", genderTotalMonthDTO);
        model.addAttribute("maleTotalMonthList", maleTotalMonthDTO);
        model.addAttribute("femaleTotalMonthList", femaleTotalMonthDTO);

        model.addAttribute("dtoAgeDailyStr", dtoAgeDailyStr);
        model.addAttribute("dtoAgeMonthlyStr", dtoAgeMonthlyStr);
        model.addAttribute("dtoGenderDateStr", dtoGenderDateStr);
        model.addAttribute("dtoMaleDateStr", dtoMaleDateStr);
        model.addAttribute("dtoFemaleDateStr", dtoFemaleDateStr);
        model.addAttribute("dtoGenderMonthStr", dtoGenderMonthStr);
        model.addAttribute("dtoMaleMonthStr", dtoMaleMonthStr);
        model.addAttribute("dtoFemaleMonthStr", dtoFemaleMonthStr);

    }

}
