package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	@Query("select p from Product p where p.category.id=?1 and p.available = 'true'")
	Page<Product> findAllByCate(String cid,Pageable page);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1 and o.available = 'true'")
	Page<Product> findByKeywords(String keywords, Pageable pageable);

	@Query("SELECT o FROM Product o WHERE o.available = 'true' and o.price BETWEEN ?1 AND ?2 ")
	Page<Product> findByPrice(double minPrice, double maxPrice, Pageable pageable);


	@Query("select p from Product p where p.available = 'true'")
	Page<Product> findAllAvailable(Pageable pageable);

	
	@Query(value="select count(*) from products where categoryid like ?1 ", nativeQuery = true)
	Long countProductsByCategory(String category);
	
	@Query(value= "select top 5 * from products "
			+ "where available='true' and id in ("
			+ "select top 20 productid from orderdetails group by productid order by sum(quantity) desc )", nativeQuery = true)			 		
	List<Product> findBestSale();
	
	@Query(value= "select * from products "
			+ "where id in ("
			+ "select top 8 productid from orderdetails group by productid order by sum(quantity) desc )", nativeQuery = true)			 		
	Page<Product> findBestSaleInDex(Pageable pageable);
	
	
	@Query("select p from Product p where p.name like ?1")
	List<Product> findByName(String name);
	
}
