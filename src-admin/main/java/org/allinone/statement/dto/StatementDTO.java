package org.allinone.statement.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.statement.domain.Statement;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StatementDTO {

    private Long orderNum;
    private LocalDateTime orderDate;
    private String shop;
    private int totalPrice;
    private int totalSales;
    private LocalDate date;
    private int month;
    private int year;


    public Statement getDomain() {

        Statement statement = Statement.builder()
                .orderNum(orderNum)
                .shop(shop)
                .totalPrice(totalPrice)
                .totalSales(totalSales)
                .orderDate(orderDate)
                .date(date)
                .month(month)
                .year(year)
                .build();

        return statement;
    }

}
