-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(20) NULL DEFAULT NULL,
  `Endereco` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`));


-- -----------------------------------------------------
-- Table `Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `Placa` VARCHAR(10) NOT NULL,
  `Modelo` VARCHAR(100) NULL DEFAULT NULL,
  `Ano` INT NULL DEFAULT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE INDEX (`Placa` ASC) VISIBLE,
  INDEX (`idCliente` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`));


-- -----------------------------------------------------
-- Table `Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Endereco` VARCHAR(150) NULL DEFAULT NULL,
  `Especialidade` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idMecanico`));


-- -----------------------------------------------------
-- Table `Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe` (
  `idEquipe` INT NULL DEFAULT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEquipe`));


-- -----------------------------------------------------
-- Table `Equipe_Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe_Mecanico` (
  `idEquipe` INT NOT NULL,
  `idMecanico` INT NOT NULL,
  PRIMARY KEY (`idEquipe`, `idMecanico`),
  INDEX (`idMecanico` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`idEquipe`)
    REFERENCES `Equipe` (`idEquipe`),
  CONSTRAINT ``
    FOREIGN KEY (`idMecanico`)
    REFERENCES `Mecanico` (`idMecanico`));


-- -----------------------------------------------------
-- Table `OrdemServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrdemServico` (
  `idOS` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `DataEmissao` DATE NOT NULL,
  `DataConclusaoPrevista` DATE NULL DEFAULT NULL,
  `ValorTotal` DECIMAL(10,2) NULL DEFAULT NULL,
  `Status` VARCHAR(30) NOT NULL,
  `idVeiculo` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  PRIMARY KEY (`idOS`),
  INDEX (`idVeiculo` ASC) VISIBLE,
  INDEX (`idEquipe` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `Veiculo` (`idVeiculo`),
  CONSTRAINT ``
    FOREIGN KEY (`idEquipe`)
    REFERENCES `Equipe` (`idEquipe`));


-- -----------------------------------------------------
-- Table `Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servico` (
  `idServico` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(150) NOT NULL,
  `ValorReferencia` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idServico`));


-- -----------------------------------------------------
-- Table `Peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca` (
  `idPeca` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(150) NOT NULL,
  `ValorUnitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idPeca`));


-- -----------------------------------------------------
-- Table `Servico_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servico_OS` (
  `idOS` INT NOT NULL,
  `idServico` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT 1,
  `ValorCalculado` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idOS`, `idServico`),
  INDEX (`idServico` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`idOS`)
    REFERENCES `OrdemServico` (`idOS`),
  CONSTRAINT ``
    FOREIGN KEY (`idServico`)
    REFERENCES `Servico` (`idServico`));


-- -----------------------------------------------------
-- Table `Peca_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peca_OS` (
  `idOS` INT NOT NULL,
  `idPeca` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT 1,
  `ValorCalculado` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idOS`, `idPeca`),
  INDEX (`idPeca` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`idOS`)
    REFERENCES `OrdemServico` (`idOS`),
  CONSTRAINT ``
    FOREIGN KEY (`idPeca`)
    REFERENCES `Peca` (`idPeca`));
