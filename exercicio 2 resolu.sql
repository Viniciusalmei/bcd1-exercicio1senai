use classicmodels;

#a liste todos os emplyoess 
select c.salesRepEmployeeNumber, p.employeeNumber, p.firstName
from customers c
join employees p on p.employeeNumber = c.salesRepEmployeeNumber
join orders od on od.customerNumber = c.customerNumber
group by p.employeeNumber,c.salesRepEmployeeNumber;

# b retornando soma das compras dos usuarios 
select c.customerNumber,c.customerName,SUM(ps.amount) as TotaldeCompras
from customers c
join payments ps on ps.customerNumber = c.customerNumber
join orders od on od.customerNumber = c.customerNumber
group by c.customerNumber
order by c.customerName;
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



# c) retornando media das compras dos usuarios 
select c.customerNumber,c.customerName,AVG(ps.amount) as TotaldeCompras
from customers c
join payments ps on ps.customerNumber = c.customerNumber
join orders od on od.customerNumber = c.customerNumber
group by c.customerNumber
order by c.customerName;
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# d) retornando quantidade de funcionarios por departamento .

select f.officeCode ,f.addressLine1 , count(ep.employeeNumber)as TotaldeFuncionarios
from offices f
join employees ep on ep.officeCode = f.officeCode
group by  f.officeCode;
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# e) retornando vendas foram realzadas por funcionario.

select c.salesRepEmployeeNumber, p.employeeNumber, p.firstName, count(od.orderNumber) as Quantidade
from customers c
join employees p on p.employeeNumber = c.salesRepEmployeeNumber
join orders od on od.customerNumber = c.customerNumber
group by p.employeeNumber,c.salesRepEmployeeNumber;



#f) retornando os 5 produtos mais comprados


select p.productCode,p.productName , count(ot.quantityOrdered) as Quantidade
from products p
join orderdetails  ot on ot.productCode = p.productCode
group by p.productCode
order by Quantidade desc
limit 5;



#g





#










