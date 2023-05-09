create database exercicio_licensas;
use exercicio_licensas;


#exercicioa
select count(*) from lcliente;


#exerciciob
select month (DtAquisicao) month,
count(*) NumLicenca
from llicenca
group by month(DtAquisicao);

select month (DtAquisicao)  as month,NumLicenca,idCliente_FK,DtAquisicao
from llicenca
where DtAquisicao like "%-02-%";

select * from llicenca lc
where month (DtAquisicao) = 2;


#exercicioc
select * from llicenca lc
where month (DtAquisicao) = 7 and year(DtAquisicao)
= 2007;


#exerciciod

select SUBSTRING(DescricaoTipo ,1,5) as FiveFirst,DescricaoTipo,idTIPO_Empresa from 
ltipo_empresa
order by DescricaoTipo;

#exercicioe

#as ultimas 5 letras contando com o espaço entre as palabras
select SUBSTRING(DescricaoTipo ,10) as FiveFirst,DescricaoTipo,idTIPO_Empresa from 
ltipo_empresa
order by DescricaoTipo;
#as ultimas 5 letras SEM CONTAR com o espaço entre as palavras
select SUBSTRING(DescricaoTipo ,8) as FiveFirst,DescricaoTipo,idTIPO_Empresa from 
ltipo_empresa
order by DescricaoTipo;

#exercicio f

#letras da 6° a 10° posicao
select SUBSTRING(DescricaoTipo ,6,10) as FiveFirst,DescricaoTipo,idTIPO_Empresa from 
ltipo_empresa
order by DescricaoTipo;

#exercicio g

select idCLIENTE, Nome_RazaoSocial ,length(Nome_RazaoSociaL) as QUANTIDADEBYTES
from lcliente
order by Nome_RazaoSocial;

#exercicio h

select NumLicenca,DtAquisicao,TIMESTAMPDIFF (DAY,DtAquisicao,CURDATE()) AS DIASCORRIDOS
from llicenca;


#exercicio i
# nao tem setor economia entao escolhi outro
select * from lsetor
order by NomeSetor;

select UCASE(NomeSetor) as UPPERCASE_MAIOR, LCASE(NomeSetor) as LOWERCASE_MENOR from lsetor
where NomeSetor ="Alimentacia";


################################A PARTIR DAQUI É JOIN ########

#exercicio j)
select * from lsoftware as ls
join lversao lv on lv.idSOFTWARE_FK = ls.idSOFTWARE 
order by Versao and NomeSoftware
;

#exercicio k)
select Nome_RazaoSocial,idTIPO_Empresa,NomeSetor from lcliente lc
join ltipo_empresa lt on lt.idTIPO_Empresa = idTIPO_Empresa_FK
join lsetor ls on ls.idSETOR = idSETOR_FK
order by NomeSETOR, DescricaoTipo;

#exercicio l)
select idCLIENTE,Nome_RazaoSocial,NumLicenca,DtAquisicao,VAlorAquisicao from lcliente lc
join llicenca ll on ll.idCLIENTE_FK = lc.idCLIENTE;


#exercicio m
select distinct idCLIENTE,Nome_RazaoSocial,NomeSoftware
from lcliente lc
join llicenca	ll on ll.idCLIENTE_FK = lc.idCLIENTE
join lsoftware ls on ls.idSOFTWARE = ll.idSOFTWARE_FK_FK
 order by Nome_RazaoSocial;
 
 #usando group by
 
 select distinct idCLIENTE,Nome_RazaoSocial,NomeSoftware
from lcliente lc
join llicenca	ll on ll.idCLIENTE_FK = lc.idCLIENTE
join lsoftware ls on ls.idSOFTWARE = ll.idSOFTWARE_FK_FK
 order by Nome_RazaoSocial;
 
 select  idCLIENTE,Nome_RazaoSocial,NomeSoftware
from lcliente lc
join llicenca	ll on ll.idCLIENTE_FK = lc.idCLIENTE
join lsoftware ls on ls.idSOFTWARE = ll.idSOFTWARE_FK_FK
 group by idCLIENTE,Nome_RazaoSocial,NomeSoftware
  order by Nome_RazaoSocial;
  
  #exercicio n
  
  select  Nome_RazaoSocial,UF,DescricaoTipo,NomeSetor from 
  lcliente  lc
  join ltipo_empresa lt on lt.idTIPO_Empresa = idTIPO_Empresa_FK
  join lsetor ls on ls.idSETOR = idSETOR_FK
  where lc.UF in   ("SP" , "RS" , "PR" , "MG")
  order by Nome_RazaoSocial;
  
  #exercicio o
  
  select NomeSoftware,Versao,DtAquisicao,ValorAquisicao
  ,DescricaoTipo,NomeSetor,NumLicenca,lc.Nome_RazaoSocial from lsoftware ls
  join lversao lv on lv.idSOFTWARE_FK = ls.idSOFTWARE
  join llicenca ll on ll.idSOFTWARE_FK_FK = ls.idSOFTWARE
  join lcliente lc on lc.idCLIENTE = ll.idCLIENTE_FK
  join lsetor ls1 on ls1.idSetor = lc.idSETOR_FK
  join ltipo_empresa lt on lt.idTIPO_Empresa = lc.idTIPO_Empresa_FK
  order by NomeSoftware,Versao,DtAquisicao,Nome_RazaoSocial;


