package org.allinone.order.domain;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderMenu {

    private Long orderNum;
    private String menu;
    private Long amount;
    private Long price;
    private Long totalPrice;

}