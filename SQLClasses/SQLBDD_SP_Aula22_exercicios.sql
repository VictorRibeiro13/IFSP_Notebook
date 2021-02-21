CREATE DATABASE bd_vendas; 
 
USE bd_vendas; 
 
 
 select*from tb_venda;
 
 
CREATE TABLE tb_cliente (   
pk_cliente int auto_increment not null,
  nome varchar(255) NOT NULL,
  cpf varchar(11) NOT NULL,
  primary key(pk_cliente) ); 
 
CREATE TABLE tb_vendedor (   
pk_vendedor int  auto_increment not null,
  nome varchar(255) NOT NULL ,
  PRIMARY KEY (pk_vendedor)); 
 
CREATE TABLE tb_produto (  
 pk_produto int auto_increment not null,
  nome varchar(255) NOT NULL, 
  quantidade_estoque int NOT NULL ,
  primary key(pk_produto)) ; 
 

 
CREATE TABLE tb_loja (   
pk_loja int  auto_increment not null, 
 nome varchar(255) NOT NULL, 
 cnpj varchar(14) NOT NULL ,
 PRIMARY KEY(pk_loja)
 ) ; 
 
CREATE TABLE tb_venda (   
pk_venda int  auto_increment not null, 
 percentual_desconto float,  
 data_venda datetime NOT NULL,
 fk_loja int ,
 fk_vendedor int, 
 fk_cliente int ,
 valor_total float ,
 PRIMARY KEY(pk_venda),
foreign key(fk_loja) references tb_loja(pk_loja),
foreign key(fk_vendedor) REFERENCES tb_vendedor(pk_vendedor), 
foreign key(fk_cliente) REFERENCES tb_cliente(pk_cliente) 
 ) ; 
 
CREATE TABLE tb_NotaFiscal (
pk_notafiscal int  auto_increment not null,
  fk_loja int NOT NULL,
  fk_venda int,
  PRIMARY KEY(pk_notafiscal)) ; 
 
CREATE TABLE tb_itens (  
 pk_item int  auto_increment not null,
  fk_venda int,
  fk_produto int,
  PRIMARY KEY(pk_item) ); 
 

INSERT INTO  tb_produto(nome,quantidade_estoque) VALUES ('keyboard',20);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('monitor',50);
 INSERT INTO tb_produto (nome,quantidade_estoque)VALUES ('mouse',100);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('mouse pad',200);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('mouse wireless',50);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('pen drive 2GB',200);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('pen drive 8GB',200);
 INSERT INTO tb_produto(nome,quantidade_estoque) VALUES ('pen drive 16GB',200);
 
 
INSERT INTO tb_cliente(nome,cpf) VALUES ('Joao Pedro Neves','11122233300');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Joao Botelho Alves','11122233301');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Maria da Silva Soares','11122233302');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Ana Maria Rocha','11122233303');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Cristina Maria Ana Silva','11122233304');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Carlos Augusto Vieira','11122233305');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Marcelo Lopes Vieira','11122233306');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Joao Jose da Silva','11122233307'); 
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Carlos Magno Monteiro','11122233308');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Jose Maria da Silva','11122233309');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Marta Vieira Nunes','11122233310');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Carla Carolina Mendes','11122233311');
 INSERT INTO tb_cliente(nome,cpf) VALUES ('Daiana Moreira Silva','11122233312'); 
 
INSERT INTO tb_vendedor(nome) VALUES ('Daniel Andres Oliveira');
 INSERT INTO tb_vendedor(nome) VALUES ('Marcos Cunha'); 
 INSERT INTO tb_vendedor(nome) VALUES ('Andreia Olivia Marta');
 INSERT INTO tb_vendedor(nome) VALUES ('Carlos Dias');
 INSERT INTO tb_vendedor(nome) VALUES ('Pedro Pedreira');
 INSERT INTO tb_vendedor(nome) VALUES ('GUSTAVO MOTTA'); 
