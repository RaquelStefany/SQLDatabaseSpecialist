-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
    `idCliente` INT NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(45) NULL,
    `Identificação` VARCHAR(45) NULL,
    `Endereço` VARCHAR(45) NULL,
    PRIMARY KEY (`idCliente`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedido` (
    `idPedido` INT NOT NULL AUTO_INCREMENT,
    `Status do Pedido` VARCHAR(45) NULL,
    `Descrição` VARCHAR(45) NULL,
    `Cliente_idCliente` INT NOT NULL,
    `Frete` FLOAT NULL,
    PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
    INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
    CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto` (
    `idProduto` INT NOT NULL AUTO_INCREMENT,
    `Categoria` VARCHAR(45) NULL,
    `Descrição` VARCHAR(45) NULL,
    `Valor` VARCHAR(45) NULL,
    PRIMARY KEY (`idProduto`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fornecedor` (
    `idFornecedor` INT NOT NULL AUTO_INCREMENT,
    `Razão Social` VARCHAR(45) NULL,
    `CNPJ` VARCHAR(45) NULL,
    PRIMARY KEY (`idFornecedor`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Disponibilizando um Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Disponibilizando um Produto` (
    `Fornecedor_idFornecedor` INT NOT NULL,
    `Produto_idProduto` INT NOT NULL,
    PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
    INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
    INDEX `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
    CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estoque` (
    `idEstoque` INT NOT NULL AUTO_INCREMENT,
    `Local` VARCHAR(45) NULL,
    PRIMARY KEY (`idEstoque`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produto_has_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto_has_Estoque` (
    `Produto_idProduto` INT NOT NULL,
    `Estoque_idEstoque` INT NOT NULL,
    `Quantidade` INT NULL,
    PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
    INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
    INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
    CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `Estoque` (`idEstoque`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Relação de Produto / Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Relação de Produto / Pedido` (
    `Pedido_idPedido` INT NOT NULL,
    `Produto_idProduto` INT NOT NULL,
    `Quantidade` VARCHAR(45) NULL,
    PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`),
    INDEX `fk_Pedido_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
    INDEX `fk_Pedido_has_Produto_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
    CONSTRAINT `fk_Pedido_has_Produto_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Pedido_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Terceiro - Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Terceiro - Vendedor` (
    `idTerceiro - Vendedor` INT NOT NULL AUTO_INCREMENT,
    `Razão Social` VARCHAR(45) NULL,
    `Local` VARCHAR(45) NULL,
    PRIMARY KEY (`idTerceiro - Vendedor`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produtos por Vendedor (Terceiro)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produtos por Vendedor (Terceiro)` (
    `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
    `Produto_idProduto` INT NOT NULL,
    `Quantidade` INT NULL,
    PRIMARY KEY (
        `Terceiro - Vendedor_idTerceiro - Vendedor`,
        `Produto_idProduto`
    ),
    INDEX `fk_Terceiro - Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
    INDEX `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
    CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1` FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`) REFERENCES `Terceiro - Vendedor` (`idTerceiro - Vendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ClientePF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClientePF` (
    `CPF` VARCHAR(45) NULL,
    `DataNascimento` DATE NULL,
    `Cliente_idCliente` INT NOT NULL,
    PRIMARY KEY (`Cliente_idCliente`),
    INDEX `fk_ClientePF_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
    CONSTRAINT `fk_ClientePF_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ClientePJ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClientePJ` (
    `CNPJ` VARCHAR(45) NULL,
    `RazaoSocial` VARCHAR(45) NULL,
    `Cliente_idCliente` INT NOT NULL,
    PRIMARY KEY (`Cliente_idCliente`),
    CONSTRAINT `fk_ClientePJ_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento` (
    `idPagamento` INT NOT NULL AUTO_INCREMENT,
    `FormaPagamento` VARCHAR(45) NULL,
    `Valor` FLOAT NULL,
    `Pedido_idPedido` INT NOT NULL,
    PRIMARY KEY (`idPagamento`, `Pedido_idPedido`),
    INDEX `fk_Pagamento_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
    CONSTRAINT `fk_Pagamento_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entrega` (
    `idEntrega` INT NOT NULL AUTO_INCREMENT,
    `StatusEntrega` VARCHAR(45) NULL,
    `CodigoRastreio` VARCHAR(45) NULL,
    `Pedido_idPedido` INT NOT NULL,
    PRIMARY KEY (`idEntrega`, `Pedido_idPedido`),
    INDEX `fk_Entrega_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
    CONSTRAINT `fk_Entrega_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;