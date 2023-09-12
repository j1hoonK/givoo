package com.givoo.controller;

import com.givoo.service.ImageUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class ImageUploadController {

    private final ImageUploadService imageUploadService;

    @Autowired
    public ImageUploadController(ImageUploadService imageUploadService, ImageUploadService imageUploadService1) {
        this.imageUploadService = imageUploadService1;
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam(value = "file",required = false) MultipartFile file) throws IOException {
        imageUploadService.saveFile(file);

        return "redirect:/";
    }
    @GetMapping("/imageupload")
    public String imageupload(){
        return "image_upload";
    }
    @Value("${file.dir}") // 이미지 업로드 디렉토리 경로
    private String imageUploadDirectory;
    @GetMapping("/images/{imageName}")
    public ResponseEntity<Resource> serveImage(@PathVariable String imageName) {
        try {
            // 이미지 디렉토리에서 이미지 파일을 로드
            Path imagePath = Paths.get(imageUploadDirectory).resolve(imageName+".png");
            Resource resource = new UrlResource(imagePath.toUri());

            if (resource.exists() && resource.isReadable()) {
                return ResponseEntity.ok()
                        .contentType(MediaType.IMAGE_JPEG) // 이미지 타입에 따라 적절히 변경
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
