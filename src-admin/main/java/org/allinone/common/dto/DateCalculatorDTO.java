package org.allinone.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DateCalculatorDTO {

    @Builder.Default
    private int year = Calendar.getInstance().get(Calendar.YEAR);

    @Builder.Default
    private int month = Calendar.getInstance().get(Calendar.MONTH) + 1;

    @Builder.Default
    private String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

    @Builder.Default
    private String shopName = "musinsa";

    @Builder.Default
    private int page = 1;

    @Builder.Default
    private int size = 30;

    private String type;
    private String keyword;

    public int getSkip() { return (page - 1) * size; }

    public String getType() {
        if (type == null || type.trim().length() == 0) {
            return null;
        }
        return type;
    }

    public String[] getArr() {
        return type == null ? new String[]{} : type.split("");
    }
}




