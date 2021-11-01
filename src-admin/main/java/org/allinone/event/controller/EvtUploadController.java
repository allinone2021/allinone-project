package org.allinone.event.controller;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.allinone.event.dto.UploadResponseDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@Log4j2
public class EvtUploadController {


    @GetMapping("/viewImage")
    @ResponseBody
    public ResponseEntity<byte[]> viewImage(@RequestParam("file") String fileName) throws IOException {
        File file = new File("/Users/luke" + File.separator + fileName);
        log.info(file);

        String mimeType = Files.probeContentType(file.toPath());
        log.info("mimeType: " + mimeType);

        ResponseEntity<byte[]> result = null;
        byte[] data = FileCopyUtils.copyToByteArray(file);
        result = ResponseEntity.ok().header("Content-Type", mimeType).body(data);  //OK = 200

        return result;
    }

    @ResponseBody
    @PostMapping("/uploadImage")
    public List<UploadResponseDTO> uploadPost(MultipartFile[] uploadFiles ) {
        log.info("--------------------1");
        log.info("--------------------"+uploadFiles);

        if (uploadFiles != null && uploadFiles.length > 0) {
            log.info("--------------------2");

            List<UploadResponseDTO> uploadList = new ArrayList<>();
            log.info("--------------------3");
            for (MultipartFile multipartFile : uploadFiles) {
                try {
                    uploadList.add(uploadProcess(multipartFile));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return uploadList;
        }
        return null;
    }

    private UploadResponseDTO uploadProcess(MultipartFile multipartFile) throws Exception {
        String uploadPath = "/Users/luke"; //저장경로
        String folderName = makeFolder(uploadPath); //저장경로를 가지고 들어가서 메소드 실행 후 저장경로 반환
        log.info("--------------------"+folderName);
        String fileName = multipartFile.getOriginalFilename(); //원래 파일명을 뽑아서 저장
        log.info("--------------------"+fileName);
        String originalFileName = fileName; //원래 파일명 저장
        log.info("--------------------"+originalFileName);
        String uuid = UUID.randomUUID().toString(); //새로운 uuid 생성
        log.info("--------------------"+uuid);
        fileName = uuid + "_" + fileName; //uuid와 파일명을 붙여서 최종 파일명 생성
        log.info("--------------------"+fileName);
        String mimeType = multipartFile.getContentType(); //컨텐츠 타입 저장
        log.info("--------------------"+mimeType);
        boolean checkImage = mimeType.startsWith("image"); //타입 체크해서 저장
        log.info("--------------------"+checkImage);

        if (checkImage) {
            File savedFile = new File(uploadPath + File.separator + folderName, fileName); //각각의 변수를 조합해 파일 저장
            FileCopyUtils.copy(multipartFile.getBytes(), savedFile); //저장 실행

            File thumbnailFile = new File(uploadPath + File.separator + folderName, "s_" + fileName);
            Thumbnailator.createThumbnail(savedFile, thumbnailFile,1000,1000);

            return UploadResponseDTO.builder()
                    .uuid(uuid)
                    .uploadPath(folderName.replace(File.separator,"/"))
                    .fileName(originalFileName)
                    .image(checkImage)
                    .build();
        } else {
            return UploadResponseDTO.builder()
                    .image(checkImage = false)
                    .build();
        }
    }


    private String makeFolder(String uploadPath) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();
        String str = simpleDateFormat.format(date); // 2021-09-07
        String folderName = str.replace("-", File.separator); // win \\ mac /
        File uploadFolder = new File(uploadPath, folderName);
        if (uploadFolder.exists() == false) {
            uploadFolder.mkdirs(); // 폴더가 자동으로 만들어짐
        }

        return folderName;
    }

}
