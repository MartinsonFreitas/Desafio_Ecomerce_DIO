-- Criacao de banco de dados para cenario de e-comerce

CREATE DATABASE e-commerce;
USE e-commerce;

-- criar tabela cliente
CREATE TABLE clients(
    idClient INT AUTO_INCREMENT, 
    Fname VARCHAR(10) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    FedId CHAR(11) NOT NULL COMMENT '1 CPF por pessoa',
    BirthDate DATE NOT NULL COMMENT 'Obrigatorio para maioridade',
    ZipCode CHAR(8) NOT NULL COMMENT 'Obrigatorio',
    AdressNumb INT NOT NULL COMMENT 'Obrigatorio',
    AdressComp VARCHAR(10) COMMENT 'Opcional',
    CONSTRAINT pk_clients PRIMARY KEY(idClient),
    CONSTRAINT uq_FedId UNIQUE(FedId)
);

-- Correcao para auto incrementar +1
ALTER TABLE products auto_increment =1;

-- criar tabela produto
CREATE TABLE products(
    idProduct INT AUTO_INCREMENT,
    Pname VARCHAR(40) NOT NULL,
    UnCost FLOAT NOT NULL,
    UnPrice FLOAT NOT NULL,
    GroupKids BOOLEAN DEFAULT FALSE COMMENT 'Padrao',
    Category ENUM(
        'Alimento',
        'Vestimenta',
        'Eletronicos',
        'Casa',
        'Papelaria'
    ) DEFAULT 'Eletronicos',
    Rating FLOAT DEFAULT 0.0,
    Psize VARCHAR(15),
    CONSTRAINT pk_products PRIMARY KEY(idProduct)
);

-- Correcao para auto incrementar +1
ALTER TABLE products auto_increment =1;

-- criar tabela pagamento
CREATE TABLE payments(
    idPayment INT AUTO_INCREMENT,
    idClient INT,
    PayMethods ENUM('Credito', 'Debito', 'Pix', 'Boleto') DEFAULT 'Pix',
    PayStatus ENUM('Em Andamento', 'Confirmado', 'Estornado', 'Cancelado') DEFAULT 'Em Andamento',
    CONSTRAINT pk_payments PRIMARY KEY (idPayment, idClient),
    CONSTRAINT fk_payments_client FOREIGN KEY(idClient) REFERENCES clients(idClient)
);

-- Correcao para auto incrementar +1
ALTER TABLE payments auto_increment =1;

-- criar tabela pedido
CREATE TABLE orders(
    idOrder INT AUTO_INCREMENT,
    idClient INT,
    OrDescription VARCHAR(255),
    Shipping FLOAT DEFAULT 15.00,
    OrStatus ENUM(
        'Em Processamento',
        'Aprovado',
        'Cancelado',
        'Enviado'
    ) DEFAULT 'Em Processamento',
    CONSTRAINT pk_orders PRIMARY KEY(idOrder),
    CONSTRAINT fk_orders_client FOREIGN KEY(idClient) REFERENCES clients(idClient)
);

-- Correcao para auto incrementar +1
ALTER TABLE orders auto_increment =1;

CREATE TABLE warehouses(
    idWarehouse INT AUTO_INCREMENT,
    idProduct INT,
    ZipCode CHAR(8) NOT NULL,
    Location VARCHAR(10),
    QtProduct INT DEFAULT 0,
    CONSTRAINT pk_warehouse PRIMARY KEY(idWarehouse),
    CONSTRAINT fk_productWarehouse FOREIGN KEY(idProduct) REFERENCES products(idProduct)
);

-- Correcao para auto incrementar +1
ALTER TABLE warehouses auto_increment =1;

-- criar tabela fornecedor
CREATE TABLE suppliers(
    idSupplier INT AUTO_INCREMENT,
    Sname VARCHAR(50) NOT NULL,
    RegisterEntity CHAR(15) COMMENT'Se PJ, informa CNPJ',
    FedId CHAR(11) COMMENT'Se PF, informa CPF',
    ZipCode CHAR(8) NOT NULL,
    CONSTRAINT pk_supplier PRIMARY KEY(idSupplier),
    CONSTRAINT uq_supplier UNIQUE(Sname)
);

-- criar tabela vendedor
CREATE TABLE retailers(
    idRetailer INT AUTO_INCREMENT,
    Rname VARCHAR(50) NOT NULL,
    RegisterEntity CHAR(15) COMMENT'Se PJ, informa CNPJ',
    FedId CHAR(11) COMMENT'Se PF, informa CPF',
    ZipCode CHAR(8) NOT NULL,
    CONSTRAINT pk_retailer PRIMARY KEY(idRetailer),
    CONSTRAINT uq_retailer UNIQUE(Rname)
);

-- relacao entre Pedido e Produto
CREATE TABLE productOrder(
    idPOrder INT,
    idPOproduct INT,
    OQuantity INT,
    POStatus ENUM('Disponivel','Em Producao', 'Sem Estoque') DEFAULT 'Disponivel',
    CONSTRAINT pk_ProductOrder PRIMARY KEY(idPOrder, idPOproduct),
    CONSTRAINT fk_POrder FOREIGN KEY(idPOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_POproducr FOREIGN KEY(idPOproduct) REFERENCES products(idProduct)
);


-- relacao entre Vendedor e Produto
CREATE TABLE productRetailer(
    idPRetailer INT,
    idPRproduct INT,
    RQuantity INT,
    CONSTRAINT pk_ProductRetailer PRIMARY KEY(idPRetailer, idPRproduct),
    CONSTRAINT fk_PRetailer FOREIGN KEY(idPRetailer) REFERENCES retailers(idRetailer),
    CONSTRAINT fk_PRproducr FOREIGN KEY(idPRproduct) REFERENCES products(idProduct)
);

-- relacao entre Fornecedor e Produto
CREATE TABLE productSupplier(
    idPSupplier INT,
    idPSproduct INT,
    SQuantity INT,
    CONSTRAINT pk_ProductSupplier PRIMARY KEY(idPSupplier, idPSproduct),
    CONSTRAINT fk_PSupplier FOREIGN KEY(idPSupplier) REFERENCES suppliers(idSupplier),
    CONSTRAINT fk_PSproducr FOREIGN KEY(idPSproduct) REFERENCES products(idProduct)
);