INSERT INTO tb_vendedor(nome) VALUES ('ADILSON EVANDRO'); 
 
 
INSERT INTO tb_loja(nome,cnpj) VALUES ('Loja Unidade Minas Gerais','11111111110');
 INSERT INTO tb_loja (nome,cnpj)VALUES ('Loja Unidade Sao Paulo','11111111111');
 INSERT INTO tb_loja(nome,cnpj) VALUES ('Loja Unidade Rio de Janeiro','11111111112');
 INSERT INTO tb_loja (nome,cnpj)VALUES ('Loja Unidade Espirito Santo','11111111113'); 
 
-- STR_TO_DATE('2012-11-29 18:21:11.123', '%Y-%m-%d %T.%f');
  
 

INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (3.5,STR_TO_DATE('18-06-12 10:34','%Y-%m-%d %T.%f'),1,1,0,10);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (1.5,STR_TO_DATE('15-06-12 10:34','%Y-%m-%d %T.%f'),2,2,1,20);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (2.5,STR_TO_DATE('13-06-12 10:34','%Y-%m-%d %T.%f'),0,3,2,30);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (1.5,STR_TO_DATE('12-06-12 10:34:09 ','%Y-%m-%d %T.%f'),1,4,3,40) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (1.5,STR_TO_DATE('15-06-12 10:34:09 ','%Y-%m-%d %T.%f'),1,0,4,50);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (1.5,STR_TO_DATE('19-06-12 10:34:09 ','%Y-%m-%d %T.%f'),1,1,5,60) ;
 INSERT INTO tb_venda (percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total)VALUES (1.5,STR_TO_DATE('20-06-12 10:34:09 ','%Y-%m-%d %T.%f'),2,2,6,70) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (2.5,STR_TO_DATE('18-07-12 10:34:09 ','%Y-%m-%d %T.%f'),2,3,7,80);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (2.5,STR_TO_DATE('11-07-12 10:34:09 ','%Y-%m-%d %T.%f'),2,4,8,90);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (2.5,STR_TO_DATE('10-07-12 10:34:09 ','%Y-%m-%d %T.%f'),0,0,9,10) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (3.5,STR_TO_DATE('28-07-12 10:34:09 ','%Y-%m-%d %T.%f'),0,1,1,20);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (3.5,STR_TO_DATE('1-05-13 10:34:09 ','%Y-%m-%d %T.%f'),0,1,2,30) ;
 INSERT INTO tb_venda (percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total)VALUES (2.5,STR_TO_DATE('8-05-13 10:34:09 ','%Y-%m-%d %T.%f'),1,1,2,40);
 INSERT INTO tb_venda (percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total)VALUES (3.5,STR_TO_DATE('12-05-13 10:34:09 ','%Y-%m-%d %T.%f'),2,2,3,50);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (13.5,STR_TO_DATE('18-05-13 10:34:09 ','%Y-%m-%d %T.%f'),0,2,3,60);
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (3.5,STR_TO_DATE('28-05-13 10:34:09 ','%Y-%m-%d %T.%f'),1,2,5,70) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (23.5,STR_TO_DATE('19-08-13 10:34:09 ','%Y-%m-%d %T.%f'),2,3,5,80) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (33.5,STR_TO_DATE('20-08-13 10:34:09 ','%Y-%m-%d %T.%f'),0,3,5,90) ;
 INSERT INTO tb_venda(percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total) VALUES (43.5,STR_TO_DATE('21-09-13 10:34:09 ','%Y-%m-%d %T.%f'),1,4,7,10) ;
 INSERT INTO tb_venda (percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total)VALUES (53.5,STR_TO_DATE('18-10-13 10:34:09 ','%Y-%m-%d %T.%f'),2,4,7,20);
 INSERT INTO tb_venda (percentual_desconto,data_venda,fk_loja,fk_vendedor,fk_cliente,valor_total)VALUES (63.5,STR_TO_DATE('11-11-13 10:34:09 ','%Y-%m-%d %T.%f'),0,4,7,30) ;
 
 
 
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (0,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (1,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (2,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (3,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (4,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (5,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (6,1) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (7,1) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (8,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (9,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (10,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (11,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (12,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (13,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (14,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (15,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (16,1) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (17,1);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (18,1);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (19,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (20,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (21,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (0,2) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (1,2);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (2,2); 
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (3,2);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (4,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (5,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (6,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (7,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (8,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (9,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (10,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (11,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (12,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (13,2);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (14,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (15,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (16,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (17,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (18,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (19,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (20,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (21,2) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (0,3) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (1,4) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (2,5) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (3,6);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (4,7) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (5,0) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (6,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (7,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (8,3) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (9,4) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (10,5);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (11,6) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (12,7);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (13,0) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (14,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (15,2) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (16,3) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (17,4) ;
 iNSERT INTO tb_itens(fk_venda,fk_produto) VALUES (18,5) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (19,6);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (20,7) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (21,0) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (0,1) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (1,2);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (2,3) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (3,4) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (4,5);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (5,6) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (6,7);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (7,0) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (8,1);
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (9,2) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (10,3); 
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (11,4) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (12,5) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (13,6) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (14,7);
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (16,1) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (17,2) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (18,3);
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (20,5) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (21,6) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (0,7) ;
INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (1,0) ;
INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (2,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (3,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (4,3);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (5,4) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (6,5) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (7,6) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (8,7);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (9,0) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (10,1);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (11,2);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (12,3);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (13,4);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (14,5);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (15,3);
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (16,6) ;
 INSERT INTO tb_itens(fk_venda,fk_produto) VALUES (17,7) ;
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (18,0);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (19,1);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (20,4);
 INSERT INTO tb_itens (fk_venda,fk_produto)VALUES (21,5) ;


 
INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,0) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,1);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,2) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,3) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,4) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,5);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,6) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (1,7) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (2,8) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,9) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,10);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,11);
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (0,12) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,13) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,14) ;
INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (0,15);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,16);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,17);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,18);
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,19);
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (2,20);
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (0,21);
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (1,22) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,23) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,24) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,25) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (2,26) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,27) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (1,28) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (2,29) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,30) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,31) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (1,32) ;
 INSERT INTO tb_notafiscal (fk_loja,fk_venda)VALUES (0,33) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,34) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (1,35) ;
 INSERT INTO tb_notafiscal(fk_loja,fk_venda) VALUES (0,36) ;
 
 
 
 
 -- SPS
 
 -- 1) Faça uma SP que retorne a media da quantidade em estoque de todos os produtos 
 
CREATE PROCEDURE sp_media(inout @quantidade_estoque int) AS
DECLARE @mediaTotal int
BEGIN 
SELECT AVG(@quantidade_estoque) FROM tb_produto
SET @mediaTotal = AVG(@quantidade_estoque)
print @mediaTotal
END

EXEC sp_media 4;

-- 2) Faça uma SP que retorne todos os vendedores que realizaram vendas cujo nome tenha em sua parte %dr% 
CREATE PROCEDURE sp_vendedores AS
BEGIN
SELECT * FROM tb_vendedor WHERE nome LIKE '%dr%'
END

EXEC sp_vendedores;

-- 3)  Faça uma SP que dado a PK de produto mostre quantas vendas foram realizadas para ele 
CREATE PROCEDURE sp_produto(@pk_produto int) AS
BEGIN
SELECT Count(*) FROM tb_itens WHERE fk_produto = @pk_produto
END

EXEC sp_produto 1

-- 4)  Faça uma SP que dado a PK de uma loja mostre a quantidade de vendas realizadas para ela 
CREATE PROCEDURE sp_lojas(@pk_loja int) AS
BEGIN 
SELECT Count(*) FROM tb_venda WHERE fk_loja = @pk_loja
END

EXEC sp_lojas 4

 
 
 
 
 
 
 
 
 
 
 
 
 