# sql-vacanze-natale-2023
 
# 1 Analisi degli esami universitari

Un'università vuole realizzare un *data mart* per analizzare i risultati degli esami degli 
studenti iscritti ai corsi di laurea magistrale nelle diverse sessioni di esami (invernale, 
estiva, autunnale).

Di un corso interessano la sigla, il nome, se obbligatorio, il nome e il dipartimento 
del docente, i crediti e il semestre in cui viene offerto.

Di uno studente interessano la matricola, il sesso, il nome dell'università dove si è 
laureato, il nome del corso di laurea magistrale e l'anno di iscrizione.

Di un esame interessano il voto, valore fra 1 e 31, considerato superato se il voto 
è maggiore di 17, la sessione di esame, l'anno accademico. Interessa anche il voto 
dell'esame non superato.

Si riportano alcuni esempi di analisi di interesse.

1. Numero di esami superati e il numero degli studenti che hanno sostenuto l'esame, 
per nome del corso, per anno accademico e per sessione.
2. Numero di esami non superati, per nome del corso, per anno accademico, per 
sessione e per università di laurea degli studenti.
3. Di un certo corso di laurea e un certo anno di iscrizione dello studente, voto 
medio degli esami superati e totale del numero dei CFU acquisiti, per sesso dello 
studente.
4. Voto medio degli esami superati, numero di studenti che hanno sostenuto l'esame 
e percentuale del numero di studenti che lo hanno superato, per nome del corso, 
per sessione del corrente anno accademico.
5. Di un certo corso di laurea e corsi con un numero di esami superati inferiore a 3, 
il numero degli esami, per nome del corso, per anno accademico.

# 2 Acquisti con carte di credito

1. Si consideri una BD che contiene le seguenti informazioni relative ai titolari di 
carte di credito (per brevità, i clienti) di una compagnia. Dei clienti interessano 
il codice fiscale, che li identifica, il nome, le fasce di reddito, il sesso, la data 
di nascita, l'indirizzo, il saldo dell'ultimo mese, il numero e l'anno di scadenza 
della carta di credito. I clienti ricevono mensilmente un estratto conto dal quale 
interessano il numero, che lo identifica, la data, l'importo totale addebitato e, per 
ogni acquisto, la data, l'importo, l'esercente e la sua categoria (supermercato, 
ristorante, autonoleggio, viaggi, intrattenimento, farmacia ecc.) e città.
Con l'estratto conto, ai clienti che non hanno un saldo attivo, vengono segnalate 
delle promozioni di acquisti delle quali interessano il codice, che le identifica, il 
nome del prodotto, il costo del prodotto, le date di inizio e fine della promozione. 
Per ogni promozione inviata ad un cliente è nota la sua risposta (sì, no).

La compagnia è interessata a due data mart per analizzare gli acquisti dei clienti 
e le risposte alle promozioni. Si mostrano alcuni esempi di analisi:
- Armonizzare totale speso dai clienti per categoria di acquisto, per trimestre 
dell'acquisto e per regione dell'esercente
- Numero medio di acquisti di categoria "articolo da viaggio" dei clienti con 
fascia di reddito da 50 000 e 60 000 in un certo anno, per estratto conto, per 
città dell'esercente.
- Ammontare totale speso in viaggi dai clienti per mese della spesa e per 
provincia dell'esercente.
- Numero di adesioni a promozioni per prodotto e per fascia di reddito del cliente.
- Numero dei clienti con fascia di reddito fra 50 000 e 60 000 che hanno accettato 
una promozione di acquisto di orologi.