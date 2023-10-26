package com.givoo.controller;

import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.Favorites;
import com.givoo.entity.Inquiry;
import com.givoo.entity.Notice;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationRegular;
import com.givoo.service.MypageService;
import com.givoo.service.NoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "MyPage", description = "MyPage 기능 관련 API")
@RestController
@RequestMapping("/mypage")
public class MypageController {
    public final MypageService mypageService;
    public final NoticeService noticeService;
    @Autowired
    public MypageController(MypageService mypageService, NoticeService noticeService) {
        this.mypageService = mypageService;
        this.noticeService = noticeService;
    }

    @GetMapping("/dntresult/{userid}")
    @Operation(summary = "기부 이력 확인", description = "기부 이력 확인")
    public List<Donation> myDnt(@PathVariable("userid") Long userid) {
        return mypageService.myDnt(userid);
    }

    @GetMapping("/mypage/dntresult/{dntid}")
    @Operation(summary = "세부 기부 이력 확인", description = "세부 기부 이력 확인")
    public Donation myDonationDetail(@PathVariable("dntid") Long id) {
        return mypageService.myDntDetail(id);
    }

    @GetMapping("/org/{userid}")
    @Operation(summary = "내 관심 단체", description = "등록된 관심 단체 확인")
    public List<MyOrgDTO> myOrg(@PathVariable("userid") Long userid) {
        return mypageService.myOrg(userid);
    }

    @GetMapping("/dntregul/{userid}")
    @Operation(summary = "정기 기부 이력 확인", description = "정기 기부 이력 확인")
    public List<DonationRegular> findByUserID(@PathVariable("userid") Long userId) {
        return mypageService.findByUserID(userId);
    }

    @PatchMapping("/dntregul/{dntRegularId}")
    @Operation(summary = "정기 기부 해지 / 해지 취소", description = "정기기부 해지 / 해지 취소")
    public List<DonationRegular> findByIsusenowAndDntRegularId(@PathVariable("dntRegularId") Long dntRegularId, @RequestParam String isusenow) {
        return mypageService.findByIsusenowAndDntRegularId(isusenow, dntRegularId);
    }

    @PatchMapping("/{dntRegularId}/toggle-isusenow")
    @Operation(summary = "정기 기부 사용여부 토글", description = "정기기부 사용여부 토글")
    public ResponseEntity<String> findByDntRegularId(@PathVariable Long dntRegularId) {
        mypageService.findByDntRegularId(dntRegularId);
        return ResponseEntity.ok("Isusenow 토글 완료");
    }

    @PostMapping("/fav/apply")
    @Operation(summary = "관심 단체 등록", description = "관심 단체 등록")
    public void fav(@RequestBody Favorites fav) {
        mypageService.fav(fav.getOrgId(),fav.getUserId());
    }
    @GetMapping("/fav/{favId}")
    @Operation(summary = "관심 단체 등록 해지", description = "관심 단체 등록 해지")
    public void favDel(@PathVariable("favId") Long favId){
        System.out.println("favId:" + favId);
        mypageService.favUpdate(favId);
    }

    @PostMapping("/inquiry/send")
    public void snedInquiry(@RequestBody Inquiry inq){
        mypageService.saveInquiry(inq.getUserId(),inq.getTitle(),inq.getContent());
        }
    @GetMapping("/inquiry/{userid}")
    public List<Inquiry> myInquiry(@PathVariable ("userid") Long userId){
       return mypageService.myInquiry(userId);
    }

    @GetMapping("/notice")
    public List<Notice> noticeList(){
        return noticeService.finAll();
    }
}

