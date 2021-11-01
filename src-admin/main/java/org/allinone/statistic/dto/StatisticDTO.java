package org.allinone.statistic.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.statement.domain.Statement;
import org.allinone.statistic.domain.Statistic;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StatisticDTO {

    private String shop;
    private String menu;
    private String ageCus;
    private int customerNum;
    private int orderCount;
    private int sales;
    private int hour;
    private int month;
    private LocalDate date;

    public Statistic getDomain() {

        Statistic statistic = Statistic.builder()
                .shop(shop)
                .menu(menu)
                .ageCus(ageCus)
                .customerNum(customerNum)
                .orderCount(orderCount)
                .sales(sales)
                .hour(hour)
                .month(month)
                .date(date)
                .build();

        return statistic;
    }

}
