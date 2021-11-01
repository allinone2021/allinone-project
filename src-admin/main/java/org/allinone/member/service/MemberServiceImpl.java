package org.allinone.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.domain.Member;
import org.allinone.member.dto.MemberDTO;
import org.allinone.member.mapper.MemberMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;


    @Override
    public void register(MemberDTO memberDTO) {
        memberDTO.setMpw(passwordEncoder.encode(memberDTO.getMpw()));

        Member member = dtoToEntity(memberDTO);

        memberMapper.insert(member);

        String mid = member.getMid();
        memberMapper.insertRole(mid);

    }

    @Override
    public PageResponseDTO<MemberDTO> getDTOList(PageRequestDTO pageRequestDTO) {

        List<MemberDTO> dtoList = memberMapper.getList(pageRequestDTO).stream().map(member -> entityToDTO(member)).collect(Collectors.toList());
        int count = memberMapper.getCount(pageRequestDTO);

        PageResponseDTO<MemberDTO> pageResponseDTO = PageResponseDTO.<MemberDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public MemberDTO read(Long mno) {
        Member member = memberMapper.select(mno);

        if(member != null){
            return entityToDTO(member);
        }

        return null;
    }

    @Override
    public boolean modify(MemberDTO memberDTO) {
        return memberMapper.update(dtoToEntity(memberDTO)) > 0;
    }

    @Override
    public boolean status(MemberDTO memberDTO) {
        return memberMapper.status(dtoToEntity(memberDTO)) > 0;
    }
}
