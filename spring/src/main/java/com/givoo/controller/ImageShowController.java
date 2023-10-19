package com.givoo.controller;

import com.givoo.entity.OrgImage;
import com.givoo.service.ImageUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ImageShowController {
    private final ImageUploadService imageUploadService;
    @Autowired
    public ImageShowController(ImageUploadService imageUploadService) {
        this.imageUploadService = imageUploadService;
    }

    @GetMapping("org/images/{id}")
    public List<OrgImage> showImage(@PathVariable("id")Long id){
        return imageUploadService.findAllByOrgId(id);
    }

    @GetMapping("org/images/all")
    public List<OrgImage> allImage(){
        return imageUploadService.findAll();
    }
}
