package org.allinone.order.service;

import org.allinone.order.dto.OrderDTO;
import org.allinone.order.dto.OrderResponseDTO;
import org.allinone.order.dto.CustomRequestDTO;
import org.allinone.order.mapper.OrderMapper;
import org.allinone.common.dto.PageResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;

    @Override
    public OrderResponseDTO read(Long orderNum, String shop) {

        Long allPrice = orderMapper.allPrice(orderNum, shop);
        OrderDTO orderDTO = orderMapper.select(orderNum, shop).getOrderDTO();
        OrderResponseDTO orderResponseDTO = OrderResponseDTO.builder()
                .orderDTO(orderDTO)
                .allPrice(allPrice)
                .build();

        if(orderDTO != null) {
            return orderResponseDTO;
        }
        return null;
    }

    @Override
    public void update(Long orderNum) {
        orderMapper.update(orderNum);
    }

    @Override
    public void remove(Long orderNum) {
        orderMapper.delete(orderNum);
    }

    @Override
    public PageResponseDTO<OrderDTO> getList(CustomRequestDTO customRequestDTO, String shop) {

        String starting;
        String ending;
        if(customRequestDTO.getSelectDate() != null) {
            String selectDate = customRequestDTO.getSelectDate();
            String[] arr = selectDate.split("~");
            starting = arr[0];
            ending = arr[1];
            customRequestDTO = CustomRequestDTO.builder()
                    .shop(shop)
                    .starting(starting)
                    .ending(ending)
                    .page(customRequestDTO.getPage())
                    .size(customRequestDTO.getSize())
                    .build();
        } else {
            customRequestDTO = CustomRequestDTO.builder()
                    .shop(shop)
                    .page(customRequestDTO.getPage())
                    .size(customRequestDTO.getSize())
                    .build();
        }

        List<OrderDTO> orderDTOList = orderMapper.getList(customRequestDTO).stream().map(order -> order.getOrderDTO()).collect(Collectors.toList());
        int count = orderMapper.getCount(customRequestDTO);

        PageResponseDTO<OrderDTO> pageResponseDTO = PageResponseDTO.<OrderDTO>builder()
                .dtoList(orderDTOList)
                .count(count)
                .build();
        return pageResponseDTO;
    }

}