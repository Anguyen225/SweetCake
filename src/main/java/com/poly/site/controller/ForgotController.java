package com.poly.site.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AccountDao;
import com.poly.entity.Account;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.service.imp.MailerServiceImpl;

import net.bytebuddy.utility.RandomString;

@Controller

public class ForgotController {
	@Autowired
	AccountDao dao;
	@Autowired
	SessionService session;
	@Autowired
	ParamService param;
	@Autowired
	ServletContext context;
	@Autowired
	MailerServiceImpl mailer;
	
	@RequestMapping("account/forgot")
	public String index(Model model) {
		return "sites/account/forgot";
	}
	
	@PostMapping("account/forgot")
	public String change(Model model) {
	
		String username = param.getString("username", "");
		String subject = "Send your Password!";
		String body = "Your Password: ";
		String password;
		String randomPassword = RandomString.make(6);
		
		try {
			Account user = dao.findById(username).get();
			  if(!user.getUsername().equals(username)) {
				  model.addAttribute("message",
			  "Sai email!");
			  }else {			 
					user.setPassword(randomPassword);
					dao.save(user);
					mailer.send(username, subject, body+randomPassword);
					model.addAttribute("message", "Gửi thành công, vui lòng kiểm tra email");
			  }
				
		} catch (Exception e) {
			model.addAttribute("message", "Tài khoản không tồn tại!");
		}
		return "sites/security/login";
	}
}
