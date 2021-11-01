package org.allinone.security.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.security.domain.MemberUser;
import org.allinone.security.domain.StoreUser;
import org.allinone.security.dto.UserDTO;
import org.allinone.security.mapper.UserMapper;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Log4j2
@RequiredArgsConstructor
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        log.warn("--------------------CustomUserDetailsService--------------------");
        log.warn("--------------------CustomUserDetailsService--------------------");
        log.warn(username);
        log.warn(userMapper);
        log.warn("--------------------CustomUserDetailsService--------------------");
        log.warn("--------------------CustomUserDetailsService--------------------");

        MemberUser memberUser = userMapper.findByMid(username);
        log.info(memberUser);
        StoreUser storeUser = userMapper.findBySid(username);
        log.info(storeUser);

        if (storeUser == null) {

            if (memberUser == null) {
                log.info("로그인 정보 없음");

                throw new UsernameNotFoundException("USER NOT EXIST");

            } else {
                log.info("member 회원 로그인");

                String[] authorities = memberUser.getRoleList().stream()
                        .map(memberRole -> memberRole.getRole()).toArray(String[]::new);

                User result = new UserDTO(memberUser);

                return result;
            }

        } else {
            log.info("store 회원 로그인");

            String[] authorities = storeUser.getRoleList().stream()
                    .map(storeRole -> storeRole.getRole()).toArray(String[]::new);

            User result = new UserDTO(storeUser);

            return result;
        }
    }
}
