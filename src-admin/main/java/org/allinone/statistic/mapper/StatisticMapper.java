package org.allinone.statistic.mapper;

import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statistic.domain.Statistic;


import java.util.List;

public interface StatisticMapper {

    List<Statistic> getOrderListTime(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getOrderListDay(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getOrderListMonth(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getMenuSalesStatus(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getAgeDaily(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getAgeMonthly(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getGenderTotalDate(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getMaleTotalDate(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getFemaleTotalDate(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getGenderTotalMonth(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getMaleTotalMonth(DateCalculatorDTO dateCalculatorDTO);

    List<Statistic> getFemaleTotalMonth(DateCalculatorDTO dateCalculatorDTO);



}
