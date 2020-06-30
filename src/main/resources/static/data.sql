insert into role values (1,'ROLE_USER');
insert into role values (2,'ROLE_OWNER');
insert into role values (3,'ROLE_ADMIN');


insert into account values (1,'Çağlar YILMAZ','Aydoğdu Mah. No:8','İzmir','Çağlar YILMAZ',caglar@admin.com','{bcrypt}$2a$10$bGCo6Mjs7cw38ovgkmSzMOEXKslG3FK8j5VQU..6Gg5gfiWR3rsMO','05558317824',true,'Buca','caglarylmz','3');
insert into account values (2,'Umut YILMAZ','Aydoğdu Mah. No:8','İzmir','Umut YILMAZ',umut@owner.com','{bcrypt}$2a$10$bGCo6Mjs7cw38ovgkmSzMOEXKslG3FK8j5VQU..6Gg5gfiWR3rsMO','05558317824',true,'Buca','umutylmz','2');
insert into account values (3,'Sibel YILMAZ','Aydoğdu Mah. No:8','İzmir','Sibel YILMAZ',sibel@user.com','{bcrypt}$2a$10$bGCo6Mjs7cw38ovgkmSzMOEXKslG3FK8j5VQU..6Gg5gfiWR3rsMO','05558317824',true,'Buca','sibelylmz','1');


insert into adress values(1,'İzmir','Buca','Aydoğdu Mah.',true,1);
insert into adress values(2,'Ankara','Mamak','Ay Mah.2,true,2);
insert into adress values(3,'İstanbul','Kadıköy','Doğdu Mah.',true,3);


insert into animalcategory values(1,'Büyükbaş',true);
insert into animalcategory values(2,'KüçükBaş',true);
insert into animalcategory values(3,'Kanatlı',true);
insert into animalcategory values(4,'Diğer',true);

insert into animal values(1,10,2500,'Boğa','İnek','24 Aylık',1,1);
insert into animal values(1,5,2000,'Boğa','Boğa','12 Aylık',1,1);
insert into animal values(1,4,500,'Kuzu','Kuzu','24 Aylık',2,2);
insert into animal values(1,30,50,'Tavuk','Tavuk','30-60 Günlük',2,3);
insert into animal values(1,900,100,'İnek','İnek','24 Aylık',3,2);
insert into animal values(1,900,100,'İnek','İnek','24 Aylık',3,1);


insert into advert values(1,'Satılık İnekler',15,'Satılık İnekler','Harika İnekler',false,false,'Sahibinden',true,true,30000,true,3,1,2);
insert into advert values(2,'Satılık Hayvanlar',34,'Satılık Kuzu ve Tavuk','Harika hayvanlar',false,true,'Firma',false,true,0,false,2,2,1);
insert into advert values(3,'Satılık İnekler',15,'Satılık İnekler','Harika İnekler',false,false,'Sahibinden',true,true,30000,true,3,1,2);
insert into advert values(4,'Satılık İnekler',15,'Satılık İnekler','Harika İnekler',false,false,'Sahibinden',true,true,30000,true,3,1,2);
insert into advert values(2,'Satılık 20 Kuzu',20,'Satılık Kuzu','Harika Kuzu',false,true,100,'Buca','Öküz','Evka-1','İzmir',true, false,'İnek','24 Aylık',3,16);
insert into advert values(3,'Satılık 30 Tavuk',30,'Satılık Tavuk','Harika Tavuk',false,true,100,'Buca','Öküz','Evka-1','İzmir',true, true,'İnek','24 Aylık',3,33);
insert into advert values(4,'Satılık İnek',1,'Satılık İnek','Harika İnekler',false,true,100,'Buca','Öküz','Evka-1','İzmir',true, true,'İnek','24 Aylık',3,4);



insert into category values(1,'HAYVANLAR', true,null);
insert into category values(2,'Büyükbaş Hayvan', true,1);
insert into category values(3,'Sığır', true,2);
insert into category values(4,'İnek', true,3);
insert into category values(5,'Ham Düve', true,3);
insert into category values(6,'Gebe Düve', true,3);
insert into category values(7,'Erkek Dana(Besilik)', true,3);
insert into category values(8,'Buzağı', true,3);
insert into category values(9,'Boğa', true,3);
insert into category values(10,'Manda', true,2);
insert into category values(11,'Küçükbaş Hayvan', true,1);
insert into category values(12,'Koyun', true,11);
insert into category values(13,'Anaç Koyun', true,12);
insert into category values(14,'Toklu', true,12);
insert into category values(15,'Koç', true,12);
insert into category values(16,'Kuzu', true,12);
insert into category values(17,'Keçi', true,11);
insert into category values(18,'Anaç Keçi', true,17);
insert into category values(19,'Oğlak', true,17);
insert into category values(20,'Teke', true,17);
insert into category values(21,'Kurbanlık', true,1);
insert into category values(22,'Büyükbaş', true,21);
insert into category values(23,'İnek', true,22);
insert into category values(24,'Düve', true,22);
insert into category values(25,'Erkek', true,22);
insert into category values(26,'Küçükbaş', true,21);
insert into category values(27,'Koyun', true,26);
insert into category values(28,'Dişi', true,27);
insert into category values(29,'Erkek', true,27);
insert into category values(30,'Keçi', true,26);
insert into category values(31,'Dişi', true,30);
insert into category values(32,'Erkek', true,30);
insert into category values(33,'Kanatlı', true,1);
insert into category values(34,'Tavuk', true,33);
insert into category values(35,'Etlik', true,34);
insert into category values(36,'Yumurtacı', true,34);
insert into category values(37,'Horoz', true,34);
insert into category values(38,'Hindi', true,33);
insert into category values(39,'Kaz', true,33);
insert into category values(40,'Ördek', true,33);
insert into category values(41,'Diğer', true,33);
insert into category values(42,'TESİSLER', true,null);
insert into category values(43,'Satılık', true,42);
insert into category values(44,'Kiralık', true,42);
insert into category values(45,'Büyükbaş Çiftliği', true,43);
insert into category values(46,'Küçükbaş Çiftliği', true,43);
insert into category values(47,'Kümes', true,43);
insert into category values(48,'Diğer', true,43);
insert into category values(49,'Büyükbaş Çiftliği', true,44);
insert into category values(50,'Küçükbaş Çiftliği', true,44);
insert into category values(51,'Kümes', true,44);
insert into category values(52,'Diğer', true,44);
insert into category values(53,'DİĞER HAYVANLAR', true,null);
insert into category values(54,'At', true,53);
insert into category values(55,'Eşek', true,53);
insert into category values(56,'Katır', true,53);
insert into category values(57,'Deve', true,53);
insert into category values(58,'Diğer', true,53);
insert into category values(59,'YEM MADDELERİ', true,null);
insert into category values(60,'Yonca', true,59);
insert into category values(61,'Saman', true,59);
insert into category values(62,'Fabrika Yemi', true,59);
insert into category values(63,'Arpa', true,59);
insert into category values(64,'Buğday', true,59);
insert into category values(65,'Silaj', true,59);
insert into category values(66,'Diğer', true,59);


