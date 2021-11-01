package org.allinone.statement.domain;

import lombok.*;
import org.allinone.statement.dto.StatementDTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Statement {

    private Long orderNum;
    private LocalDateTime orderDate;
    private String shop;
    private int totalPrice;
    private int totalSales;
    private LocalDate date;
    private int month;
    private int year;





    public StatementDTO getDTO() {

        StatementDTO statementDTO = StatementDTO.builder()
                .orderNum(orderNum)
                .shop(shop)
                .totalPrice(totalPrice)
                .totalSales(totalSales)
                .orderDate(orderDate)
                .date(date)
                .month(month)
                .year(year)
                .build();

        return statementDTO;
    }
}
