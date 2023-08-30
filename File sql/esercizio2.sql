/*1*/
SELECT p.Codice_prodotto, Citta, Prezzo
FROM fornisce f1, fornitore f2, prodotto p
WHERE f1.Anno=2021 AND f1.Codice_fornitore=f2.Codice_fornitore AND f2.Citta='Modena'
 AND f1.Codice_prodotto=p.Codice_prodotto;

/*2*/
SELECT Anno, sum(Qty) as Totale
FROM fornisce f1, fornitore f2
WHERE f1.Codice_fornitore=f2.Codice_fornitore AND f2.Citta='Modena'
GROUP BY anno
;

/*4*/
SELECT p.Codice_prodotto, prezzo
FROM fornisce f1, prodotto p
WHERE f1.Codice_prodotto=p.Codice_prodotto AND p.Codice_prodotto NOT IN (SELECT f1.Codice_prodotto
                            FROM fornisce f1, fornitore f2
                            WHERE f2.Codice_fornitore=f1.Codice_fornitore AND
                            f2.Citta='Modena');
                            
                            
select Codice_prodotto
FROM prodotto
WHERE Codice_prodotto='01';

select *
FROM fornisce, fornitore;
WHERE fornisce.Codice_fornitore=fornitore.Codice_fornitore;

alter table fornisce
	add column Qty smallint
;

UPDATE fornisce
	SET Qty = 50
    WHERE anno=2200;

INSERT INTO prova1 values(1,'n');
INSERT INTO prova1 values(2,'n');
INSERT INTO prova1 values(3,'n');
INSERT INTO prova1 values(4,'m');

SELECT *
FROM prova1
WHERE COD='m'
;