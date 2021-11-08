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
public class BoardListDTO {

    private Long dno;
    private String writer;
    private String title;
    private String img;
    private LocalDateTime regDate;

    private List<String> tags;

}
