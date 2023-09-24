package com.givoo.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.givoo.dto.mypage.MyOrgDTO;
import com.givoo.entity.Favorites;
import com.givoo.entity.Users;
import com.givoo.entity.donation.Donation;
import com.givoo.entity.donation.DonationRegular;
import com.givoo.entity.organization.Organization;
import com.givoo.service.MypageService;
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

    @Autowired
    public MypageController(MypageService mypageService) {
        this.mypageService = mypageService;
    }

    @GetMapping("/dntresult/{userid}")  // 기부 이력 확인
    public List<Donation> myDnt(@PathVariable("userid") Long userid) {
        return mypageService.myDnt(userid);
    }

    @GetMapping("/mypage/dntresult/{dntid}")    // 세부 기부 이력 확인
    public Donation myDonationDetail(@PathVariable("dntid") Long id) {
        return mypageService.myDntDetail(id);
    }

    @GetMapping("/org/{userid}")    // 내 단체
    public List<MyOrgDTO> myOrg(@PathVariable("userid") Long userid) {
        return mypageService.myOrg(userid);
    }

    @GetMapping("/dntregul/{userid}")   //  정기 기부 관리
    public List<DonationRegular> findByUserID(@PathVariable("userid") Long userId) {
        return mypageService.findByUserID(userId);
    }

    @PatchMapping("/dntregul/{dntRegularId}")   // 정기 기부 해지 신청-해지 취소
    public List<DonationRegular> findByIsusenowAndDntRegularId(@PathVariable("dntRegularId") Long dntRegularId, @RequestParam String isusenow) {
        return mypageService.findByIsusenowAndDntRegularId(isusenow, dntRegularId);
    }

    @PatchMapping("/{dntRegularId}/toggle-isusenow")   // isusenow 토글 엔드포인트
    public ResponseEntity<String> findByDntRegularId(@PathVariable Long dntRegularId) {
        mypageService.findByDntRegularId(dntRegularId);
        return ResponseEntity.ok("Isusenow 토글 완료");
    }

    @PostMapping("/fav/apply")
    public void fav(@RequestBody Favorites fav) {
        mypageService.fav(fav.getOrgId(),fav.getUserId());
    }
    @GetMapping("/fav/{favId}")
    public void favDel(@PathVariable("favId") Long favId){
        System.out.println("favId:" + favId);
        mypageService.favUpdate(favId);
    }
}
