package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor @NoArgsConstructor
@Entity @Table(name="Orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	private String Recipientname;
	private String phone;
	private String address;
	private String email;
	private Double price;
	private Double shipfee;
	private String paymentmethod;
	private String orderstatus;
	private Boolean whocancel;
	private String reason;
	private String staffid;
	private String couponcode;
	
	@ManyToOne
	@JoinColumn(name="customerid")
	private Account account;

	
	@ManyToOne
	@JoinColumn(name="district")
	private District district;
	
	@JsonIgnore
	@OneToMany(mappedBy = "order")
	private List<Orderdetail>orderdetails;
	
}
