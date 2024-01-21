USE esami_universitari;

-- 1)

SELECT 
  corso.nome_corso, 
  esame.anno_accademico, 
  esame.sessione, 
  COUNT(*) AS esami_superati, 
  COUNT(DISTINCT esame.studente_matricola) AS studenti_sostenuti
FROM esame JOIN corso ON esame.corso_sigla = corso.sigla
WHERE esame.voto >= 18
GROUP BY 
  corso.nome_corso, 
  esame.anno_accademico, 
  esame.sessione;

-- 2) 

SELECT 
  corso.nome_corso, 
  esame.anno_accademico, 
  esame.sessione, 
  studente.nome_uni_laurea, 
  COUNT(*) AS esami_non_superati, 
FROM esame 
JOIN corso ON esame.corso_sigla = corso.sigla
JOIN studente ON esame.studente_matricola = studente.matricola
WHERE esame.voto < 18
GROUP BY 
  corso.nome_corso, 
  esame.anno_accademico, 
  esame.sessione, 
  studente.nome_uni_laurea;


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
GROUP BY studente.sesso;


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
WHERE esame.anno_accademico = 2023
GROUP BY esame.sessione, corso.nome_corso;

-- 5)

SELECT 
  corso.nome_corso, 
  COUNT(*) AS numero_esami, 
  esame.anno_accademico 
FROM esame
JOIN corso ON esame.corso_sigla = corso.sigla
WHERE
  corso.nome_corso = 'NOME_ESEMPIO'
  AND esame.voto >= 18
GROUP BY 
  corso.nome_corso, 
  esame.anno_accademico
HAVING COUNT(*) < 3;