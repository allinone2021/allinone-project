package com.allinone.board.service;

import com.allinone.board.dto.BoardDTO;
import com.allinone.common.dto.PageRequestDTO;
import com.allinone.common.dto.PageResponseDTO;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;

@Transactional
public interface BoardService {

    BoardDTO read(Long bno);

    PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);

//    PageResponseDTO<BoardListDTO> getListWithFavorite(PageRequestDTO pageRequestDTO);

    void crawlingRegister() throws IOException;

}
