package org.allinone.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.member.mapper.CheckMapper;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class CheckServiceImpl implements CheckService {

    private final CheckMapper checkMapper;

    @Override
    public int checkID(String type, String id) {
        return checkMapper.checkID(type, id);
    }

    @Override
    public int checkEmail(String type, String email) {
        return checkMapper.checkEmail(type, email);
    }

    @Override
    public int checkRegnum(Long regnum) {
        return checkMapper.checkRegnum(regnum);
    }
}
