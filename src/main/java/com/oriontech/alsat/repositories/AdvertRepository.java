package com.oriontech.alsat.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Advert;

@Repository
public interface AdvertRepository extends CrudRepository<Advert, String> {

	// Girilen limit ve status'a göre creted_at'e göre sondan başa sıralayarak tüm
	// ilanları döner
	@Query(value = "SELECT * from advert WHERE status = :status ORDER BY created_at DESC LIMIT :n ", nativeQuery = true)
	public List<Advert> findAllLatestAdvertsByStatusWithLimit(@Param("status") boolean status, @Param("n") int n);

	// status'a göre ve creted_at'e göre sondan başa sıralayarak tüm ilanları döner
	@Query(value = "SELECT * from advert WHERE status = :status ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestAdvertsByStatus(@Param("status") boolean status);

	// 20 adet Vitrin İlanını created_at'e göre sondan başa sıralayarak döner
	@Query(value = "SELECT * from advert WHERE status = true AND showcase = true ORDER BY created_at DESC LIMIT 20", nativeQuery = true)
	public List<Advert> findShowcaseLatestAdvertsByStatus();

	// 30 adet Vitrin Olmayan İlanı created_at'e göre sondan başa sıralayarak döner
	@Query(value = "SELECT * from advert WHERE status = true AND showcase = false ORDER BY created_at DESC LIMIT 30", nativeQuery = true)
	public List<Advert> findNotShowcaseLatestAdverts();

	// Girilen kullanıya ait olan ilanların hepsini created_at'e göre sondan başa sıralayarak döner
	@Query(value = "SELECT * from advert WHERE account_id = :accountId ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestAdvertByAccount(@Param("accountId") Long accountId);

	// Girilen kullanıya ait olan ilanların aktif olanlarını created_at'e göre sondan başa sıralayarak döner
	@Query(value = "SELECT * from advert WHERE account_id = :accountId  and status=true ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestActiveAdvertByAccount(@Param("accountId") Long accountId);

	// Girilen kullanıya ait olan ilanların pasif olanlarını created_at'e göre sondan başa sıralayarak döner
	@Query(value = "SELECT * from advert WHERE account_id = :accountId  and status=false ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestDeactiveAdvertByAccount(@Param("accountId") Long accountId);

	// Girilen kategoriye ait olan aktif ilanları döner
	@Query(value = "SELECT * from advert WHERE category_id = :categoryId and status=true", nativeQuery = true)
	public List<Advert> findAllLatestActiveAdvertByCategory(@Param("categoryId") Long categoryId);

	//Girilen metne göre ilan içinde (aciklama, baslik) alanlarında arama yaparak uyan ilanları döner
	@Query(value = "SELECT * from advert  WHERE LOWER(baslik) LIKE LOWER(concat('%', :query,'%')) or LOWER(aciklama) LIKE LOWER(concat('%', :query,'%'))", nativeQuery = true)
	public List<Advert> searchAdverts(@Param("query") String query);

	// En çok görülen ilanları büyükten küçüğe sıralıyoruz
	@Query(value = "SELECT a FROM AdvertViews av INNER JOIN Advert a  on av.advert=a GROUP BY av.advert ORDER BY SUM(av.howManyViewedAt) DESC ")
	List<Advert> findAdvertsByViewedAtSum();

}
