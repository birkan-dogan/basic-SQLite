/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/

SELECT name, Composer
FROM tracks
where Composer like "%bach";

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/

SELECT *
from albums
where Title like "%Greatest%";

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

select *
from invoices
where InvoiceDate like "201_-02-%";

/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/

select FirstName, LastName, City
from customers
where FirstName like "___";

/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/

select FirstName, LastName, City
from customers
where LastName like "sch%" or LastName like "go%";

/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
 

select count(BillingAddress)
from invoices;

SELECT count(BillingState)
from invoices; 
-- null olanları saymadı


SELECT count(*)
from invoices;   -- NULL olanları da saydı


/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/

SELECT count(distinct composer) as num_of_composer
from tracks;


-- NULL olanların sayısını bulma
SELECT count(*)
from invoices
where BillingState is NULL;


-- MIN,MAX
-------------------------------------------------------------------------------------------------	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */

SELECT  name as song_name, min(Milliseconds) / 1000.0 as min_duration_sc
from tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

select min(grade) as lowest_grade, max(grade) as highest_grade
from students;


-- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* invoices  tablosundaki faturaların toplam değerini listeyiniz */

select round(sum(Total)) as total_amount  -- using round function 
from invoices;

/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
SELECT round(avg(total), 3) as avg_amount
from invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

-- SELECT name, Milliseconds
-- FROM tracks
-- where Milliseconds > AVG(Milliseconds);  -- avg fonksiyonunun böyle bir kullanımı yok

/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır*/

SELECT name, Milliseconds
FROM tracks
where Milliseconds > (SELECT avg(milliseconds) from tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT composer, count(name)
from tracks
WHERE Composer is NOT NULL
GROUP by composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

select  BillingCountry, avg(total) as avg_amount
from invoices
GROUP by  BillingCountry;








