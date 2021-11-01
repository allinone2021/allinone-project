package org.allinone.member.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CheckService {

    public int checkID(String type, String id);

    public int checkEmail(String type, String email);

    public int checkRegnum(Long regnum);

}
