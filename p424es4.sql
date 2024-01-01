
-- creazione DB
CREATE DATABASE aerei;

CREATE TABLE compagnie(
    'nome' VARCHAR(16) NOT NULL,
    'anno_fondazione' YEAR NOT NULL,

    PRIMARY KEY ('nome')
);

CREATE TABLE piloti(
    'id' INT NOT NULL AUTO_INCREMENT, 
    'nome' VARCHAR(16) NOT NULL, 
 
    PRIMARY KEY ('id')
);

CREATE TABLE voli (
    'numero' VARCHAR(5) NOT NULL,
    'compagnia' VARCHAR(20) NOT NULL,
    'orario_partenza' HOUR NOT NULL,
    'orario_arrivo' HOUR NOT NULL,
    'durata' FLOAT NOT NULL, 
    'luogo_partenza' VARCHAR(20) NOT NULL,
    'luogo_destinazione' VARCHAR(20) NOT NULL,
    'scalo' VARCHAR(20),
    'soppresso' BOOLEAN NOT NULL,
    'pilota' INT NOT NULL,
    'copilota' INT NOT NULL,


    PRIMARY KEY ('numero'),
    FOREIGN KEY (compagnia) REFERENCES compagnie.nome
    FOREIGN KEY (pilota) REFERENCES piloti.codice
    FOREIGN KEY (copilota) REFERENCES piloti.codice
);

-- queries

-- a)
SELECT compagnie.nome
FROM voli
JOIN compagnie ON voli.compagnia = compagnia.nome
WHERE volo.scalo = 'Milano'

-- b)
SELECT voli.numero
FROM voli
WHERE voli.scalo = 'Napoli'

-- c)
SELECT voli.numero
FROM voli
WHERE 
    voli.luogo_partenza = 'Torino'
    AND voli.soppresso = 'True'

-- d)
SELECT voli.pilota
FROM voli
WHERE voli.numero = 'AZ345'

-- e)
SELECT COUNT(voli.copilota)
FROM voli
WHERE 
    voli.luogo_destinazione = 'Bari'
    AND voli.compagnia = 'Alitalia'