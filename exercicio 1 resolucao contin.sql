create database licence;
use licence;


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
  where lc.UF = "SP" or "RS" or "PR" or "MG"
  order by Nome_RazaoSocial;
  
  #exercicio o
  
  select NomeSoftware,Versao,DtAquisicao,ValorAquisicao
  ,DescricaoTipo,NomeSetor,NumLicenca from lsoftware ls
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


#exerccio r


select Nome_RazaoSocial , count(*) as QuantidadeFarma
from lcliente lc
join lsetor as ls on ls.idSetor = lc.idSETOR_FK
where ls.NomeSetor = "FA%"
group by  Nome_RazaoSocial;

















