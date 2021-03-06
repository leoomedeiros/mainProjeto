
CREATE TABLE CLIENTE (
id_cliente INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
datas TIMESTAMP NOT NULL, 
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(14) NOT NULL,
endereco VARCHAR(255),
telefone VARCHAR(30) NOT NULL,
PRIMARY KEY (id_cliente)
);


CREATE TABLE PRODUTO(
id_prod INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
datas TIMESTAMP NOT NULL,
nome VARCHAR(255) NOT NULL,
categoria VARCHAR(100) NOT NULL ,
cor VARCHAR(100) NOT NULL,
tamanho INT NOT NULL ,
quantidade_estoque INT NOT NULL,
descr VARCHAR(255),
preco DOUBLE NOT NULL,
PRIMARY KEY (id_prod)
);

CREATE TABLE FILIAL (
id_filial INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
datas TIMESTAMP NOT NULL, 
PRIMARY KEY (id_filial)
);



CREATE TABLE FUNCIONARIO (
id_funcionario INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
datas TIMESTAMP NOT NULL,
id_filial INT NOT NULL,
nome VARCHAR(255) NOT NULL,
cargo VARCHAR(50) NOT NULL,
senha VARCHAR(20),
telefone VARCHAR(30) NOT NULL,
FOREIGN KEY (id_filial) REFERENCES FILIAL(id_filial),
PRIMARY KEY (id_funcionario)
);


CREATE TABLE VENDA (
    id_venda INT NOT NULL 
          GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    datas TIMESTAMP NOT NULL,
    id_cliente INT NOT NULL,
    valorTotal DOUBLE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    PRIMARY KEY (id_venda)
);


/*ITEM DE PRODUTOS OU CARRINHO*/  
CREATE TABLE ITEMVENDA (
    id_itemVenda INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    id_venda INT NOT NULL,
    id_prod INT NOT NULL,
    qtdVenda INT NOT NULL,
    FOREIGN KEY (id_prod) REFERENCES PRODUTO (id_prod),
    FOREIGN KEY (id_venda) REFERENCES VENDA (id_venda)
);


/*LOG DO FUNCIONÁRIO*/  
CREATE TABLE LOG_FUNCIONARIO (
    id INT NOT NULL 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    id_funcionario INT NOT NULL,
    acao VARCHAR (255) NOT NULL, -- Incluiu, Alterou, Removeu, Consultou
    id_registro INT NOT NULL,
    nm_tabela VARCHAR (255) NOT NULL,
    data_acao TIMESTAMP NOT NULL,
    qntd INT
    --FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO (id_funcionario)
);

INSERT INTO Log_funcionario VALUES (default,1,'exclusão',1,'Produto','2017-12-01 05:18:44',7);

INSERT INTO Log_funcionario VALUES (default,2,'inclusão',2,'Cliente','2017-11-01 07:20:20',10);

INSERT INTO Log_funcionario VALUES (default,3,'exclusão',3,'Produto','2017-10-01 09:22:00',13);

INSERT INTO Produto VALUES (default,'2017-10-01 09:22:00','nike','pica','azul',3,14,'Produtoasdas',13.5);
INSERT INTO Produto VALUES (default,'2017-10-01 19:12:00','nsaddike','picdsadsaa','azuasfasl',4,5,'Prodsadasdutoasdas',13.5);
INSERT INTO Produto VALUES (default,'2017-10-01 19:12:00','puma','picdsdasadsaa','azuasfasl',6,6,'Prodsadasdutoasdas',13.5);

INSERT INTO ITEMVENDA VALUES (default,1,3,23)
INSERT INTO ITEMVENDA VALUES (default,1,2,32)
INSERT INTO ITEMVENDA VALUES (default,1,1,321)

INSERT INTO ITEMVENDA VALUES (default,2,3,21)

INSERT INTO ITEMVENDA VALUES (default,3,2,21)
INSERT INTO ITEMVENDA VALUES (default,3,1,25)

INSERT INTO VENDA VALUES (default,'2017-10-01 12:25:00',1,99.90)
INSERT INTO VENDA VALUES (default,'2017-11-01 12:25:00',2,199.90)
INSERT INTO VENDA VALUES (default,'2017-12-01 12:25:00',3,1199.90);



--SELECT * FROM LOG_FUNCIONARIO WHERE nm_tabela = 'Produto' AND (DATA_ACAO BETWEEN '2017-01-30 00:00:00' AND '2017-12-30 23:59:59');
