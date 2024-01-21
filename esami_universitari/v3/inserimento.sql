USE esami_universitari;

INSERT INTO corso (sigla, nome_corso, nome_prof, dipertimento_prof, crediti, semestre)
VALUES 
('CHM104', 'Chimica', 'Anna Giallo', 'Chimica', 6, 'autunnale'),
('LIT105', 'Letteratura', 'Carlo Neri', 'Lettere', 6, 'invernale'),
('ECO106', 'Economia', 'Laura Marrone', 'Economia', 6, 'invernale'),
('PSY107', 'Psicologia', 'Sara Blu', 'Psicologia', 6, 'autunnale'),
('HIS108', 'Storia', 'Marco Viola', 'Storia', 6, 'invernale');


INSERT INTO studente (matricola, sesso, nome_uni_laurea, corso, anno_iscrizione)
VALUES 
('S12348', 'F', 'Università di Firenze', 'CHM104', 2022),
('S12349', 'M', 'Università di Torino', 'LIT105', 2021),
('S12350', 'F', 'Università di Palermo', 'ECO106', 2020),
('S12351', 'M', 'Università di Bologna', 'PSY107', 2022),
('S12352', 'F', 'Università di Genova', 'HIS108', 2021);

INSERT INTO esame (id_esame, voto, studente_matricola, corso_sigla, sessione, anno_accademico) VALUES
(47, 26, 'S12350', 'CHM104', 'autunnale', 2021),
(48, 27, 'S12351', 'CHM104', 'invernale', 2022),
(51, 24, 'S12349', 'CHM104', 'autunnale', 2022),
(46, 30, 'S12349', 'ECO106', 'estiva', 2022),
(50, 31, 'S12348', 'ECO106', 'invernale', 2020),
(52, 22, 'S12350', 'HIS108', 'estiva', 2021),
(45, 28, 'S12348', 'LIT105', 'invernale', 2021),
(49, 29, 'S12352', 'LIT105', 'estiva', 2021),
(53, 15, 'S12350', 'LIT105', 'estiva', 2021);
