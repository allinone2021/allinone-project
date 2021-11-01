package org.allinone.event.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.event.domain.Event;
import org.allinone.event.domain.EvtAttach;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EventDTO {

    private Long eno;
    private String evtTitle;
    private String evtShop;
    private String evtContents;
    private String startDate;
    private String endDate;
    private String evtMenu;
    private Long evtAmount;
    private Long evtCount;
    private Long evtPrice;
    private Long evtCheck;
    @Builder.Default
    private List<UploadResponseDTO> image = new ArrayList<>();

    public Event getDomain() {
        Event domain = Event.builder()
                .eno(getEno())
                .evtTitle(getEvtTitle())
                .evtShop(getEvtShop())
                .evtContents(getEvtContents())
                .startDate(getStartDate())
                .endDate(getEndDate())
                .evtMenu(getEvtMenu())
                .evtAmount(getEvtAmount())
                .evtCount(getEvtCount())
                .evtPrice(getEvtPrice())
                .evtCheck(getEvtCheck())
                .build();

        image.forEach(uploadResponseDTO -> {
            EvtAttach attach = EvtAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();
            domain.addAttach(attach);
        });

        return domain;

    }

}
