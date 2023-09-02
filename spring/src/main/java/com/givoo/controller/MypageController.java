package com.givoo.controller;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.donation.Donation;
import com.givoo.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:1000")
public class MypageController {
    public final MypageService mypageService;
    @Autowired
    public MypageController(MypageService mypageService) {
        this.mypageService = mypageService;
    }

    @GetMapping("/mypage/dnt/{userid}")
    public List<Donation> myDnt(@PathVariable("userid") Long userid){
        return mypageService.myDnt(userid);
    }

    @GetMapping("/mypage/org/{userid}")
    public List<MyOrgDTO> myOrg(@PathVariable("userid") Long userid){
        return mypageService.myOrg(userid);
    }
}
