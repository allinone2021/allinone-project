//package com.allinone.store.entity;
//
//import lombok.*;
//import org.hibernate.annotations.CreationTimestamp;
//
//import javax.persistence.*;
//import java.time.LocalDateTime;
//
//@Entity
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//@Getter
//@ToString(exclude = {"store", "member"})
//public class Favorite {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long fno;  //넘버링
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    private Store store;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    private Member member;
//
//    private int score;
//
//    @CreationTimestamp
//    private LocalDateTime regDate;
//
//}
