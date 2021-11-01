package org.allinone.common.dto;

import lombok.Getter;
import lombok.ToString;

import java.sql.Time;

@Getter
@ToString
public class PageMaker {

    private int start, end, page, size, total;
    private boolean prev, next;

    public PageMaker(int page, int size, int total) {

        this.page = page;
        this.size = size;
        this.total = total;

        end = (int)(Math.ceil(page / 10.0) * 10);
        start = end - 9;

        prev = start > 1;
        next = (total / (double)size) > end;

        end = end * size > total ? (int)(Math.ceil(total/(double)size)) : end;
    }

}

