package org.allinone.member.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.domain.Member;
import org.allinone.member.dto.MemberDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Transactional
public interface MemberService {

    void register(MemberDTO memberDTO);

    PageResponseDTO<MemberDTO> getDTOList(PageRequestDTO pageRequestDTO);

    MemberDTO read(Long mno);

    boolean modify(MemberDTO memberDTO);

    boolean status(MemberDTO memberDTO);

    default Member dtoToEntity(MemberDTO dto){
        Member member = Member.builder()
                .mno(dto.getMno())
                .mid(dto.getMid())
                .mpw(dto.getMpw())
                .mname(dto.getMname())
                .gender(dto.isGender())
                .birth(dto.getBirth())
                .region(dto.getRegion())
                .address(dto.getAddress())
                .mTel(dto.getMTel())
                .email(dto.getEmail())
                .regdate(dto.getRegdate())
                .status(dto.getStatus())
                .build();

        return member;
    }

    default MemberDTO entityToDTO(Member member) {
        MemberDTO memberDTO = MemberDTO.builder()
                .mno(member.getMno())
                .mid(member.getMid())
                .mpw(member.getMpw())
                .mname(member.getMname())
                .gender(member.isGender())
                .birth(member.getBirth())
                .region(member.getRegion())
                .address(member.getAddress())
                .mTel(member.getMTel())
                .email(member.getEmail())
                .regdate(member.getRegdate())
                .status(member.getStatus())
                .build();

        return memberDTO;
    }

}
