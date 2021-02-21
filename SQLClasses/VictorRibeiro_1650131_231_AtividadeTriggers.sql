create database BD_loja;
-- triggers pdf exercicios 
use BD_loja;



create table tb_itensVendidos(
Num_Ped int auto_increment not null primary key,
fk_Cod_prod int references tb_Produto(Cod_prod),
qtd_Prod float,
data_ped datetime
);

create Table tb_Produto(
Cod_Prod int auto_increment not null primary key ,
Nome_prod varchar(50) not null,
Qtd_est float
);

select*from tb_produto;

insert into tb_Produto values (default,'Refrigerante Guarana Lata 350ml',500);
insert into tb_Produto values (default,'Regriferante Cola lata 350ml',600);
insert into tb_Produto values (default,'Refrigerante Guarana Pet 1000ml',200);
insert into tb_Produto values (default,'Refrigerante Cola Pet 1000ml',250);
insert into tb_Produto values (default,'Refrigerante Guarana Pet 2000ml',400);
insert into tb_Produto values (default,'Refrigerante Cola Pet 2000ml',450);


-- 1
Delimiter //
CREATE TRIGGER Trgg_BaixaProduto after insert 
on tb_itensvendidos
FOR EACH ROW 
Begin
 UPDATE tb_produto 
  SET tb_produto.Qtd_est = Produto.Qtd_est - Inserted.qtd_Prod
  Where tb_produto.Cod_Prod = Inserted.Cod_Prod ;
End //
Delimiter ;


INSERT tb_itensvendidos (Num_Ped, fk_Cod_Prod, qtd_Prod, data_ped) VALUES (1,3,5,now()+interval 1 day);
INSERT tb_itensvendidos (Num_Ped, fk_Cod_Prod, qtd_Prod, data_ped) VALUES (2,3,5,getdate()-1);

-- 2

CREATE TRIGGER Trgg_DevolucaoProduto
after delete on tb_itensvendidos
for each row DELETE
AS
  declare @data datetime
  set @data = (select min(Data_Ped) from deleted)
  
  IF (DateDiff(dd, @data, GetDate())) <= 5
    BEGIN
    UPDATE tb_produto 
    SET tb_produto.Qtd_est = tb_produto.Qtd_est + deleted.qtd_Prod
    FROM deleted
    WHERE Produto.Cod_Prod = deleted.Cod_Prod

  
  
  
end


DELETE tb_itensvendidos Where Num_Ped = 1;
DELETE tb_itensvendidos Where Num_Ped = 2;

-- 3
Delimiter //
CREATE TRIGGER Trrg_TrocaProduto before update 
oN tb_itensvendidos
FOR EACH ROW 
Begin
  declare data datetime;
  set @data = (select min(Data_Ped) from deleted);

  IF (DateDiff(dd, @data, GetDate())) <= 5
  BEGIN
  -- Baixa produtos inseridos
      UPDATE Produto 
      SET Produto.Qtd_Est = Produto.Qtd_Est - Inserted.Qtd_Prod ;
      FROM Inserted
      Where Produto.Cod_Prod = inserted.Cod_Prod
  -- Acrescenta produtos retirados
      UPDATE Produto 
      SET Produto.Qtd_Est = Produto.Qtd_Est + deleted.Qtd_Prod ;
      FROM deleted
      WHERE Produto.Cod_Prod = deleted.Cod_Prod
End
End//

Delimiter ;












delimiter porra
create trigger nometrigger before/after insert/update/delete
on tb_fodase
for each row
Begin
set asdaudhasduasda
 End porra
delimiter ;


 


