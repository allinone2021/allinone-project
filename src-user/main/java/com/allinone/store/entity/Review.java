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
//@ToString(exclude = "store")
//public class Review {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long rno;
//
//    private String reviewText;
//
//    private String reviewer;  //외래키 댓글-게시글 ManyToOne
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    private Store store;
//
//    @CreationTimestamp
//    private LocalDateTime replyDate;
//
//    public void setText(String text) {
//        this.reviewText = text;
//    }
//}
