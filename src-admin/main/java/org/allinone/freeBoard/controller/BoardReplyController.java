package org.allinone.freeBoard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.freeBoard.dto.BoardReplyDTO;
import org.allinone.freeBoard.service.BoardReplyService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/fbreplies")
@RequiredArgsConstructor
public class BoardReplyController {

    private final BoardReplyService replyService;

    @GetMapping("/list/{fbno}")
    public List<BoardReplyDTO> getBoardReplies(@PathVariable(name="fbno") Long fbno) {
        log.info("===========  RestController getBoardReplies  ============");
        log.info("===========  RestController getBoardReplies  ============");

        return replyService.getRepliesByFbno(fbno);
    }

    @PostMapping("")
    public int add(@RequestBody BoardReplyDTO replyDTO) {
        log.info("===========  RestController add  ============");
        log.info("===========  RestController add  ============");
        log.info("replyDTO :" + replyDTO);

        return replyService.add(replyDTO);
    }

    @DeleteMapping("/{rno}")
    public String remove(@PathVariable(name="rno") Long rno) {
        log.info("==================  RestController remove  ======================");
        log.info("==================  RestController remove  ======================");
        log.info("replyDTO :" + rno);

        replyService.remove(rno);

        return "success";

    }

    @PutMapping("/{rno}")
    public String modify(@PathVariable(name="rno") Long rno, @RequestBody BoardReplyDTO replyDTO) {
        log.info("==================  RestController modify  ======================");
        log.info("==================  RestController modify  ======================");
        log.info(replyDTO);

        replyService.modify(replyDTO);

        return "success";
    }



}