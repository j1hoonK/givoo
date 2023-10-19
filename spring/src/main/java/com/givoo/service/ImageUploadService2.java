package com.givoo.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.amazonaws.AmazonClientException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;
import com.givoo.entity.OrgImage;
import com.givoo.entity.organization.Organization;
import com.givoo.repository.OrgImageRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ImageUploadService2 {
    private final OrgImageRepository orgImageRepository;
    private final OrganizationService organizationService;
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    @Value("${cloud.aws.s3.bucket.url}")
    private String defaultUrl;

    String path= "C:\\Users\\KIBWA_19\\Desktop\\orgimages";
    private final AmazonS3Client amazonS3Client;

    public ImageUploadService2(OrgImageRepository orgImageRepository, OrganizationService organizationService, AmazonS3Client amazonS3Client) {
        this.orgImageRepository = orgImageRepository;
        this.organizationService = organizationService;
        this.amazonS3Client = amazonS3Client;
    }

    public void getImagesFromFolder() {
        Long id = 43L;
        List<File> imageFiles = new ArrayList<>();
        File folder = new File(path);
        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles();

            if (files != null) {
                for (File file : files) {
                    if (file.isFile() && isImageFile(file.getName())) {
                        imageFiles.add(file);
                    }
                }
            }
        }
        for (File imageFile : imageFiles) {
           Optional<Organization> org =  organizationService.findById(id);
           if(org.isPresent()) {
               String originalFileName = imageFile.getName();
               saveFile(imageFile, id, originalFileName);

           }
            id++;
        }
    }

    private boolean isImageFile(String fileName) {
        String[] validExtensions = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp"};
        for (String extension : validExtensions) {
            if (fileName.toLowerCase().endsWith(extension)) {
                return true;
            }
        }
        return false;
    }

    private void saveFile(File file, Long id, String originalFileName) {
        String uuid = UUID.randomUUID().toString();
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String savedName = uuid + extension;
        String savedPath = bucket + savedName;

        uploadOnS3(savedName, file);

        String url = defaultUrl + "/" + savedName;

        OrgImage orgImage = new OrgImage();
        orgImage.setImageType("0");
        orgImage.setExtension(extension);
        orgImage.setOrgId(id);
        orgImage.setSaveName(savedName);
        orgImage.setOriginName(originalFileName);
        orgImage.setSavePath(url);
        orgImageRepository.save(orgImage);
    }

    private void uploadOnS3(String findName, File file) {
        final TransferManager transferManager = new TransferManager(this.amazonS3Client);
        final PutObjectRequest request = new PutObjectRequest(bucket, findName, file);
        request.withCannedAcl(CannedAccessControlList.PublicReadWrite);

        final Upload upload = transferManager.upload(request);

        try {
            upload.waitForCompletion();
        } catch (AmazonClientException amazonClientException) {
            // Handle the exception, e.g., log it.
        } catch (InterruptedException e) {
            // Handle the exception, e.g., log it.
        }
    }

}
