package org.allinone.qna.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.notice.domain.Notice;
import org.allinone.notice.domain.NoticeAttach;
import org.allinone.qna.domain.QnA;
import org.allinone.qna.domain.QnA;
import org.allinone.qna.domain.QnAAttach;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QnAMapper {


    int getCount(PageRequestDTO pageRequestDTO); // total

    List<QnA> getList(PageRequestDTO pageRequestDTO);  // 리스트

    int viewCount(Long qno); // 조회수



    QnA readAns(Long pno);// 답변 조회
    QnA select(Long qno); // 질문 조회

    int getReRef(Long qno);  //  그룹번호

    void insertQnA(QnA qna);  //  질문 등록

    void insertAnswer(QnA qna);  //  답변 등록

    int delete(Long qno);  // 삭제

    int update(QnA qna);  // 수정



    int pno (Long qno);

    int updateReSeq(QnA qna);  // 답글 순서 수정정

    Long prevNum(Long qno);
    Long nextNum(Long qno);

   int updateAnswerCnt(@Param("qno") Long qno, @Param("num") int num);

    int insertAttach(QnAAttach attach);

    int deleteAttach(Long qno);
}
