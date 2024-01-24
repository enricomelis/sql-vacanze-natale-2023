USE carte_di_credito;

INSERT INTO clienti (codice_fiscale, nome, fascia_reddito, sesso, data_di_nascita, indirizzo, saldo_ultimo_mese, numero_carta, anno_scadenza_carta) VALUES 
('RSSMRA70A01H501Z', 'Mario Rossi', 30000, 'maschio', '1970-01-01', 'Via Roma 1, Roma', '10', '123456789012', 2025),
('BNCLCU80B02F205P', 'Luca Bianchi', 45000, 'maschio', '1980-02-02', 'Via Milano 2, Milano', '1', '234567890123', 2026),
('VRDSRA90C03G301V', 'Sara Verdi', 28000, 'femmina', '1990-03-03', 'Via Napoli 3, Napoli', '10', '345678901234', 2027),
('NRNANR85D04H501Q', 'Anna Neri', 33000, 'femmina', '1985-04-04', 'Via Torino 4, Torino', '1', '456789012345', 2028),
('GLLGRI75E05I202X', 'Giorgio Gialli', 38000, 'maschio', '1975-05-05', 'Via Palermo 5, Palermo', '10', '567890123456', 2029);


INSERT INTO estratto_conto (data, importo_addebitato, codiceFiscale) VALUES 
('2024-01-01', 150.50, 'RSSMRA70A01H501Z'),
('2024-01-10', 200.75, 'BNCLCU80B02F205P'),
('2024-01-15', 100.00, 'VRDSRA90C03G301V'),
('2024-01-20', 250.00, 'NRNANR85D04H501Q'),
('2024-01-25', 175.25, 'GLLGRI75E05I202X'),
('2024-02-01', 300.00, 'RSSMRA70A01H501Z'),
('2024-02-10', 80.00, 'BNCLCU80B02F205P'),
('2024-02-15', 120.50, 'VRDSRA90C03G301V'),
('2024-02-20', 90.00, 'NRNANR85D04H501Q'),
('2024-02-25', 110.75, 'GLLGRI75E05I202X');


INSERT INTO acquisti (data, importo, esercente, categoria, citta, estrattoConto) VALUES 
('2024-01-02', 50.00, 'Supermercato XYZ', 'supermercato', 'Roma', 1),
('2024-01-03', 30.00, 'Ristorante ABC', 'ristorante', 'Milano', 2),
('2024-01-04', 100.00, 'Autonoleggio LMN', 'autonoleggio', 'Napoli', 3),
('2024-01-05', 200.00, 'Agenzia Viaggi OPQ', 'viaggi', 'Torino', 4),
('2024-01-06', 25.00, 'Cinema RST', 'intrattenimento', 'Palermo', 5),
('2024-01-07', 15.00, 'Farmacia UVW', 'farmacia', 'Roma', 6),
('2024-01-08', 75.00, 'Supermercato XYZ', 'supermercato', 'Milano', 7),
('2024-01-09', 60.00, 'Ristorante ABC', 'ristorante', 'Napoli', 8),
('2024-01-10', 150.00, 'Autonoleggio LMN', 'autonoleggio', 'Torino', 9),
('2024-01-11', 120.00, 'Agenzia Viaggi OPQ', 'viaggi', 'Palermo', 10);


INSERT INTO promozioni (codice_promozione, nome_prodotto, inizio_promozione, fine_promozione) VALUES 
('PROMO1', 'Prodotto A', '2024-01-01', '2024-06-30'),
('PROMO2', 'Prodotto B', '2024-02-01', '2024-07-31');


INSERT INTO risposte_promozioni (codiceFiscale, codicePromozione, risposta) VALUES 
('RSSMRA70A01H501Z', 'PROMO1', 'si'),
('BNCLCU80B02F205P', 'PROMO1', 'no'),
('VRDSRA90C03G301V', 'PROMO1', 'si'),
('NRNANR85D04H501Q', 'PROMO2', 'si'),
('GLLGRI75E05I202X', 'PROMO2', 'no');