package org.allinone.order.service;

import org.allinone.order.dto.OrderDTO;

import java.util.List;

public interface OrderRestService {

    List<OrderDTO> customList(String shop, int orderCheck, int limitNum);

    void remove(Long orderNum);

    void update(Long orderNum);

    List<OrderDTO> allList(String shop);

    List<OrderDTO> specificList(String shop, String selectDate);
}
