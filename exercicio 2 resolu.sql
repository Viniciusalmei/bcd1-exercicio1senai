use classicmodels;

# b retornando soma das compras dos usuarios 
select c.customerNumber,c.customerName,SUM(ps.amount) as TotaldeCompras
from customers c
join payments ps on ps.customerNumber = c.customerNumber
join orders od on od.customerNumber = c.customerNumber
group by c.customerNumber
order by c.customerName;
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# b.1 simplificada porem outra opção ver correta
select c.customerNumber,c.customerName,SUM(ot.priceEach) as TotaldeCompras
from customers c
join orders od on od.customerNumber = c.customerNumber
join orderdetails ot on ot.orderNumber = od.orderNumber
group by c.customerNumber
order by customerName;


# c) retornando media das compras dos usuarios 
select c.customerNumber,c.customerName,AVG(ps.amount) as TotaldeCompras
from customers c
join payments ps on ps.customerNumber = c.customerNumber
join orders od on od.customerNumber = c.customerNumber
group by c.customerNumber
order by c.customerName;
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# c.1) simplfificada porem ver resultado
select c.customerNumber,c.customerName,avg(ot.priceEach) as TotaldeCompras
from customers c
join orders od on od.customerNumber = c.customerNumber
join orderdetails ot on ot.orderNumber = od.orderNumber
group by c.customerNumber
order by customerName;




