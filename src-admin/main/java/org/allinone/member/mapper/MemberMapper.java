package org.allinone.member.mapper;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.member.domain.Member;

import java.util.List;

public interface MemberMapper {

    void insert(Member member);

    void insertRole(String mid);

    List<Member> getList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    Member select(Long mno);

    int update(Member member);

    int status(Member member);

}
