package com.poly.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AccountDao;
import com.poly.entity.Account;
import com.poly.service.ParamService;
import com.poly.service.UserService;

import net.bytebuddy.utility.RandomString;

@Controller
public class SecurityController extends BaseController {
	
	@Autowired
	UserService User;
	
	@Autowired
	AccountDao dao;
	
	@Autowired
	ParamService param;
	
	@RequestMapping("/security/login/form")
	public String loginForm(Model model) {
		model.addAttribute("message", "Vui lòng đăng nhập");
		return "sites/security/login";
	}
	
	@RequestMapping("/security/login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Đăng nhập thành công");
		return "sites/security/login";
	}
	
	@RequestMapping("/security/login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập");
		return "sites/security/login";
	}
	
	@RequestMapping("/security/login/unauthoried")
	public String unauthoried(Model model) {
		model.addAttribute("message", "Không có quyền truy xuất");
		return "sites/security/login";
	}
	
	@RequestMapping("/security/logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("message", "Bạn đã đăng xuất");
		return "sites/security/login";
	}
	
	@RequestMapping("/oauth2/login/success")
	public String success(OAuth2AuthenticationToken oauth2) {
		User.loginFromOAuth2(oauth2);
		if(oauth2.isAuthenticated()) {
			String email = oauth2.getPrincipal().getAttribute("email");
			Account account = dao.findByUsername(email);
			if(account==null) {
				account = new Account();
				account.setUsername(email);
				account.setFullname(oauth2.getPrincipal().getAttribute("name"));
				account.setActive(true);
				account.setRole("CUST");
				account.setPassword(RandomString.make(6));
				dao.save(account);
			}
			if(account.getActive()==false) {
				return "redirect:/security/logoff";
			}
		}
		return "redirect:/layout/show";
		}
	
		
		  @RequestMapping("account/profile")
		  public String information( ) {	  
		  return "sites/account/profile.html"; 
		  }
		  
		  @RequestMapping("account/update")
		  public String update(Account account) {
			  dao.save(account);		  
			  return "redirect:/layout/show";
		  }
		 
}
