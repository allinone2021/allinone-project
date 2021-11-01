package org.allinone.event.domain;

import org.allinone.event.dto.EventDTO;
import lombok.*;
import org.allinone.event.dto.UploadResponseDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Event {

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
    private List<EvtAttach> evtAttachList = new ArrayList<>();

    public void addAttach(EvtAttach evtAttach){
        evtAttachList.add(evtAttach);
    }

    public EventDTO getEventDTO() {
        EventDTO eventDTO = EventDTO.builder()
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

        List<UploadResponseDTO> uploadResponseDTOList = evtAttachList.stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .image(attach.isImage())
                    .uploadPath(attach.getPath())
                    .build();
            return uploadResponseDTO;
        }).collect(Collectors.toList());

        eventDTO.setImage(uploadResponseDTOList);

        return eventDTO;

    }

}
