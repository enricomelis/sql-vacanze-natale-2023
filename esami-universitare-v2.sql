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

-- 1) solo per nome del corso, basta cambiare condizione

SELECT COUNT(*) AS esami_superati
FROM esame JOIN corso ON esame.corso_sigla
WHERE esame.voto >= 18 AND corso_sigla = 'NOMECORSO';

SELECT COUNT(DISTINCT esame.studente_matricola) AS esami_sostenuti
FROM esame JOIN corso ON esame.corso_sigla = corso_sigla
WHERE corso_sigla = 'NOMECORSO';

-- 2) solo per nome del corso, basta cambiare condizione

SELECT COUNT(*) AS esami_non_superati
FROM esame JOIN corso ON esame.corso_sigla = corso_sigla
WHERE esame.voto < 18 AND corso_sigla = 'NOMECORSO';

-- 3) sempre solo per nome corso

SELECT 
    AVG(esame.voto) AS voto_medio_superati, 
    SUM(corso.crediti) AS cuf_totali
FROM esame JOIN corso ON esame.corso_sigla = corso_sigla
WHERE esame.voto >= 18 AND corso_sigla = 'NOMECORSO';


-- 4)

SELECT 
    AVG(IF(esame.voto >= 18, esame.voto, NULL)) AS voto_medio_superati,
    COUNT(DISTINCT esame.studente_matricola) AS numero_studenti_sostenuto,
    SUM(esame.voto >= 18) / COUNT(esame.studente_matricola) * 100 AS percentuale_superati
FROM esame JOIN studente ON esame.studente_matricola = studente_matricola
WHERE esame.nome_corso = 'NOMECORSO';


-- 5)

SELECT 
    COUNT(*) AS esami_superati
FROM esame
WHERE esame.nome_corso = 'NOMECORSO' AND esame.voto >= 18
HAVING COUNT(*) < 3;

