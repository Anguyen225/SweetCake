 package com.poly.site.controller;

 import java.util.Optional;

 import javax.servlet.http.HttpServletRequest;

 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.data.domain.Page;
 import org.springframework.data.domain.PageRequest;
 import org.springframework.data.domain.Pageable;
 import org.springframework.stereotype.Controller;
 import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.CouponDao;
import com.poly.dao.OrderDao;
import com.poly.entity.Coupon;
import com.poly.entity.Order;
 import com.poly.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDao dao;
	
	@Autowired
	CouponDao cdao;
	
	@RequestMapping("order/checkout")
		public String checkout() {
			return "sites/order/checkout.html";
		}
	@RequestMapping("order/list")
	public String List(Model model,
			@RequestParam("p") Optional<Integer> order,
			HttpServletRequest request) {
		String username = request.getRemoteUser();
		Pageable pageable = PageRequest.of(order.orElse(0), 5);
		Page<Order> page = dao.findByUsername(username, pageable);
		model.addAttribute("page", page);
		
		
		return "sites/order/list";
	}
	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id")Long id, Model model) {
		Order order = orderService.findById(id);
		int value = 0;
		Coupon coupon = new Coupon();
		if(order.getCouponcode() != null) {
			coupon = cdao.findById(order.getCouponcode()).get();
			value = coupon.getValue();
		}		
		double exclueShip = order.getPrice() - order.getShipfee();
		double sum = exclueShip/(100- value )*100;
		double discount = exclueShip - sum;
		model.addAttribute("order",order);
		model.addAttribute("sum",sum);
		model.addAttribute("discount",discount);
		return "sites/order/detail";
	}
	@PostMapping("/{id}")
	public String update(@PathVariable long id, @ModelAttribute("order") Order order) {
		Order ord = dao.getById(id);
		ord.setOrderstatus("canceled");
		ord.setWhocancel(true);
		ord.setReason(order.getReason());
		dao.save(ord);
		return "redirect:/order/detail/{id}";
		
	}
}
