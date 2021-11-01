package org.allinone.notice.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
    private Long rno;
    private Long nno;
    private String replyer;
    private String reply;
    @JsonFormat(shape =  JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss" )
    private LocalDateTime replyDate;

    @JsonFormat(shape =  JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss" )
    private LocalDateTime modDate;

}
