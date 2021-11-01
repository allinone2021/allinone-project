package org.allinone.freeBoard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardDTO {
    private Long fbno;
    private String title;
    private String writer;
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    private int viewCount;
    private int replyCnt;

    @Builder.Default
    private List<UploadResponseDTO> files = new ArrayList<>();


}
