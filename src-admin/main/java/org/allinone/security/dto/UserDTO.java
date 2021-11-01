package org.allinone.security.dto;

import lombok.Getter;
import lombok.Setter;
import org.allinone.security.domain.MemberUser;
import org.allinone.security.domain.StoreUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

@Getter
@Setter
public class UserDTO extends User {
    //권한은 User통해 처리할 것
    private String uid;
    private String upw;
    private String uname;
    private boolean enabled;

    //생성자 새로 생성
    public UserDTO(MemberUser memberUser) {
        //도메인을 받아오는 생성잔데 super 사용해서 아래에 만들었던 생성자 불러와서 값 넣어주기
        super(memberUser.getMid(),
                memberUser.getMpw(),
                memberUser.getRoleList().stream().map(memberRole -> new SimpleGrantedAuthority(memberRole.getRole()))
                        .collect(Collectors.toList()));
        this.uid = memberUser.getMid();
        this.upw = memberUser.getMpw();
        this.uname = memberUser.getMname();
        this.enabled = memberUser.isEnabled();
    }

    public UserDTO(StoreUser storeUser) {
        //도메인을 받아오는 생성잔데 super 사용해서 아래에 만들었던 생성자 불러와서 값 넣어주기
        super(storeUser.getSid(),
                storeUser.getSpw(),
                storeUser.getRoleList().stream().map(storeRole -> new SimpleGrantedAuthority(storeRole.getRole()))
                        .collect(Collectors.toList()));
        this.uid = storeUser.getSid();
        this.upw = storeUser.getSpw();
        this.uname = storeUser.getSname();
        this.enabled = storeUser.isEnabled();
    }

    //아이디나 암호 외에 다른 정보를 가져오기 위해서 DTO 에 extends User해서 확인
    public UserDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

}