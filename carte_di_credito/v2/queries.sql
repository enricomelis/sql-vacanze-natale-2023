USE carte_di_credito;

-- 1)
SELECT 
    acquisti.categoria, 
    MONTH(acquisti.data) AS mese, 
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    acquisti.categoria, 
    MONTH(acquisti.data); -- non so come si gruppa per trimestre avendo il mese

-- 2)
SELECT 
    acquisti.data,
    estratto_conto.id_estratto_conto, 
    AVG(IF(acquisti.categoria = 'viaggi', 1, NULL)) AS acquisti_viaggi_media
FROM acquisti
JOIN estratto_conto ON acquisti.id_acquisto
JOIN clienti ON acquisti.id_acquisto
WHERE 
    YEAR(acquisti.data) = 2023
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000
GROUP BY 
    estratto_conto.id_estratto_conto;

-- 3)
SELECT
    MONTH(acquisti.data) AS mese_acquisto, 
    SUM(acquisti.importo) AS totale_speso

FROM acquisti
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    mese_acquisto;

-- 4)
SELECT
    clienti.fascia_reddito, 
    promozioni.nome_prodotto, 
    COUNT(risposte_promozioni.risposta) AS adesioni
FROM risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
WHERE risposte_promozioni.risposta = 'si'
GROUP BY
    promozioni.nome_prodotto;

-- 5)
SELECT
    COUNT(risposte_promozioni.risposta) AS adesioni
FROM
    risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
WHERE 
    promozioni.nome_prodotto = 'orologio'
    AND risposte_promozioni.risposta = 'si'
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000;