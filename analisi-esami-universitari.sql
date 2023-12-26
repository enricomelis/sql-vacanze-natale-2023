-- Parte 1: Creazione della Struttura

-- Tabella Corso con la sigla PK
-- ENUM serve per la scelta multipla
CREATE TABLE `corso` (
  `sigla` VARCHAR(10) NOT NULL,
  `nome_corso` VARCHAR(255) NOT NULL,
  `nome_prof` VARCHAR(255) NOT NULL,
  `dipertimento_prof` VARCHAR(255) NOT NULL,
  `crediti` INT NOT NULL,
  `semestre` ENUM('invernale', 'autunnale') NOT NULL,
  PRIMARY KEY (`sigla`)
);

-- Tabella Studente con matricola PK
-- Ha relazione tramite la FK 'corso'
CREATE TABLE `studente` (
  `matricola` VARCHAR(10) NOT NULL,
  `sesso` ENUM('M', 'F') NOT NULL,
  `nome_uni_laurea` VARCHAR(255) NOT NULL,
  `corso` VARCHAR(10) NOT NULL,
  `anno_iscrizione` YEAR NOT NULL,
  PRIMARY KEY (`matricola`),
  FOREIGN KEY (`corso`) REFERENCES `corso`(`sigla`)
);

-- Tabella Esame con id_esame PK (chiave artificiale incrementata automaticamente)
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

-- Parte 2: Le Query

-- 1)

SELECT 
    corso.nome_corso, 
    esame.anno_accademico, 
    esame.sessione, 
COUNT(*) AS esami_superati, 
COUNT(DISTINCT esame.studente_matricola) AS studenti_sostenuti
FROM esame JOIN corso ON esame.corso_sigla
WHERE esame.voto >= 18
GROUP BY 
    corso.nome_corso, 
    esame.anno_accademico, 
    esame.sessione

-- 2) 

SELECT 
    corso.nome_corso, 
    esame.anno_accademico, 
    esame.sessione, 
    studente.nome_uni_laurea, 
COUNT(*) AS esami_non_superati, 
COUNT(DISTINCT esame.studente_matricola) AS studenti_bocciati
FROM esame 
JOIN corso ON esame.corso_sigla = corso.sigla
JOIN studente ON esame.studente_matricola = studente.matricola
WHERE esame.voto < 18
GROUP BY 
    corso.nome_corso, 
    esame.anno_accademico, 
    esame.sessione, 
    studente.nome_uni_laurea

-- 3)

SELECT 
    corso.nome_corso, 
    studente.anno_iscrizione, 
    studente.sesso, 
AVG(esame.voto) AS voto_medio, 
SUM(corso.crediti) AS crediti_totali
FROM esame
JOIN studente ON esame.studente_matricola = studente.matricola
JOIN corso ON esame.corso_sigla = corso.sigla
WHERE
    esame.voto >= 18
    AND corso.nome_corso = 'NOME_ESEMPIO'
    AND studente.anno_iscrizione = ANNO_ESEMPIO
GROUP BY studente.sesso


-- 4)

SELECT 
  corso.nome_corso, 
  esame.sessione,
  AVG(IF(esame.voto >= 18, esame.voto, NULL)) AS voto_medio_superati,
  COUNT(DISTINCT esame.studente_matricola) AS numero_studenti_sostenuto,
  SUM(esame.voto >= 18) / COUNT(esame.studente_matricola) * 100 AS percentuale_superati

FROM esame
JOIN studente ON esame.studente_matricola = studente.matricola
JOIN corso ON esame.corso_sigla = corso.sigla
WHERE AND esame.anno_accademico = 2023
GROUP BY esame.sessione

-- 5)