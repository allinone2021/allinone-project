package com.allinone.store.entity;

import lombok.*;

import javax.persistence.Embeddable;

@Embeddable
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of = "uuid")
public class StorePicture implements Comparable<StorePicture> {

    private String uuid;

    private String fileName;

    private int idx;

    private String savePath;

    @Override
    public int compareTo(StorePicture o) {
        return this.idx - o.idx;
    }
}
