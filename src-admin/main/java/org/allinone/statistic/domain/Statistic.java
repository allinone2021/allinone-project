package org.allinone.statistic.domain;

import lombok.*;
import org.allinone.statistic.dto.StatisticDTO;

import java.time.LocalDate;


@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Statistic {

    private String shop;
    private String menu;
    private String ageCus;
    private int customerNum;
    private int orderCount;
    private int sales;
    private int hour;
    private int month;
    private LocalDate date;

    public StatisticDTO getDTO() {
        StatisticDTO statisticDTO = StatisticDTO.builder()
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

        return statisticDTO;
    }

}
