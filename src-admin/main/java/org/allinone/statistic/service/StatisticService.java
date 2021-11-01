package org.allinone.statistic.service;

import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statistic.dto.StatisticDTO;

import java.util.List;

public interface StatisticService {

    List<StatisticDTO> getStatisticTimeDTO(DateCalculatorDTO dateCalculatorDTO, String shopName);
    List<StatisticDTO> getStatisticDayDTO(DateCalculatorDTO dateCalculatorDTO, String shopName);
    List<StatisticDTO> getStatisticMonthDTO(DateCalculatorDTO dateCalculatorDTO, String shopName);
    List<StatisticDTO> getStatisticMenuDTO(DateCalculatorDTO dateCalculatorDTO, String shopName);
    List<StatisticDTO> getStatisticAgeDaily(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticAgeMonthly(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticGenderTotalDate(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticMaleTotalDate(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticFemaleTotalDate(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticGenderTotalMonth(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticMaleTotalMonth(DateCalculatorDTO dateCalculatorDTO);
    List<StatisticDTO> getStatisticFemaleTotalMonth(DateCalculatorDTO dateCalculatorDTO);
}
