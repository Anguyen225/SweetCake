package com.poly.site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.poly.entity.Account;
import com.poly.service.UserService;

public class BaseController {
	protected @Autowired UserService userService;
	
	protected Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	@ModelAttribute("cu")
	public Account getCurrentLoggedUser() {
		if(getAuthentication()==null) return null;
		if(getAuthentication().getName()==null || getAuthentication().getName().trim().isEmpty()) return null;
		
		return userService.getCurrentLoggedUser();
	}
}
