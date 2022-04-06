/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan
 işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */

SELECT *
FROM invoices
where total > 10
ORDER BY InvoiceDate DESC
LIMIT 10;

SELECT CustomerId, InvoiceDate, BillingCity, total
FROM invoices
ORDER BY BillingCity, total DESC;


/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */ 
SELECT *
from invoices
where not BillingCountry = "USA"

order BY total DESC;           

/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

select *
from invoices
where BillingCountry = "USA" or BillingCountry = "Germany"
ORDER by InvoiceId ASC;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 


SELECT *
from invoices
WHERE InvoiceDate BETWEEN "2012-01-01" AND "2013-01-02";

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */ 

SELECT *
FROM invoices
where InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31 00:00:00"
ORDER By InvoiceDate desc
LIMIT 1;


/*===================================================
IN
====================================================*/
/* customers tablosunda Belgium, Norway veya  Canada ,USA  ülkelerinden sipariş veren
müşterilerin FirstName, LastName, country bilgilerini listeyiniz	*/


SELECT FirstName, LastName, country
from customers
where country in ("Belgium", "Norway", "Canada", "USA");