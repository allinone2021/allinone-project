package org.allinone.order.service;

import org.allinone.order.dto.OrderDTO;
import org.allinone.order.mapper.OrderRestMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class OrderRestServiceImpl implements OrderRestService {

    private final OrderRestMapper orderRestMapper;

    @Override
    public List<OrderDTO> customList(String shop, int orderCheck, int limitNum) {
        List<OrderDTO> orderDTOList = orderRestMapper.customList(shop, orderCheck, limitNum).stream().map(board -> board.getOrderDTO()).collect(Collectors.toList());
        return orderDTOList;
    }

    @Override
    public void remove(Long orderNum) {
        orderRestMapper.delete(orderNum);
    }

    @Override
    public void update(Long orderNum) {
        orderRestMapper.update(orderNum);
    }


    @Override
    public List<OrderDTO> allList(String shop) {
        List<OrderDTO> orderDTOList = orderRestMapper.allList(shop).stream().map(board -> board.getOrderDTO()).collect(Collectors.toList());
        return orderDTOList;
    }




    @Override
    public List<OrderDTO> specificList(String shop, String selectDate) {
        String[] arr = selectDate.split("~");
        String starting = arr[0];
        String ending = arr[1];
        List<OrderDTO> orderDTOList = orderRestMapper.specificList(shop, starting, ending).stream().map(board -> board.getOrderDTO()).collect(Collectors.toList());
        return orderDTOList;
    }

}
