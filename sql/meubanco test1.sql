-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`perfil` (
  `id` INT NOT NULL,
  `perfil` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `id` INT NOT NULL,
  `casa` CHAR(10) NOT NULL,
  `cep` INT(8) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  `dataNasc` DATE NOT NULL,
  `cpf` BIGINT(11) NOT NULL,
  `perfil_id` INT NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_perfil_idx` (`perfil_id` ASC),
  INDEX `fk_usuario_endereco1_idx` (`endereco_id` ASC),
  CONSTRAINT `fk_usuario_perfil`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `mydb`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_endereco1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `mydb`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Encomenda` (
  `id` INT NOT NULL,
  `nProtocolo` INT NOT NULL,
  `dataEntrada` DATE NOT NULL,
  `dataPrevistaSaida` DATE NOT NULL,
  `dataSaida` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`insumos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`insumos` (
  `id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  `dataCompra` DATE NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `dataAdmicao` DATE NOT NULL,
  `salario` FLOAT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `carga horaria mensal` VARCHAR(45) NOT NULL,
  `hora de entrada` INT NOT NULL,
  `hora de saida` INT NOT NULL,
  `Encomenda_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `insumos_id` INT NOT NULL,
  INDEX `fk_funcionario_Encomenda1_idx` (`Encomenda_id` ASC),
  INDEX `fk_funcionario_usuario1_idx` (`usuario_id` ASC),
  PRIMARY KEY (`insumos_id`),
  CONSTRAINT `fk_funcionario_Encomenda1`
    FOREIGN KEY (`Encomenda_id`)
    REFERENCES `mydb`.`Encomenda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_insumos1`
    FOREIGN KEY (`insumos_id`)
    REFERENCES `mydb`.`insumos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `id` INT NOT NULL,
  `pecaRoupa` VARCHAR(45) NOT NULL,
  `sexo` ENUM('M', 'F') NOT NULL,
  `Encomenda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoria_Encomenda1_idx` (`Encomenda_id` ASC),
  CONSTRAINT `fk_categoria_Encomenda1`
    FOREIGN KEY (`Encomenda_id`)
    REFERENCES `mydb`.`Encomenda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_cliente_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_cliente_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `id` INT NOT NULL,
  `telefone` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone_has_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone_has_usuario` (
  `telefone_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`telefone_id`, `usuario_id`),
  INDEX `fk_telefone_has_usuario_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_telefone_has_usuario_telefone1_idx` (`telefone_id` ASC),
  CONSTRAINT `fk_telefone_has_usuario_telefone1`
    FOREIGN KEY (`telefone_id`)
    REFERENCES `mydb`.`telefone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefone_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
