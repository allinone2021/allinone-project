package com.allinone.board.controller;


import com.allinone.board.dto.BoardDTO;
import com.allinone.board.service.BoardService;
import com.allinone.common.dto.PageRequestDTO;
import com.allinone.common.dto.PageResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;


    @GetMapping("/list")
    public void list(PageRequestDTO pageRequestDTO, Model model) {
        log.info("---------- c list ----------");
        log.info("---------- c list ----------");
        log.info("---------- c list ----------");

        PageResponseDTO<BoardDTO> responseDTO =
                boardService.getList(pageRequestDTO);

        model.addAttribute("res", responseDTO);
    }

    @GetMapping("/read")
    public void read(Long bno, PageRequestDTO pageRequestDTO, Model model) {
        log.info("----------- c read -----------");
        log.info("----------- c read -----------");
        log.info("----------- c read -----------");

        model.addAttribute("dto", boardService.read(bno));
    }

}

