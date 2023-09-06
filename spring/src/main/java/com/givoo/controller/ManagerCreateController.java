//package com.givoo.controller;
//
//import com.givoo.dto.ManagerCreateDTO;
//import com.givoo.service.ManagerService;
//import jakarta.validation.Valid;
//
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//@RequestMapping("/members")
//public class MemberController {
//
//    private final PasswordEncoder passwordEncoder;
//    private final ManagerService managerService;
//
//    @GetMapping("/signup")
//    public String memberForm(Model model){
//        model.addAttribute("managerCreateDTO", new ManagerCreateDTO());
//        return "member/memberForm";
//
//    }//회원가입 페이지 이동
//
//    @PostMapping("/signup")
//    public String memberForm(@Valid ManagerCreateDTO managerCreateDTO,
//                             BindingResult bindingResult, Model model){
//
//        /* 회원가입폼으로 전달된 데이타가 문제가 있으면 다시 form으로 되돌아감. */
//        if(bindingResult.hasErrors()){
//            return "signup";
//        }
//
//        try {
//            Manager manager = Manager.createMember(managerCreateDTO, passwordEncoder);
//            managerService.saveManager(member);
//        }catch(IllegalStateException e){
//            /* 오류인 경우 오류 메세지와 함께 form으로 이동 */
//            model.addAttribute("errorMessage", e.getMessage());
//            return "member/memberForm";
//        }
//        /* 저장 후 root(/)로 이동  */
//        return "redirect:/";
//    }//회원가입 요청
//
//    @GetMapping("/login")
//    public String loginMember(){
//        return "/member/memberLoginForm";
//    }
//
//    @GetMapping("/login/error")
//    public String loginError(Model model){
//        model.addAttribute("loginErrorMsg","아이디 또는 비밀번호를 확인해주세요");
//        return "/member/memberLoginForm";
//    }
//
//
//}
