package com.givoo.service;

import com.amazonaws.AmazonClientException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import com.givoo.entity.OrgImage;
import com.givoo.repository.OrgImageRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
@Slf4j
@Service
public class ImageUploadService {
    private final OrgImageRepository orgImageRepository;
    //버킷 이름 동적 할당
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    //버킷 주소 동적 할당
    @Value("${cloud.aws.s3.bucket.url}")
    private String defaultUrl;

    private final AmazonS3Client amazonS3Client;
    @Autowired
    public ImageUploadService(OrgImageRepository orgImageRepository, AmazonS3Client amazonS3Client) {
        this.orgImageRepository = orgImageRepository;
        this.amazonS3Client = amazonS3Client;
    }
    public String saveFile(MultipartFile files,Long id) throws IOException {
        if (files.isEmpty()) {
            System.out.println("@@@실패@@@@@");
            return null;
        }
        String url;
        // 원래 파일 이름 추출
        String origName = files.getOriginalFilename();
        // 파일 이름으로 쓸 uuid 생성
        String uuid = UUID.randomUUID().toString();
        // 확장자 추출(ex : .png)
        String extension = origName.substring(origName.lastIndexOf("."));
        // uuid와 확장자 결합
        String savedName = uuid + extension;
        // 파일을 불러올 때 사용할 파일 경로
        File file = new File(System.getProperty("user.dir")+savedName);
        String savedPath = bucket + savedName;
        // 실제로 로컬에 uuid를 파일명으로 저장
        files.transferTo(file);
        uploadOnS3(savedName,file);
        url=defaultUrl+"/"+savedName;
        file.delete();
        OrgImage orgImage =new OrgImage();
        orgImage.setImageType("0");
        orgImage.setExtension(extension);
        orgImage.setOrgId(id);
        orgImage.setSaveName(savedName);
        orgImage.setOriginName(origName);
        orgImage.setSavePath(url);
        orgImageRepository.save(orgImage);
        return url;
    }
    public List<OrgImage> findAllByOrgId(Long id){
        return orgImageRepository.findAllByOrgId(id);
    }

    public List<OrgImage> findAll() {
        return orgImageRepository.findAll();
    }

    private void uploadOnS3(final String findName, final File file) {
        // AWS S3 전송 객체 생성
        final TransferManager transferManager = new TransferManager(this.amazonS3Client);
        // 요청 객체 생성
        final PutObjectRequest request = new PutObjectRequest(bucket, findName, file).withCannedAcl(CannedAccessControlList.PublicReadWrite);
        // 업로드 시도
        final Upload upload =  transferManager.upload(request);

        try {
            upload.waitForCompletion();
        } catch (AmazonClientException amazonClientException) {
            log.error(amazonClientException.getMessage());
        } catch (InterruptedException e) {
            log.error(e.getMessage());
        }
    }
}