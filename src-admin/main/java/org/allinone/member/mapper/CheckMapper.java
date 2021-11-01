package org.allinone.member.mapper;

import org.apache.ibatis.annotations.Param;

public interface CheckMapper {

    int checkID(@Param("type") String type, @Param("id") String id);

    int checkEmail(@Param("type") String type, @Param("email") String email);

    int checkRegnum(Long regnum);

}
