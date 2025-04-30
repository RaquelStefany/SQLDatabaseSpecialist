-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);

-- -----------------------------------------------------
-- Table Veiculo
-- -----------------------------------------------------
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) UNIQUE,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- -----------------------------------------------------
-- Table OrdemServico
-- -----------------------------------------------------
CREATE TABLE OrdemServico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    DataAbertura DATE,
    Status VARCHAR(45),
    Descricao TEXT,
    Veiculo_idVeiculo INT,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- -----------------------------------------------------
-- Table Servico
-- -----------------------------------------------------
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    NomeServico VARCHAR(100),
    PrecoBase DECIMAL(10,2)
);

-- -----------------------------------------------------
-- Table Peca
-- -----------------------------------------------------
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    PrecoUnitario DECIMAL(10,2)
);

-- -----------------------------------------------------
-- Table Mecanico
-- -----------------------------------------------------
CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100)
);

-- -----------------------------------------------------
-- Table ExecucaoServico
-- -----------------------------------------------------
CREATE TABLE ExecucaoServico (
    idExecucao INT AUTO_INCREMENT PRIMARY KEY,
    OrdemServico_idOS INT,
    Servico_idServico INT,
    Mecanico_idMecanico INT,
    DataExecucao DATE,
    FOREIGN KEY (OrdemServico_idOS) REFERENCES OrdemServico(idOS),
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico)
);

-- -----------------------------------------------------
-- Table PecasUsadas
-- -----------------------------------------------------
CREATE TABLE PecasUsadas (
    ExecucaoServico_idExecucao INT,
    Peca_idPeca INT,
    Quantidade INT,
    FOREIGN KEY (ExecucaoServico_idExecucao) REFERENCES ExecucaoServico(idExecucao),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
    PRIMARY KEY (ExecucaoServico_idExecucao, Peca_idPeca)
);
