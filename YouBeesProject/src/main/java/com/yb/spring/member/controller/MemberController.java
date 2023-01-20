package com.yb.spring.member.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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

	@RequestMapping("myInfoEditF.me")
	public String myInfoEditF() {
		return "member/myInfoEditF";
	}

	@RequestMapping("myInfoEditC.me")
	public String myInfoEditC() {
		return "member/myInfoEditC";
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
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다😀");
			return "redirect:/";
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
			model.addAttribute("errorMsg", "회원가입 실패했습니다😢");
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
			// System.out.println("성공 : id=" + loginUser.getUserId() +", type=" +
			// loginUser.getType());
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
			mv.addObject("errorMsg", "로그인 실패");
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
	@RequestMapping("myInfoUpdateF.me")
	public String updateFreeMember(Freelancer f, MultipartFile upfile, HttpSession session, Model model) {

		if (!upfile.getOriginalFilename().equals("")) {
			if (f.getProfileName() != null) {
				new File(session.getServletContext().getRealPath(f.getChangeName())).delete();
			}
			String changeName = changeFilename(upfile, session);
			f.setProfileName(upfile.getOriginalFilename());
			f.setChangeName("resources/uploadProfile/" + changeName);
		}

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
			return "member/myInfoEditF";
		}

	}

	/* 일반고객 업데이트 */
	@RequestMapping("myInfoUpdateC.me")
	public String updateCusMember(Customer c, MultipartFile upfile, HttpSession session, Model model) {
		if (!upfile.getOriginalFilename().equals("")) {
			if (c.getProfileName() != null) {
				new File(session.getServletContext().getRealPath(c.getChangeName())).delete();
			}
			String changeName = changeFilename(upfile, session);
			c.setProfileName(upfile.getOriginalFilename());
			c.setChangeName("resources/uploadProfile/" + changeName);
		}

		String encPwd = bcryptPasswordEncoder.encode(c.getPass());
		c.setPass(encPwd);
		int result = mService.updateCusMember(c);
		if (result > 0) {
			session.setAttribute("loginUserC", mService.loginMemberC(c.getUserId()));
			session.setAttribute("alertMsg", "성공적으로 정보가 변경되었습니다");
			return "redirect:/";

		} else {
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			return "redirect:/";
		}
	}

	/* 프리랜서 프로필 수정 */
	@RequestMapping("profileUpdate.me")
	public String profileUpdate(FreelancerProfile fp, Freelancer fc, Model model) {
		int result = mService.updateProfile(fp);

		if (result > 0) {
			FreelancerProfile f = maService.selectFreelancerDetail(fc);

			model.addAttribute("f", f);
		}
	}

	public String changeFilename(MultipartFile reupfile, HttpSession session) {
		String originName = reupfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int) (Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;

		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아오기
		String savePath = session.getServletContext().getRealPath("/resources/uploadProfile/");
		System.out.println(savePath);
		System.out.println(changeName);
		System.out.println(savePath + changeName);
		try {
			reupfile.transferTo(new File(savePath + changeName));
			System.out.println("트라이문성공");
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("FreelancerUpdate.me")
	public String FreelancerUpdate(Freelancer free, Model model) {
		if (free.getCareer() != null) {
			free.setCareer(free.getCareer() + "년");
		}
		int result = mService.updateFreelancer(free); 

		if (result > 0) {
			FreelancerProfile f = maService.selectFreelancerDetail(free);

			model.addAttribute("f", f);

		}
		return changeName;
	}

	/* 일반고객 탈퇴 */
	@RequestMapping("cusDelete.me")
	public String deleteCusMember(String pass, int cusNum, HttpSession session, Model model) {
		String encPwd = ((Customer) session.getAttribute("loginUserC")).getPass(); // 현재 입력한 비밀번호 가져오는거 encPwd는 지금 입력한
																					// 비밀번호
		if (bcryptPasswordEncoder.matches(pass, encPwd)) {// 지금 입력한 비밀번호와 원래 userPwd->데이터베이스에 들어가 있는 비밀번호가 맞는지 match로 확인
			int result = mService.deleteCusMember(cusNum); // 맞으면 여기 실행
			if (result > 0) { // result가 0보다 크면 회원가입이 잘 들어갈 시 1이 들어가니까 잘 들어갔다는 뜻
				session.removeAttribute("loginUserC");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다<br> 그동안 이용해 주셔서 감사합니다.");
				return "member/joinMain";

			} else {
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "member/join_f";
			}
		} else {
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해 주세요");
			return "member/myInfoEditC";
		}

	}
}

/*
 * 프리랜서 프로필 수정
 * 
 * @RequestMapping("profileUpdate.me") public String
 * profileUpdate(FreelancerProfile fp, Model model) { int result =
 * mService.updateProfile(fp); if (result > 0) { FreelancerProfile f =
 * maService.selectFreelancerDetail(fp.getFreeNum()); model.addAttribute("f",
 * f); } }
 * 
 * @RequestMapping("FreelancerUpdate.me") public String
 * FreelancerUpdate(Freelancer free, Model model) { if (free.getCareer() !=
 * null) { free.setCareer(free.getCareer() + "년"); } int result =
 * mService.updateFreelancer(free); if (result > 0) { FreelancerProfile f =
 * maService.selectFreelancerDetail(free.getFreeNum()); model.addAttribute("f",
 * f); }
 * 
 * }
 */
