package org.allinone.notice.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageMaker;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.notice.dto.ReplyDTO;
import org.allinone.notice.service.ReplyService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Log4j2
@RestController
@RequestMapping("/replies")
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;

    @PreAuthorize("isAuthenticated()")
    @PostMapping(value = "/new")
    public Long add(@RequestBody ReplyDTO replyDTO) {
        log.info("---------------------------------------");
        log.info(replyDTO);
        return replyService.add(replyDTO);
    }


    @PreAuthorize("isAuthenticated()")
    @GetMapping("/list/{nno}/{page}")
    public PageResponseDTO<ReplyDTO> getNoticeReplies(PageRequestDTO pageRequestDTO, @PathVariable(name = "page") Long page ,@PathVariable(name = "nno") Long nno) {


        return replyService.getRepliesWithNno(pageRequestDTO, nno);
    }


    @PreAuthorize("principal.mid == #ReplyDTO.writer")
    @DeleteMapping("/{rno}") // 특별한 rno 번호를 받는다.
    public String remove(@PathVariable(name = "rno") Long rno) {
        log.info("----------------- reply remove ---------------");
        log.info("rno :" + rno);
        replyService.remove(rno);
        return "success";
    }

    @PreAuthorize("principal.mid == #ReplyDTO.writer")
    @PutMapping("/{rno}")
    public String modify(@PathVariable(name = "rno") Long rno, @RequestBody ReplyDTO replyDTO) {

        log.info("-------------------- reply modify -----------------------" + rno);
        log.info(replyDTO);

        replyService.modify(replyDTO);

        return "success";
    }

}
