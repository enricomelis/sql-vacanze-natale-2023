CREATE DATABASE carte_di_credito;

CREATE TABLE clienti (
    codice_fiscale VARCHAR(16) NOT NULL, 
    nome VARCHAR(255) NOT NULL,
    fascia_reddito INT NOT NULL, 
    sesso ENUM('maschio', 'femmina') NOT NULL, 
    data_di_nascita DATE NOT NULL, 
    indirizzo VARCHAR(255) NOT NULL, 
    saldo_ultimo_mese ENUM('10', '1'), 
    numero_carta CHAR(12) NOT NULL, 
    anno_scadenza_carta YEAR NOT NULL, 

    PRIMARY KEY (codice_fiscale)
);

CREATE TABLE estratto_conto(
    id_estratto_conto INT NOT NULL AUTO_INCREMENT, 
    data DATE NOT NULL, 
    importo_addebitato FLOAT NOT NULL, 

    codiceFiscale VARCHAR(16), 

    PRIMARY KEY (id_estratto_conto), 
    FOREIGN KEY (codiceFiscale) REFERENCES clienti(codice_fiscale)
);

CREATE TABLE acquisti(
    id_acquisto INT NOT NULL AUTO_INCREMENT, 
    data DATE NOT NULL, 
    importo FLOAT NOT NULL, 
    esercente VARCHAR(255) NOT NULL, 
    categoria ENUM('supermercato', 'ristorante', 'autonoleggio', 'viaggi', 'intrattenimento', 'farmacia') NOT NULL, 
    citta VARCHAR(30) NOT NULL, 

    estrattoConto INT, 

    PRIMARY KEY (id_acquisto), 
    FOREIGN KEY (estrattoConto) REFERENCES estratto_conto(id_estratto_conto)
);

CREATE TABLE promozioni(
    codice_promozione VARCHAR(10) NOT NULL, 
    nome_prodotto VARCHAR(100) NOT NULL, 
    inizio_promozione DATE NOT NULL, 
    fine_promozione DATE NOT NULL,

    PRIMARY KEY (codice_promozione)
);

CREATE TABLE risposte_promozioni(
    codiceFiscale VARCHAR(16), 
    codicePromozione VARCHAR(10), 
    risposta ENUM('si', 'no'), 

    FOREIGN KEY (codiceFiscale) REFERENCES clienti(codice_fiscale), 
    FOREIGN KEY (codicePromozione) REFERENCES promozioni(codice_promozione), 
    PRIMARY KEY (codiceFiscale, codicePromozione)
);