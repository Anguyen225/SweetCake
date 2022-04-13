package com.poly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@SpringBootApplication
public class SweetCake4GuysApplication {

	public static void main(String[] args) {
		SpringApplication.run(SweetCake4GuysApplication.class, args);
	}
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}

}
