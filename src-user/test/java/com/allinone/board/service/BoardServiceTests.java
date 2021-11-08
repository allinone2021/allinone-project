package com.allinone.board.service;

import com.allinone.board.dto.BoardDTO;
import com.allinone.common.dto.PageRequestDTO;
import com.allinone.common.dto.PageResponseDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Log4j2
public class BoardServiceTests {

    @Autowired
    BoardService boardService;

    @Test
    public void testList() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder().build();

        PageResponseDTO<BoardDTO> pageResponseDTO =
                boardService.getList(pageRequestDTO);

        log.info(pageResponseDTO);
        log.info("-------------------------");

        pageResponseDTO.getDtoList().forEach(dto -> {
            log.info(dto);
            log.info(dto.getTags());
            log.info("-------------------------");
        });
    }

    @Test
    public void testCrawlingRegister() throws IOException {
        boardService.crawlingRegister();
    }

}
