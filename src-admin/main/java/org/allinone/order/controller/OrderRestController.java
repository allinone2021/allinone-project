package org.allinone.order.controller;

import org.allinone.order.dto.OrderDTO;
import org.allinone.order.service.OrderRestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/orderRest/*")
@RequiredArgsConstructor
public class OrderRestController {

    private final OrderRestService orderRestService;

    @GetMapping("/allList/{shop}")
    public List<OrderDTO> allList(@PathVariable(name = "shop")String shop) {
        return orderRestService.allList(shop);
    }

    @GetMapping("/specificList/{shop}/{selectDate}")
    public List<OrderDTO> specificList(@PathVariable(name = "shop")String shop,
                                       @PathVariable(name = "selectDate")String selectDate) {
        return orderRestService.specificList(shop, selectDate);
    }

    @GetMapping("/customList/{orderCheck}/{limitNum}")
    public List<OrderDTO> customList(@AuthenticationPrincipal User user,
                                     @PathVariable(name = "orderCheck")int orderCheck,
                                     @PathVariable(name = "limitNum")int limitNum) {
        return orderRestService.customList(user.getUsername(), orderCheck, limitNum);
    }

    @DeleteMapping("/{orderNum}")
    public void remove(@PathVariable(name = "orderNum")Long orderNum) {
        orderRestService.remove(orderNum);
    }

    @PutMapping("/updateConfirm/{orderNum}")
    public void updateConfirm(@PathVariable(name = "orderNum")Long orderNum) {
        orderRestService.update(orderNum);
    }
}
