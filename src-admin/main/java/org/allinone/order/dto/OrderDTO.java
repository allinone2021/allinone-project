package org.allinone.order.dto;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {

    private Long orderNum;
    private String id;
    private String nickName;
    private String phone;
    private String shop;
    private String comment;
    private String orderDate;
    private Long orderCheck;
    private Long orderConfirm;
    private String pickupTime;
    @Builder.Default
    private List<OrderMenuDTO> orderMenuDTOList = new ArrayList<>();

}