package com.oriontech.alsat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Irk;
import com.oriontech.alsat.models.Role;
import com.oriontech.alsat.models.Tip;
import com.oriontech.alsat.models.Yas;
import com.oriontech.alsat.repositories.AccountRepository;
import com.oriontech.alsat.repositories.AdvertDetailRepository;
import com.oriontech.alsat.repositories.AdvertRepository;
import com.oriontech.alsat.repositories.CategoryRepository;
import com.oriontech.alsat.repositories.IrkRepository;
import com.oriontech.alsat.repositories.RoleRepository;
import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.repositories.YasRepository;

import lombok.Data;

@Data
@Component
@ConditionalOnProperty(name = "alsat.db.recreate", havingValue = "true")
public class DbSeeder implements CommandLineRunner {
	private final RoleRepository roleRepository;
	private final AccountRepository accountRepository;
	private final CategoryRepository categoryRepository;
	private final AdvertDetailRepository advertDetailRepository;
	private final AdvertRepository advertRepository;
	private final TipRepository tipRepository;
	private final IrkRepository irkRepository;
	private final YasRepository yasRepository;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Override
	public void run(String... args) throws Exception {

		//
		Role adminRole = new Role("ROLE_ADMIN");
		Role ownerRole = new Role("ROLE_OWNER");
		Role userRole = new Role("ROLE_USER");

		roleRepository.save(adminRole);
		roleRepository.save(ownerRole);
		roleRepository.save(userRole);

		//
		Account admin = new Account("admin", encoder.encode("csylmz"), "admin@alsat.com");
		admin.setRole(adminRole);
		admin.setFullName("Admin");
		Account user = new Account("user", encoder.encode("csylmz"), "user@alsat.com");
		user.setRole(userRole);
		user.setFullName("User");
		Account owner = new Account("owner", encoder.encode("csylmz"), "owner@alsat.com");
		owner.setRole(ownerRole);
		owner.setFullName("Owner");

		accountRepository.save(admin);
		accountRepository.save(owner);
		accountRepository.save(user);

		// Irk İnek
		Irk simental = new Irk("Simental");
		Irk holstein = new Irk("Holstein");
		Irk montofon = new Irk("Montofon");
		Irk jersey = new Irk("Jersey");
		Irk gSarı = new Irk("Güney Sarısı");
		Irk kırma = new Irk("Kırma");
		Irk yerli = new Irk("Yerli");
		Irk diger = new Irk("Diğer");
		List<Irk> irks = new ArrayList<Irk>();
		irks.add(simental);
		irks.add(holstein);
		irks.add(montofon);
		irks.add(jersey);
		irks.add(gSarı);
		irks.add(kırma);
		irks.add(yerli);
		irks.add(diger);
		irkRepository.saveAll(irks);

		//
		Category parentBuyukBas = new Category();
		parentBuyukBas.setName("Büyükbaş Hayvan");
		parentBuyukBas.setStatus(true);
		parentBuyukBas.setIcon("buyukbas.jpg");
		categoryRepository.save(parentBuyukBas);

		Category sigir = new Category();
		sigir.setName("Sığır");
		sigir.setStatus(true);
		sigir.setParentCategory(parentBuyukBas);
		categoryRepository.save(sigir);

		Tip inek = new Tip("İnek", sigir, irks);
		tipRepository.save(inek);

		Tip hdüve = new Tip("Ham Düve", sigir, irks);
		tipRepository.save(hdüve);

		Tip gdüve = new Tip("Gebe Düve", sigir, irks);
		tipRepository.save(gdüve);

		Tip edana = new Tip("Erkek Dana(Besilik)", sigir, irks);
		tipRepository.save(edana);

		Tip ddana = new Tip("Dişi Dana", sigir, irks);
		tipRepository.save(ddana);

		Tip buzağı = new Tip("Buzağı", sigir, irks);
		tipRepository.save(buzağı);

		Tip boga = new Tip("Boğa", sigir, irks);
		tipRepository.save(boga);
		List<Tip> tipsSigir = new ArrayList<Tip>();
		tipsSigir.add(inek);
		tipsSigir.add(hdüve);
		tipsSigir.add(gdüve);
		tipsSigir.add(edana);
		tipsSigir.add(ddana);
		tipsSigir.add(boga);
		sigir.setTips(tipsSigir);
		categoryRepository.save(sigir);

		// sığır alt kategori
		Category manda = new Category();
		manda.setName("Manda");
		manda.setStatus(true);
		manda.setParentCategory(parentBuyukBas);
		categoryRepository.save(manda);

		Tip tManda = new Tip("Manda", manda, irks);
		tipRepository.save(tManda);

		//
		Category parentKüçükBas = new Category();
		parentKüçükBas.setName("Küçükbaş Hayvan");
		parentKüçükBas.setStatus(true);
		parentKüçükBas.setIcon("kucukbas.jpg");
		categoryRepository.save(parentKüçükBas);

		Category koyun = new Category();
		koyun.setName("Koyun");
		koyun.setStatus(true);
		koyun.setParentCategory(parentKüçükBas);
		categoryRepository.save(koyun);

		Tip akoyun = new Tip("Anaç Koyun", koyun, irks);
		tipRepository.save(akoyun);

		Tip toklu = new Tip("Toklu", koyun, irks);
		tipRepository.save(toklu);

		Tip koç = new Tip("Koç", koyun, irks);
		tipRepository.save(koç);

		Tip kuzu = new Tip("Kuzu", koyun, irks);
		tipRepository.save(kuzu);

		Category keci = new Category();
		keci.setName("Keçi");
		keci.setStatus(true);
		keci.setParentCategory(parentKüçükBas);
		categoryRepository.save(keci);

		Tip akeci = new Tip("Anaç Keçi", keci, irks);
		tipRepository.save(akeci);

		Tip oglak = new Tip("Oğlak", keci, irks);
		tipRepository.save(oglak);

		Tip teke = new Tip("Teke", keci, irks);
		tipRepository.save(teke);

		//
		Category parentKurbanlik = new Category();
		parentKurbanlik.setName("Kurbanlık Hayvan");
		parentKurbanlik.setStatus(true);
		parentKurbanlik.setIcon("kurbanlık.png");
		categoryRepository.save(parentKurbanlik);

		Category buyukbas = new Category();
		buyukbas.setName("Büyükbaş");
		buyukbas.setStatus(true);
		buyukbas.setParentCategory(parentKurbanlik);
		categoryRepository.save(buyukbas);

		Tip kurbanlikInek = new Tip("İnek", buyukbas, irks);
		tipRepository.save(kurbanlikInek);

		Tip kurbanlikduve = new Tip("Düve", buyukbas, irks);
		tipRepository.save(kurbanlikduve);

		Tip kurbanlikErkek = new Tip("Erkek", buyukbas, irks);
		tipRepository.save(kurbanlikErkek);

		Category kucukbas = new Category();
		kucukbas.setName("Küçükbaş");
		kucukbas.setStatus(true);
		kucukbas.setParentCategory(parentKurbanlik);
		categoryRepository.save(kucukbas);

		Tip eKurbanlikKoyun = new Tip("Erkek Koyun", kucukbas, irks);
		tipRepository.save(eKurbanlikKoyun);
		Tip dKurbanlikKoyun = new Tip("Dişi Koyun", kucukbas, irks);
		tipRepository.save(dKurbanlikKoyun);
		Tip eKurbanlikKeçi = new Tip("Erkek Keçi", kucukbas, irks);
		tipRepository.save(eKurbanlikKeçi);
		Tip dKurbanlikKeçi = new Tip("Dişi Keçi", kucukbas, irks);
		tipRepository.save(dKurbanlikKeçi);

		//
		Category parentKanatli = new Category();
		parentKanatli.setName("Kanatlı Hayvanlar");
		parentKanatli.setStatus(true);
		parentKanatli.setIcon("kanatlı.png");
		categoryRepository.save(parentKanatli);

		Category hindi = new Category();
		hindi.setName("Hindi");
		hindi.setStatus(true);
		hindi.setParentCategory(parentKanatli);
		categoryRepository.save(hindi);
		Tip tHindi = new Tip("Hindi", hindi);
		tipRepository.save(tHindi);

		Category kaz = new Category();
		kaz.setName("Kaz");
		kaz.setStatus(true);
		kaz.setParentCategory(parentKanatli);
		categoryRepository.save(kaz);
		Tip tKaz = new Tip("Kaz", kaz);
		tipRepository.save(tKaz);

		Category ordek = new Category();
		ordek.setName("Ördek");
		ordek.setStatus(true);
		ordek.setParentCategory(parentKanatli);
		categoryRepository.save(ordek);
		Tip tOrdek = new Tip("Ördek", ordek);
		tipRepository.save(tOrdek);

		Category digerKanatli = new Category();
		digerKanatli.setName("Diğer Kanatlı Hayvanlar");
		digerKanatli.setStatus(true);
		digerKanatli.setParentCategory(parentKanatli);
		categoryRepository.save(digerKanatli);
		Tip tDiger = new Tip("Diğer", digerKanatli);
		tipRepository.save(tDiger);

		Category tavuk = new Category();
		tavuk.setName("Tavuk");
		tavuk.setStatus(true);
		tavuk.setParentCategory(parentKanatli);
		categoryRepository.save(tavuk);

		Tip etlik = new Tip("Etlik Tavuk", tavuk);
		tipRepository.save(etlik);

		Tip yumurtaci = new Tip("Yumurtacı", tavuk);
		tipRepository.save(yumurtaci);

		Tip horoz = new Tip("Horoz", tavuk);
		tipRepository.save(horoz);

		//
		Category digerHayvan = new Category();
		digerHayvan.setName("Diğer Hayvanlar");
		digerHayvan.setStatus(true);
		digerHayvan.setIcon("diger.png");
		categoryRepository.save(digerHayvan);

		Category at = new Category();
		at.setName("At");
		at.setStatus(true);
		at.setParentCategory(digerHayvan);
		categoryRepository.save(at);

		Category esek = new Category();
		esek.setName("Eşek");
		esek.setStatus(true);
		esek.setParentCategory(digerHayvan);
		categoryRepository.save(esek);

		Category katir = new Category();
		katir.setName("Katır");
		katir.setStatus(true);
		katir.setParentCategory(digerHayvan);
		categoryRepository.save(katir);

		Category digerDiger = new Category();
		digerDiger.setName("Diğer");
		digerDiger.setStatus(true);
		digerDiger.setParentCategory(digerHayvan);
		categoryRepository.save(digerDiger);

		//
		Category tesisler = new Category();
		tesisler.setName("Tesisler");
		tesisler.setStatus(true);
		tesisler.setIcon("tesis.jpg");
		categoryRepository.save(tesisler);

		Category satilikTesis = new Category();
		satilikTesis.setName("Satılık Tesisler");
		satilikTesis.setStatus(true);
		satilikTesis.setParentCategory(tesisler);
		categoryRepository.save(satilikTesis);

		Category satilikBuyukbas = new Category();
		satilikBuyukbas.setName("Büyükbaş Tesis");
		satilikBuyukbas.setStatus(true);
		satilikBuyukbas.setParentCategory(satilikTesis);
		categoryRepository.save(satilikBuyukbas);

		Category satilikKucukbas = new Category();
		satilikKucukbas.setName("Küçükbaş Tesis");
		satilikKucukbas.setStatus(true);
		satilikKucukbas.setParentCategory(satilikTesis);
		categoryRepository.save(satilikKucukbas);

		Category satilikKumes = new Category();
		satilikKumes.setName("Kümes");
		satilikKumes.setStatus(true);
		satilikKumes.setParentCategory(satilikTesis);
		categoryRepository.save(satilikKumes);

		Category satilikDiger = new Category();
		satilikDiger.setName("Diğer");
		satilikDiger.setStatus(true);
		satilikDiger.setParentCategory(satilikTesis);
		categoryRepository.save(satilikDiger);

		Category kiralikTesis = new Category();
		kiralikTesis.setName("Kiralık Tesisler");
		kiralikTesis.setStatus(true);
		kiralikTesis.setParentCategory(tesisler);
		categoryRepository.save(kiralikTesis);

		Category kiralikBuyukbas = new Category();
		kiralikBuyukbas.setName("Büyükbaş Tesis");
		kiralikBuyukbas.setStatus(true);
		kiralikBuyukbas.setParentCategory(kiralikTesis);
		categoryRepository.save(kiralikBuyukbas);

		Category kiralikKucukbas = new Category();
		kiralikKucukbas.setName("Küçükbaş Tesis");
		kiralikKucukbas.setStatus(true);
		kiralikKucukbas.setParentCategory(kiralikTesis);
		categoryRepository.save(kiralikKucukbas);

		Category kiralikKumes = new Category();
		kiralikKumes.setName("Kümes");
		kiralikKumes.setStatus(true);
		kiralikKumes.setParentCategory(kiralikTesis);
		categoryRepository.save(kiralikKumes);

		Category kiralikDiger = new Category();
		kiralikDiger.setName("diğer");
		kiralikDiger.setStatus(true);
		kiralikDiger.setParentCategory(kiralikTesis);
		categoryRepository.save(kiralikDiger);

		//
		Category parentYem = new Category();
		parentYem.setName("Yem Maddeleri");
		parentYem.setStatus(true);
		parentYem.setIcon("yem.png");
		categoryRepository.save(parentYem);

		Category yonca = new Category();
		yonca.setName("Yonca");
		yonca.setStatus(true);
		yonca.setParentCategory(parentYem);
		categoryRepository.save(yonca);

		Category saman = new Category();
		saman.setName("Saman");
		saman.setStatus(true);
		saman.setParentCategory(parentYem);
		categoryRepository.save(saman);

		Category fabrikaYemi = new Category();
		fabrikaYemi.setName("Fabrika Yemi");
		fabrikaYemi.setStatus(true);
		fabrikaYemi.setParentCategory(parentYem);
		categoryRepository.save(fabrikaYemi);

		Category arpa = new Category();
		arpa.setName("Arpa");
		arpa.setStatus(true);
		arpa.setParentCategory(parentYem);
		categoryRepository.save(arpa);

		Category bugday = new Category();
		bugday.setName("Buğday");
		bugday.setStatus(true);
		bugday.setParentCategory(parentYem);
		categoryRepository.save(bugday);

		Category silaj = new Category();
		silaj.setName("Silaj");
		silaj.setStatus(true);
		silaj.setParentCategory(parentYem);
		categoryRepository.save(silaj);

		Category digerYem = new Category();
		digerYem.setName("Diğer");
		digerYem.setStatus(true);
		digerYem.setParentCategory(parentYem);
		categoryRepository.save(digerYem);
		//

		Yas bilinmiyor = new Yas("Bilinmiyor");
		yasRepository.save(bilinmiyor);
		Yas y03 = new Yas("0-3 aylık");
		yasRepository.save(y03);
		Yas y36 = new Yas("3-6 Aylık");
		yasRepository.save(y36);
		Yas y612 = new Yas("6-12 Aylık");
		yasRepository.save(y612);
		Yas y1 = new Yas("1");
		yasRepository.save(y1);
		Yas y2 = new Yas("2");
		yasRepository.save(y2);
		Yas y3 = new Yas("3");
		yasRepository.save(y3);
		Yas y4 = new Yas("4");
		yasRepository.save(y4);
		Yas y5 = new Yas("5");
		yasRepository.save(y5);
		Yas y6 = new Yas("6");
		yasRepository.save(y6);
		Yas y7 = new Yas("7");
		yasRepository.save(y7);
		Yas y8 = new Yas("8");
		yasRepository.save(y8);
		Yas y9 = new Yas("9");
		yasRepository.save(y9);
		Yas y10 = new Yas("10 ve Üzeri");
		yasRepository.save(y10);

		//
		Advert adv1 = new Advert("Advert-1", "Advert Açıklaması");
		adv1.setCategory(sigir);
		adv1.setAccount(user);
		adv1.setToplamAdet(20);
		adv1.setToplamFiyat(8000);
		Advert adv2 = new Advert("Advert-2", "Advert Açıklaması");
		adv2.setToplamAdet(10);
		adv2.setToplamFiyat(5000);
		adv2.setCategory(sigir);
		adv2.setAccount(user);
		Advert adv3 = new Advert("Advert-3", "Advert Açıklaması");
		adv3.setTopluSatis(true);
		adv3.setToplamAdet(200);
		adv3.setToplamFiyat(6000);
		adv3.setCategory(arpa);
		adv3.setAccount(owner);
		Advert adv4 = new Advert("Advert-4", "Advert Açıklaması");
		adv4.setCategory(keci);
		adv4.setAccount(owner);
		adv4.setToplamAdet(5);
		adv4.setToplamFiyat(3000);
		Advert adv5 = new Advert("Advert-5", "Advert Açıklaması");
		adv5.setCategory(tavuk);
		adv5.setAccount(owner);
		adv5.setToplamAdet(100);
		adv5.setToplamFiyat(8000);
		Advert adv6 = new Advert("Advert-6", "Advert Açıklaması");
		adv6.setCategory(satilikTesis);
		adv6.setAccount(owner);
		adv6.setToplamAdet(1);
		adv6.setToplamFiyat(16000);
		Advert adv7 = new Advert("Advert-7", "Advert Açıklaması");
		adv7.setCategory(fabrikaYemi);
		adv7.setAccount(owner);
		adv7.setToplamAdet(2000);
		adv7.setToplamFiyat(2000);

		advertRepository.save(adv1);
		advertRepository.save(adv2);
		advertRepository.save(adv3);
		advertRepository.save(adv4);
		advertRepository.save(adv5);
		advertRepository.save(adv6);
		advertRepository.save(adv7);

		AdvertDetail dtl1 = new AdvertDetail(boga, yerli, y4, 5, 6080.50, adv1);
		AdvertDetail dtl2 = new AdvertDetail(edana, yerli, y03, 10, 2580, adv1);
		AdvertDetail dtl3 = new AdvertDetail(hdüve, yerli, y612, 2, 1680.50, adv1);
		AdvertDetail dtl4 = new AdvertDetail(horoz, diger, bilinmiyor, 20, 50, adv2);
		AdvertDetail dtl5 = new AdvertDetail(yumurtaci, diger, y612, 100, 35., adv2);
		AdvertDetail dtl6 = new AdvertDetail(akeci, yerli, y612, 3, 250, adv4);
		AdvertDetail dtl7 = new AdvertDetail(teke, diger, y1, 5, 300, adv4);
		AdvertDetail dtl8 = new AdvertDetail(tDiger, diger, y612, 100, 45, adv5);
		AdvertDetail dtl9 = new AdvertDetail(yumurtaci, diger, y03, 100, 35, adv5);

		advertDetailRepository.save(dtl1);
		advertDetailRepository.save(dtl2);
		advertDetailRepository.save(dtl3);
		advertDetailRepository.save(dtl4);
		advertDetailRepository.save(dtl5);
		advertDetailRepository.save(dtl6);
		advertDetailRepository.save(dtl7);
		advertDetailRepository.save(dtl8);
		advertDetailRepository.save(dtl9);
	}

}
