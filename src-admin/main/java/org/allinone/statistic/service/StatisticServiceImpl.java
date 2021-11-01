package org.allinone.statistic.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statistic.dto.StatisticDTO;
import org.allinone.statistic.mapper.StatisticMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class StatisticServiceImpl implements StatisticService{

    private final StatisticMapper statisticMapper;

    @Override
    public List<StatisticDTO> getStatisticTimeDTO(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        log.info("================ StatisticService getStatisticTimeDTO ================");
        log.info("================ StatisticService getStatisticTimeDTO ================");

        DateCalculatorDTO calculatorDTO = statisticSecurity(dateCalculatorDTO, shopName);

        List<StatisticDTO> statisticDTOS = statisticMapper.getOrderListTime(calculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticDTOS;
    }

    @Override
    public List<StatisticDTO> getStatisticDayDTO(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        log.info("================ StatisticService getStatisticDayDTO ================");
        log.info("================ StatisticService getStatisticDayDTO ================");

        DateCalculatorDTO calculatorDTO = statisticSecurity(dateCalculatorDTO, shopName);

        List<StatisticDTO> statisticDayDTOS = statisticMapper.getOrderListDay(calculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticDayDTOS;
    }

    @Override
    public List<StatisticDTO> getStatisticMonthDTO(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        log.info("================ StatisticService getStatisticMonthDTO ================");
        log.info("================ StatisticService getStatisticMonthDTO ================");

        DateCalculatorDTO calculatorDTO = statisticSecurity(dateCalculatorDTO, shopName);

        List<StatisticDTO> statisticMonthDTOS = statisticMapper.getOrderListMonth(calculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticMonthDTOS;
    }

    @Override
    public List<StatisticDTO> getStatisticMenuDTO(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        log.info("================ StatisticService getStatisticMenuDTO ================");
        log.info("================ StatisticService getStatisticMenuDTO ================");

        DateCalculatorDTO calculatorDTO = statisticSecurity(dateCalculatorDTO, shopName);

        List<StatisticDTO> statisticMenuDTO = statisticMapper.getMenuSalesStatus(calculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticMenuDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticAgeDaily(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticAgeDaily ================");
        log.info("================ StatisticService getStatisticAgeDaily ================");


        List<StatisticDTO> statisticAgeDailyDTO = statisticMapper.getAgeDaily(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticAgeDailyDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticAgeMonthly(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticAgeMonthly ================");
        log.info("================ StatisticService getStatisticAgeMonthly ================");

        List<StatisticDTO> statisticAgeMonthlyDTO = statisticMapper.getAgeMonthly(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticAgeMonthlyDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticGenderTotalDate(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticGenderTotalDate ================");
        log.info("================ StatisticService getStatisticGenderTotalDate ================");

        List<StatisticDTO> statisticGenderTotalDateDTO = statisticMapper.getGenderTotalDate(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticGenderTotalDateDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticMaleTotalDate(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticMaleTotalDate ================");
        log.info("================ StatisticService getStatisticMaleTotalDate ================");

        List<StatisticDTO> statisticMaleTotalDateDTO = statisticMapper.getMaleTotalDate(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticMaleTotalDateDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticFemaleTotalDate(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticFemaleTotalDate ================");
        log.info("================ StatisticService getStatisticFemaleTotalDate ================");

        List<StatisticDTO> statisticFemaleTotalDateDTO = statisticMapper.getFemaleTotalDate(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticFemaleTotalDateDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticGenderTotalMonth(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticGenderTotalMonth ================");
        log.info("================ StatisticService getStatisticGenderTotalMonth ================");

        List<StatisticDTO> statisticGenderTotalMonthDTO = statisticMapper.getGenderTotalMonth(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticGenderTotalMonthDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticMaleTotalMonth(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticMaleTotalMonth ================");
        log.info("================ StatisticService getStatisticMaleTotalMonth ================");

        List<StatisticDTO> statisticMaleTotalMonthDTO = statisticMapper.getMaleTotalMonth(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticMaleTotalMonthDTO;
    }

    @Override
    public List<StatisticDTO> getStatisticFemaleTotalMonth(DateCalculatorDTO dateCalculatorDTO) {

        log.info("================ StatisticService getStatisticFemaleTotalMonth ================");
        log.info("================ StatisticService getStatisticFemaleTotalMonth ================");

        List<StatisticDTO> statisticFemaleTotalMonthDTO = statisticMapper.getFemaleTotalMonth(dateCalculatorDTO).stream().map(statistic -> statistic.getDTO()).collect(Collectors.toList());

        return statisticFemaleTotalMonthDTO;
    }


    private DateCalculatorDTO statisticSecurity(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        DateCalculatorDTO dto = DateCalculatorDTO.builder()
                .year(dateCalculatorDTO.getYear())
                .month(dateCalculatorDTO.getMonth())
                .today(dateCalculatorDTO.getToday())
                .shopName(shopName)
                .page(dateCalculatorDTO.getPage())
                .size(dateCalculatorDTO.getSize())
                .type(dateCalculatorDTO.getType())
                .keyword(dateCalculatorDTO.getKeyword())
                .build();

        return dto;
    }

}
