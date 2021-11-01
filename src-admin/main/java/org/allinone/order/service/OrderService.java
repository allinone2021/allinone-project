package org.allinone.order.service;

import org.allinone.order.dto.OrderDTO;
import org.allinone.order.dto.OrderResponseDTO;
import org.allinone.order.dto.CustomRequestDTO;
import org.allinone.common.dto.PageResponseDTO;

public interface OrderService {

    OrderResponseDTO read(Long orderNum, String shop);

    void update(Long orderNum);

    void remove(Long orderNum);

    PageResponseDTO<OrderDTO> getList(CustomRequestDTO customRequestDTO, String shop);

}