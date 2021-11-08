//package com.allinone.store.entity;
//
//import lombok.*;
//
//import javax.persistence.ElementCollection;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.Id;
//import java.util.HashSet;
//import java.util.Set;
//
//@Entity
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@ToString
//public class Member {
//
//    @Id
//    private String mid;
//
//    private String mpw;
//
//    private String mname;
//
//    @Builder.Default
//    @ElementCollection(fetch = FetchType.LAZY)
//    private Set<MemberRole> roleSet = new HashSet<>();
//
//    public void changePassword(String password) {
//        this.mpw = password;
//    }
//
//}
