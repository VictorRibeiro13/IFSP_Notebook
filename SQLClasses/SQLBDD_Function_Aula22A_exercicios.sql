create database bd_funcao;

use bd_funcao;

-- describes e selects (verificações)
describe Funcionario;
select*from funcionario;


CREATE TABLE Funcionario(
  Cod_Func int NOT NULL,
  Nome_Func varchar(100) ,
  Sexo_Func char(1) ,
  Sal_Func float not null ,
  Data_Func datetime ,
  Num_Regiao int, 
  primary key(cod_func)
  ) ;
 
CREATE TABLE Regiao( 
 Num_Regiao int NOT NULL,
 Regiao varchar(50),
 primary key(num_regiao)
 ) ;
 
 insert into funcionario values(1,'Manda Chuva','M',5000, '1998-01-01',1);
 insert into funcionario values(2,'Chuchu','M',3000, '1999-01-01',1);
 insert into funcionario values(3,'Bacana','M',2000, '2000-01-01',2);
 insert into funcionario values(4,'Espeto','M',2500, '2001-01-01',2);
 insert into funcionario values(5,'Batatinha','F',4000, '2002-01-01',3); 
 
 insert into Regiao values (1,'Norte');
 insert into Regiao values (2,'Sul');
 insert into Regiao values (3,'Leste');
 insert into Regiao values (4,'Oeste') ;
 

 
-- 1)
create Function F_reajuste(cod_Func int)
	returns @numSal 	
    dECLARE @numSal float

AS 
If(SELECT SalFunc Into @numSal FROM Funcionario Where @cod_Func = Cod_Func ) < 5000 and is not null
BEGIN
    DECLARE @numSal float
    SELECT SalFunc Into @numSal FROM Funcionario Where @cod_Func = Cod_Func 
    
    IF @numSal > 2000 AND @numSal <= 3000
    set @numSal = (@numSal * 1.10)
    Else IF @numSal > 3000 AND @numSal <= 5000
    set @numSal = (@numSal * 1.07)
    else 
    set @numSal = (@numSal * 1.15)
    RETURN 
    END 
    Else 
    Begin 
    set @numSal = (@numSal * 1.04)
	return 
    end
);
 
-- 2)

create function F_Funcionario(@reg int,@Sig char(2))
returns table
as
Begin
return (select*from tb_funcionario wwhere @Sig = tb_funcioanrio.fk_depto and @reg = tb_funcionario.registro)
end


-- 3)
create function F_pedido(@Cod int)
returns float 
begin
declare precoUnit float,quantidade int
select unitPrice,Quantity into @precoUnit,@quantidade where OrderID = @Cod
return (@precoUnit*@quantidade)
end


 
 