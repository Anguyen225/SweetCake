package com.poly.site.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	@RequestMapping("cart/view")
	public String view() {
		return "sites/cart/view";
	}
}
