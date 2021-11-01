package org.allinone.order.controller;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.notice.dto.NoticeDTO;
import org.allinone.notice.service.NoticeService;
import org.allinone.order.dto.OrderDTO;
import org.allinone.order.dto.CustomRequestDTO;
import org.allinone.order.service.OrderService;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
@Log4j2
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final NoticeService noticeService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/read")
    public void read(Long orderNum, @AuthenticationPrincipal User user, Model model) {

        model.addAttribute("orderDTO", orderService.read(orderNum, user.getUsername()).getOrderDTO());
        model.addAttribute("allPrice", orderService.read(orderNum, user.getUsername()).getAllPrice());

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/main")
    public void list(String shop, PageRequestDTO pageRequestDTO, Model model) {

        pageRequestDTO.setSize(5);
        PageResponseDTO<NoticeDTO> responseDTO = noticeService.getList(pageRequestDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/allList")
    public void allList(String shop) {

    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/getList")
    public void getList(CustomRequestDTO customRequestDTO, @AuthenticationPrincipal User user, Model model) {
        PageResponseDTO<OrderDTO> responseDTO = orderService.getList(customRequestDTO, user.getUsername());
        model.addAttribute("orderDTO", responseDTO.getDtoList());
        model.addAttribute("pageMaker", new PageMaker(customRequestDTO.getPage(), customRequestDTO.getSize(), responseDTO.getCount()));
    }

    @PostMapping("/update")
    public String update(Long orderNum) {
        orderService.update(orderNum);
        return "redirect:/order/main";
    }

    @PostMapping("/remove")
    public String remove(Long orderNum) {
        orderService.remove(orderNum);
        return "redirect:/order/main";
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list")
    public void selectList() {
    }

}