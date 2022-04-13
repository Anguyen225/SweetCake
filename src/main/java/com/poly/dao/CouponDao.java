package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Coupon;

public interface CouponDao extends JpaRepository<Coupon, String> {
	
	@Query(value ="select * from coupons "
			+ " where ( (category = 'true' and enddate >= getdate() ) or (enddate >= getdate() and customerid = ?1) ) "
			+ "	and code not in (select couponcode from orders where customerid = ?1 and couponcode is not null)",
				nativeQuery = true)
	List<Coupon> findCouponById(String username);

}