#exercicio p 

SELECT NumLicenca,ValorAquisicao, COUNT(*) AS quantidade_vendida
FROM llicenca  ll
JOIN lcliente  lc ON lc.idClIENTE = ll.idCLIENTE_FK
GROUP BY ValorAquisicao,NumLicenca;






#exericio q
SELECT ValorAquisicao, COUNT(*) AS SomaLicencas
FROM llicenca  ll
JOIN lcliente  lc ON lc.idClIENTE = ll.idCLIENTE_FK
GROUP BY ValorAquisicao;



SELECT MAX(ValorAquisicao) AS maior_valor
FROM llicenca l
JOIN lcliente lc ON lc.idCliente = l.idCLIENTE_FK;


SELECT min(ValorAquisicao) AS menor_valor
FROM llicenca l
JOIN lcliente lc ON lc.idCliente = l.idCLIENTE_FK;




SELECT AVG(ValorAquisicao) AS valor_medio
FROM llicenca l
JOIN lcliente lc ON lc.idCliente = l.idCLIENTE_FK;



select sum(ValorAquisicao) valorTotal,
avg(ValorAquisicao) mediaValores, min(ValorAquisicao) menorVAlor,
max(ValorAquisicao) maiorValor from llicenca;



#exerccio r


select Nome_RazaoSocial , count(*) as QuantidadeFarma
from lcliente lc
join lsetor as ls on ls.idSetor = lc.idSETOR_FK
where ls.NomeSetor like "FARMA%"
group by  Nome_RazaoSocial;




#exercicio s

select NumLicenca , count(*) QuantidadeLicencas, Nome_RazaoSocial
from llicenca li
join lcliente ll on ll.idCLIENTE = li.idCLIENTE_FK
group by NumLicenca,Nome_RazaoSocial;



select Nome_RazaoSocial , count(*) QuantidadeLicencas
from lcliente ll
join llicenca li on ll.idCLIENTE = li.idCLIENTE_FK
group by Nome_RazaoSocial;



#exercicio t 

select AVG(ValorAquisicao) ValorMedio,Nome_RazaoSocial, SUM(ValorAquisicao) Valortotal
from lcliente ll
join llicenca li on ll.idCLIENTE = li.idCLIENTE_FK
group by Nome_RazaoSocial;


#exercicio u
select NomeSetor from lsetor;

select NomeSetor, SUM(ValorAquisicao) Total
from lsetor ls
join lcliente lc on ls.idSETOR = lc.idSETOR_FK
join llicenca ll on lc.idCLIENTE = ll.idCLIENTE_FK
where ls.NomeSetor like "FIN%" 
group by NomeSetor;



#exercicio v 

select lt.DescricaoTipo, SUM(ll.ValorAquisicao) Total
from ltipo_empresa lt
join lcliente lc on lc.idTIPO_Empresa_FK = lt.idTIPO_Empresa
join lsetor as ls on ls.idSETOR = lc.idSETOR_FK
join llicenca ll on ll.idCLIENTE_FK = lc.idCLIENTE
group by lt.DescricaoTipo;


#exercicio w 


select ls.NomeSoftware , SUM(ll.ValorAquisicao) VALORporSftw
from lsoftware ls
join lversao lv on lv.idSOFTWARE_FK = ls.idSOFTWARE
join llicenca ll on ll.idSOFTWARE_FK_FK = ls.idSOFTWARE
group by ls.idSOFTWARE
order by ls.NomeSoftware;

select count(l.NumLicenca) as "total licencas",s.NomeSoftware
from llicenca l
join lversao v on l.Versao_FK= v.Versao
join lsoftware s on v.idSOFTWARE_FK = s.idSOFTWARE
group by v.Versao, s.idSOFTWARE
order by s.NomeSoftware,v.Versao;


#exercicio x 
select ls.NomeSoftware ,lc.Nome_RazaoSocial,lc.idCLIENTE, SUM(ll.ValorAquisicao) VALORPOREMP
from lsoftware ls
join llicenca ll on ll.idSOFTWARE_FK_FK = ls.idSOFTWARE
join lcliente lc on ll.idCLIENTE_FK = lc.idCLIENTE
group by ll.NumLicenca
order by lc.Nome_RazaoSocial;

select s.NomeSoftware, c.Nome_RazaoSocial as nome, count(l.NumLicenca) as "Total licenças"
from llicenca l 
join lcliente c on c.idCLIENTE = l.idCLIENTE_FK
join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE
group by c.Nome_RazaoSocial,s.idSOFTWARE 
order by c.Nome_RazaoSocial; 


#exercicio y

select lc.idCLIENTE ,lc. Nome_RazaoSocial, count(*) NumLicenca
from lcliente lc 
join llicenca ll on ll.idCLIENTE_FK = lc.idCLIENTE
group by idCLIENTE
having NumLicenca >=10
order by NumLicenca;






















