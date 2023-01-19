package com.yb.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.service.MemberService;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private MatchingService maService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("joinMain.me")
	public String selectJoin() {
		return "member/joinMain";
	}

	@RequestMapping("CustomerEnrollForm.me")
	public String CustomerEnrollForm() {
		return "member/join_c";

	}

	@RequestMapping("FreelancerEnrollForm.me")
	public String FreelancerEnrollForm() {
		return "member/join_f";
	}

	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping("mypage.me")
	public String mypage(String type) {
		if (type.equals("F")) {
			return "member/mypage_f";
		} else {
			return "member/mypage_c";
		}
	}

	@RequestMapping("toMain.me")
	public String toMain() {
		return "redirect:/";
	}

	@RequestMapping("freeProfile.me")
	public String freeProfile() {
		return "member/freeProfile";
	}

	@RequestMapping("myInfoEdit.me")
	public String myInfoEdit() {
		return "member/myInfoEdit";
	}

	@RequestMapping("main.me")
	public String main() {
		return "../views/main";
	}

	@ResponseBody
	@RequestMapping(value = "selectServiceList", produces = "application/json; charset=utf-8")
	public String selectServiceList(int sNum) {
		ArrayList<Categories> list = mService.selectServiceList(sNum);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "selectLocationList", produces = "application/json; charset=utf-8")
	public String selectLocationList(int lNum) {
		ArrayList<Location> list = mService.selectLocationList(lNum);
		return new Gson().toJson(list);
	}

	/* 프리랜서 회원가입 */
	@RequestMapping("FreelancerInsert.me")
	public String insertFreelancer(Freelancer f, String region, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(f.getPass());
		f.setPass(encPwd);

		f.setCareer(f.getCareer() + "년");
		f.setLocation(region + " " + f.getLocation());
		int result = mService.insertFreelancer(f);
		int result2 = 0;
		if (result > 0) {
			Freelancer free = mService.loginMemberF(f.getUserId());
			result2 = mService.insertFreelancerProfile(free);
			if (result2 > 0) {
				session.setAttribute("alertMsg", "회원가입이 완료되었습니다😀");
				return "redirect:/";
			} else {
				model.addAttribute("errorMsg", "회원가입에 실패했습니다😢");
				return "member/join_f";
			}
		} else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다😢");
			return "member/join_f";
		}
	}

	/* 일반고객 회원가입 */
	@RequestMapping("CustomerInsert.me")
	public String insertCustomer(Customer c, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(c.getPass());
		c.setPass(encPwd);

		int result = mService.insertCustomer(c);
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다😀");
			return "redirect:/";
		} else {

			model.addAttribute("errorMsg", "회원가입에 실패했습니다😢");
			return "member/join_c";
		}
	}

	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		return count > 0 ? "NNN" : "YYY";
	}

	/* 로그인 */
	@RequestMapping("login.me")
	public ModelAndView loginMemeber(Customer c, ModelAndView mv, HttpSession session) {
		Customer loginUser = mService.loginMember(c.getUserId());

		if (loginUser != null && bcryptPasswordEncoder.matches(c.getPass(), loginUser.getPass())) {
			System.out.println("성공 : id=" + loginUser.getUserId() + ", type=" + loginUser.getType());
			if (loginUser.getType().equals("F")) {
				Freelancer loginUserF = mService.loginMemberF(c.getUserId());
				session.setAttribute("loginUserF", loginUserF);
				// mv.addObject("customerMsg", "님이 로그인 하셨습니다.");
				mv.setViewName("main");
			} else {
				Customer loginUserC = mService.loginMemberC(c.getUserId());
				session.setAttribute("loginUserC", loginUserC);
				// mv.addObject("freelancerMsg", c.getUserId() + "님이 로그인 하셨습니다.");
				mv.setViewName("main");
			}
		} else {
			mv.addObject("errorMsg", "로그인에 실패했습니다😢");
			mv.setViewName("member/login");
		}
		return mv;
	}

	/* 로그아웃 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	/* 프리랜서 업데이트 */
	@RequestMapping("myInfoUpdate.me")
	public String updateFreeMember(Freelancer f, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(f.getPass());
		f.setPass(encPwd);
		int result = mService.updateFreeMember(f);
		if (result > 0) {
			session.setAttribute("loginUserF", mService.loginMemberF(f.getUserId()));
			session.setAttribute("alertMsg", "성공적으로 정보가 변경되었습니다");
			return "redirect:/";

		} else {
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			return "redirect:/";
		}

	}

	/* 프리랜서 탈퇴 */
	@RequestMapping("freeDelete.me")
	public String deleteFreeMember(String pass, int freeNum, HttpSession session, Model model) {
		String encPwd = ((Freelancer) session.getAttribute("loginUserF")).getPass(); // 현재 입력한 비밀번호 가져오는거 encPwd는 지금 입력한
																						// 비밀번호
		if (bcryptPasswordEncoder.matches(pass, encPwd)) {// 지금 입력한 비밀번호와 원래 userPwd->데이터베이스에 들어가 있는 비밀번호가 맞는지 match로 확인
			int result = mService.deleteFreeMember(freeNum); // 맞으면 여기 실행
			if (result > 0) { // result가 0보다 크면 회원가입이 잘 들어갈 시 1이 들어가니까 잘 들어갔다는 뜻
				session.removeAttribute("loginUserF");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다<br> 그동안 이용해 주셔서 감사합니다.");
				return "member/joinMain";

			} else {
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "member/join_f";
			}
		} else {
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해 주세요");
			return "member/myInfoEdit";
		}

	}

	/* 프리랜서 프로필 수정 */
	@RequestMapping("profileUpdate.me")
	public String profileUpdate(FreelancerProfile fp, Freelancer fr, Model model) {
		int result = mService.updateProfile(fp);

		if(result > 0) {
			FreelancerProfile f = maService.selectFreelancerDetail(fr);
			model.addAttribute("f", f);
		}
		return "member/freeProfile2";
	}

	@RequestMapping("FreelancerUpdate.me")

	public String FreelancerUpdate(Freelancer free, Freelancer fr, Model model) {
		if(free.getCareer() != null) {
			free.setCareer(free.getCareer() + "년");
		}
		int result = mService.updateFreelancer(free);
		if(result > 0) {
			FreelancerProfile f = maService.selectFreelancerDetail(fr);

			model.addAttribute("f", f);
		}
		return "member/freeProfile2";
	}
}
