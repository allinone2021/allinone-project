package org.allinone.security.mapper;

import org.allinone.member.domain.Member;
import org.allinone.member.domain.Store;
import org.allinone.security.domain.MemberUser;
import org.allinone.security.domain.StoreUser;

public interface UserMapper {

    MemberUser findByMid(String mid);

    StoreUser findBySid(String sid);

}
