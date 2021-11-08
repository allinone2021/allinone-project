package com.allinone.board.service;

import com.allinone.board.dto.BoardDTO;
import com.allinone.board.entity.Board;
import com.allinone.board.repository.BoardRepository;
import com.allinone.common.dto.PageRequestDTO;
import com.allinone.common.dto.PageResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

    private final ModelMapper modelMapper;
    private final BoardRepository boardRepository;

    private String ONECONOMY_DATAS_URL = "http://www.1conomynews.co.kr/news/articleList.html?page=1&total=283&box_idxno=&sc_area=T&sc_word=%EC%B2%AD%EB%85%84&view_type=sm";
    private String BOARD_A_TAG_HREF= "http://www.1conomynews.co.kr";

    @Override
    public void crawlingRegister() throws IOException {
        log.info("------------------- s crawlingRegister --------------------");
        log.info("------------------- s crawlingRegister --------------------");
        log.info("------------------- s crawlingRegister --------------------");

        List<BoardDTO> oneConomyDTOList = new ArrayList<>();
        //뉴스 주소
        Document doc = Jsoup.connect(ONECONOMY_DATAS_URL).get();

        //페이지수
        Elements listInfo = doc.select(".pagination-end");
        String listTotal = listInfo.select("a").attr("href");
        int maxPage = Integer.parseInt(listTotal.substring(28, 30));

        for(int i = maxPage; i >= 1; i--) {

            this.ONECONOMY_DATAS_URL = "http://www.1conomynews.co.kr/news/articleList.html?page=" + i + "&total=283&box_idxno=&sc_area=T&sc_word=%EC%B2%AD%EB%85%84&view_type=sm";

            log.info(ONECONOMY_DATAS_URL);
            Document doc1 = Jsoup.connect(ONECONOMY_DATAS_URL).get();

            Elements contents = doc1.select("div.article-list section");

            for (Element content : contents) {
                //title
                Elements divContents = content.select("div");
                Elements listTitles = divContents.select("div.list-titles");

                for (Element listTitle : listTitles) {
                    String aTagHref = BOARD_A_TAG_HREF + listTitle.select("a").attr("href");
                    Document con = Jsoup.connect(aTagHref).get();

                    Elements divCon = con.select("p");
                    String contentImg = BOARD_A_TAG_HREF + con.select("#article-view-content-div img").attr("src");

                    Elements writer = con.select("div.info-text ul li");

                    Elements conTags = con.select("div.tag-group a");

                    List<String> tags = new ArrayList<>();

                    for (Element conTag : conTags) {
                        tags.add(conTag.text().substring(1));
                    }

                    BoardDTO dto = BoardDTO.builder()
                            .title(listTitle.text())
                            .writer(contentImg)
                            .content(String.valueOf(divCon))
                            .img(contentImg)
                            .writer(writer.text().substring(0, 6))
                            .tags(tags)
                            .build();

                    Board board = modelMapper.map(dto, Board.class);

                    boardRepository.save(board);
                }

            }
        }
    }

    @Override
    public BoardDTO read(Long bno) {
        log.info("------------------- s read -------------------");
        log.info("------------------- s read -------------------");
        log.info("------------------- s read -------------------");

        Optional<Board> optionalBoard = boardRepository.findById(bno);

        Board board = optionalBoard.orElseThrow();

        BoardDTO dto = modelMapper.map(board, BoardDTO.class);

        return dto;
    }

    @Override
    public PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO) {
        log.info("------------------- s getList -------------------");
        log.info("------------------- s getList -------------------");
        log.info("------------------- s getList -------------------");

        Pageable pageable = PageRequest.of(
                pageRequestDTO.getPage()-1,
                pageRequestDTO.getSize(),
                Sort.by("bno").descending());

        Page<Board> result = boardRepository.findAll(pageable);

        long totalCount = result.getTotalElements();

        List<BoardDTO> dtoList = result.stream().map(
                board -> modelMapper.map(board, BoardDTO.class)
        ).collect(Collectors.toList());

        return new PageResponseDTO<>(pageRequestDTO, (int) totalCount, dtoList);
    }


}
