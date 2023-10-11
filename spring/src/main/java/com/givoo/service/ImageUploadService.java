package com.givoo.service;

import com.givoo.entity.OrgImage;
import com.givoo.repository.OrgImageRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ImageUploadService {
    private final OrgImageRepository orgImageRepository;
    @Value("${file.dir}")
    private String fileDir;
    public ImageUploadService(OrgImageRepository orgImageRepository) {
        this.orgImageRepository = orgImageRepository;
    }
    public Long saveFile(MultipartFile files,Long id) throws IOException {
        if (files.isEmpty()) {
            System.out.println("@@@실패@@@@@");
            return null;
        }
        // 원래 파일 이름 추출
        String origName = files.getOriginalFilename();
        // 파일 이름으로 쓸 uuid 생성
        String uuid = UUID.randomUUID().toString();
        // 확장자 추출(ex : .png)
        String extension = origName.substring(origName.lastIndexOf("."));
        // uuid와 확장자 결합
        String savedName = uuid + extension;
        // 파일을 불러올 때 사용할 파일 경로
        String savedPath = fileDir + savedName;
        // 실제로 로컬에 uuid를 파일명으로 저장
        files.transferTo(new File(savedPath));

        OrgImage orgImage =new OrgImage();
        orgImage.setImageType("0");
        orgImage.setExtension(extension);
        orgImage.setOrgId(id);
        orgImage.setSaveName(savedName);
        orgImage.setOriginName(origName);
        orgImage.setSavePath(savedPath);
        orgImageRepository.save(orgImage);
        return null;
    }
    public List<OrgImage> findAllByOrgId(Long id){
        return orgImageRepository.findAllByOrgId(id);
    }
}