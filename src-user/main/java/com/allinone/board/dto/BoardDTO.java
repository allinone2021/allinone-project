package com.allinone.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

    private Long bno;
    private String writer;
    private String title;
    private String content;

    private LocalDateTime regDate;
    private LocalDateTime modDate;

    //왜 List 사용? 파라미터 사용할 때 idx 번호 사용하려면 List 사용하는게 나음
    //Set으로 변환할 때 문제가 발생했었음
    private List<String> tags;

//    private String pictures;
    private String img;

}
