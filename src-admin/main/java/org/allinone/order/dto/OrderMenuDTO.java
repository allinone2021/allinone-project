package org.allinone.order.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderMenuDTO {

    private Long orderNum;
    private String menu;
    private Long amount;
    private Long price;
    private Long totalPrice;

}