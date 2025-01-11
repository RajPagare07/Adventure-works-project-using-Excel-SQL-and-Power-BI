CREATE DATABASE ADVENTURE;
use adventure;


select * from dimcustomer limit 10;
select * from dimcustomer where Maritalstatus = "M" and Gender = "M";
select * from dimcustomer where Maritalstatus = "M" and Gender = "F";
select * from dimcustomer where Maritalstatus = "S" and Gender = "M";
select * from dimcustomer where Maritalstatus = "S" and Gender = "F";

select * from dimcustomer where YearlyIncome > 5000;
select * from dimcustomer where YearlyIncome between 2000 and 30000;

select * from dimcustomer where EnglishEducation = "partial College" and EnglishOccupation != "Skilled Manual";

select * from dimproduct limit 10;
select * from dimproductcategory limit 10;
select * from dimproductsubcategory limit 10;

select englishproductsubcategoryname, englishproductcategoryname from dimproductcategory join dimproductsubcategory on dimproductcategory.productcategorykey = dimproductsubcategory.productcategorykey;

select englishproductname, englishproductsubcategoryname, salesamount from ((dimproduct join dimproductsubcategory on dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey) inner join sales2 on dimproduct.ProductKey = sales2.ProductKey);

select * from dimsalesterritory limit 10;
select * from sales2 limit 10;

select salesterritoryregion, salesterritorycountry, salesterritorygroup, salesordernumber, round(sum(salesamount),2) from dimsalesterritory join sales2 on dimsalesterritory.salesterritorykey = sales2.salesterritorykey group by salesordernumber,salesterritoryregion, salesterritorycountry, salesterritorygroup;

select * from dimcustomer limit 10;
select  * from sales2 limit  10;

select firstname, middlename, lastname, salesordernumber, salesamount, rank() over (partition by salesordernumber order by salesamount desc) from dimcustomer join sales2 on dimcustomer.customerkey = sales2.customerkey;

select firstname, middlename, lastname, salesordernumber, salesamount from sales2 join dimcustomer on sales2.CustomerKey = dimcustomer.CustomerKey order by SalesAmount desc;