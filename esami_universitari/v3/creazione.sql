CREATE DATABASE esami_universitari;
CREATE TABLE `corso` (
  `sigla` VARCHAR(10) NOT NULL,
  `nome_corso` VARCHAR(255) NOT NULL,
  `nome_prof` VARCHAR(255) NOT NULL,
  `dipertimento_prof` VARCHAR(255) NOT NULL,
  `crediti` INT NOT NULL,
  `semestre` ENUM('invernale', 'autunnale') NOT NULL,
  PRIMARY KEY (`sigla`)
);

CREATE TABLE `studente` (
  `matricola` VARCHAR(10) NOT NULL,
  `sesso` ENUM('M', 'F') NOT NULL,
  `nome_uni_laurea` VARCHAR(255) NOT NULL,
  `corso` VARCHAR(10) NOT NULL,
  `anno_iscrizione` YEAR NOT NULL,
  PRIMARY KEY (`matricola`),
  FOREIGN KEY (`corso`) REFERENCES `corso`(`sigla`)
);

CREATE TABLE `esame` (
  `id_esame` INT NOT NULL AUTO_INCREMENT,
  `voto` INT CHECK (`voto` BETWEEN 1 AND 31),
  `studente_matricola` VARCHAR(10) NOT NULL,
  `corso_sigla` VARCHAR(10) NOT NULL,
  `sessione` ENUM('invernale', 'estiva', 'autunnale') NOT NULL,
  `anno_accademico` YEAR NOT NULL,
  PRIMARY KEY (`id_esame`),
  FOREIGN KEY (`studente_matricola`) REFERENCES `studente`(`matricola`),
  FOREIGN KEY (`corso_sigla`) REFERENCES `corso`(`sigla`)
);