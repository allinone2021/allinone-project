package org.allinone.order.mapper;

import org.allinone.order.domain.Order;
import org.allinone.order.dto.CustomRequestDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    Order select(@Param("orderNum") Long orderNum, @Param("shop") String shop);

    void update(Long orderNum);

    void delete(Long orderNum);

    List<Order> getList(CustomRequestDTO customRequestDTO);

    int getCount(CustomRequestDTO customRequestDTO);

    Long allPrice(@Param("orderNum") Long orderNum, @Param("shop") String shop);
}