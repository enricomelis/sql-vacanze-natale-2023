
-- Parte 1: Struttura del DB

CREATE TABLE clienti(
    'codice_fiscale' VARCHAR(16) NOT NULL, 
    'nome' VARCHAR(255) NOT NULL,
    'fascia_reddito' INT NOT NULL, 
    'sesso' ENUM('maschio', 'femmina') NOT NULL, 
    'data_di_nascita' DATE NOT NULL, 
    'indirizzo' VARCHAR(255) NOT NULL, 
    'saldo_ultimo_mese' ENUM('10', '1'), 
    'numero_carta' INT(12) NOT NULL, 
    'anno_scadenza_carta' YEAR NOT NULL, 

    PRIMARY KEY (codice_fiscale)
);

CREATE TABLE estratto_conto(
    'id_estratto_conto' VARCHAR(15) NOT NULL AUTO_INCREMENT, 
    'data' DATE NOT NULL, 
    'importo_addebitato' FLOAT NOT NULL, 

    'codiceFiscale' VARCHAR(16)

    PRIMARY KEY (id_estratto_conto), 
    FOREIGN KEY (codiceFiscale) REFERENCES clienti.codice_fiscale
);

CREATE TABLE acquisti(
    'id_acquisto' VARCHAR(15) NOT NULL AUTO_INCREMENT, 
    'data' DATE NOT NULL, 
    'importo' FLOAT NOT NULL, 
    'esercente' VARCHAR(255) NOT NULL, 
    'categoria' ENUM('supermercato', 'ristorante', 'autonoleggio', 'viaggi', 'intrattenimento', 'farmacia') NOT NULL, 
    'citta' VARCHAR(30) NOT NULL, 

    'estrattoConto' VARCHAR(15), 

    PRIMARY KEY (id_acquisto), 
    FOREIGN KEY (estrattoConto) REFERENCES estratto_conto.id_estratto_conto
);

CREATE TABLE promozioni(
    'codice_promozione' VARCHAR(10) NOT NULL, 
    'nome_prodotto' VARCHAR(100) NOT NULL, 
    'inizio_promozione' DATE NOT NULL, 
    'fine_promozione' DATE NOT NULL, 
);

CREATE TABLE risposte_promozioni(
    'codiceFiscale' VARCHAR(16), 
    'codicePromozione' VARCHAR(10), 
    'risposta' ENUM('si', 'no'), 

    FOREIGN KEY (codiceFiscale) REFERENCES clienti.codice_fiscale, 
    FOREIGN KEY (codicePromozione) REFERENCES promozioni.codice_promozione, 
    PRIMARY KEY (codiceFiscale, codicePromozione)
);

-- Parte 2: Le Query

-- 1)
SELECT 
    acquisti.categoria, 
    MONTH(acquisti.data) AS mese_acquisto, 
    clienti.indirizzo, -- non so come si calcola la regione dato un indirizzo
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    acquisti.categoria, 
    acquisti.data, -- non so come si groupa per trimestre avendo il mese
    clienti.indirizzo;

-- 2)
SELECT 
    acquisti.data,
    estratto_conto.id_estratto_conto, 
    clienti.indirizzo, 
    AVG(IF(acquisti.categoria = 'viaggi', 1, NULL)) AS acquisti_viaggi_media
FROM acquisti
JOIN estratto_conto ON acquisti.id_acquisto
JOIN clienti ON acquisti.id_acquisto
WHERE 
    YEAR(acquisti.data) = 2023
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000
GROUP BY 
    estratto_conto.id_estratto_conto, 
    clienti.indirizzo;

-- 3)
SELECT
    clienti.indirizzo, 
    MONTH(acquisti.data) AS mese_acquisto, 
    SUM(acquisti.importo) AS totale_speso

FROM acquisti
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    mese_acquisto, 
    clienti.indirizzo;

-- 4)
SELECT
    clienti.fascia_reddito, 
    promozioni.nome_prodotto, 
    COUNT(risposte_promozioni.risposta = 'si') AS adesioni
FROM risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
GROUP BY
    promozioni.nome_prodotto, 
    clienti.fascia_reddito;

-- 5)
SELECT
    COUNT(risposte_promozioni.risposta = 'si') AS adesioni
FROM
    risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
WHERE 
    promozioni.nome_prodotto = 'orologio'
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000;