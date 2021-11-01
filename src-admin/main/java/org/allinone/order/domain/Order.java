package org.allinone.order.domain;

import org.allinone.order.dto.OrderDTO;
import org.allinone.order.dto.OrderMenuDTO;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    private Long orderNum;
    private String id;
    private String nickName;
    private String phone;
    private String shop;
    private String comment;
    private LocalDateTime orderDate;
    private Long orderCheck;
    private Long orderConfirm;
    private String pickupTime;

    @Builder.Default
    private List<OrderMenu> orderMenuList = new ArrayList<>();

    public OrderDTO getOrderDTO() {
        DateTimeFormatter dateTimeFormatter = LocalDate.now().isEqual(orderDate.toLocalDate()) ?
                        DateTimeFormatter.ofPattern("a h시 m분") : DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분");

        String date = orderDate.format(dateTimeFormatter);

        OrderDTO orderDTO = OrderDTO.builder()
                .orderNum(orderNum)
                .id(id)
                .nickName(nickName)
                .phone(phone)
                .comment(comment)
                .orderDate(date)
                .orderCheck(orderCheck)
                .orderConfirm(orderConfirm)
                .pickupTime(pickupTime)
                .build();

        List<OrderMenuDTO> orderMenuDTOList = orderMenuList.stream().map(orderMenu -> {
            OrderMenuDTO orderMenuDTO = OrderMenuDTO.builder()
                    .orderNum(orderMenu.getOrderNum())
                    .menu(orderMenu.getMenu())
                    .amount(orderMenu.getAmount())
                    .price(orderMenu.getPrice())
                    .totalPrice(orderMenu.getTotalPrice())
                    .build();
            return orderMenuDTO;
        }).collect(Collectors.toList());

        orderDTO.setOrderMenuDTOList(orderMenuDTOList);
        return orderDTO;
    }

}