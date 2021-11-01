package org.allinone.order.mapper;

import org.allinone.order.domain.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderRestMapper {

    List<Order> customList(@Param("shop")String shop, @Param("orderCheck")int orderCheck, @Param("limitNum")int limitNum);

    void delete(Long orderNum);

    void update(Long orderNum);

    List<Order> allList(String shop);

    List<Order> specificList(@Param("shop")String shop, @Param("starting")String starting, @Param("ending")String ending);

}
