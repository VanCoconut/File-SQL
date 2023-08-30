INSERT into prodotto values('01', 10);
INSERT into prodotto values('02', 100);
INSERT into prodotto values('03', 1);
INSERT into fornitore values('A1', 'Modena');
INSERT into fornitore values('A2', 'Bressano');
INSERT into fornitore values('A3', 'Treviso');
INSERT into fornisce values('A1', 2021, '03');
INSERT into fornisce values('A2', 2021, '02');
INSERT into fornisce values('A2', 2021, '01');
INSERT into fornisce values('A3', 2021, '01');
INSERT into fornisce values('A1', 1800, '01');
INSERT into fornisce values('A2', 2200, '03');
    
SELECT *
FROM prodotto;

SELECT *
FROM fornisce;


SELECT p.Codice_prodotto, Citta, Prezzo
FROM fornisce f1, fornitore f2, prodotto p
WHERE f1.Anno=2021 AND f1.Codice_fornitore=f2.Codice_fornitore AND f2.Citta='Modena'
 AND f1.Codice_prodotto=p.Codice_prodotto;
