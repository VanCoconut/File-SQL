ATTORI(COD,NOME,ANNO,NAZIONE)
RECITA(COD_ATTORE,COD_FILM)
FILM(COD,TITOLO,ANNO,NAZIONE,REGISTA,GENERE)
PROIEZIONI(COD,COD_FILM,COD_SALA,INCASSO,DATA_P)
SALE(COD,POSTI,NOME,CITTA)


SELECT S.NOME, SUM(P.INCASSI)
FROM SALA S, PROIEZIONE P
WHERE S.COD=P.COD-SAL AND SALA.CITTA='PISA' AND P.DATA_=''
GROUP BY S.NOME
HAVING SUM(P.INCASSI)>2000


SELECT F.NOME
FROM FILM F
WHERE NOT EXISTS (
					SELECT *
					FROM PROIEZIONI P, SALA S
					WHERE F.COD=P.COD_FILM AND P.COD_SALA=S.COD AND S.CITTA= 'PISA'
                    
                    
SELECT F.NOME
FROM FILM F, PROIETTATI P 
WHERE NOT EXISTS (SELECT *
				  FROM PROIEZIONI P, SALA S
				  WHERE F.COD=P.COD_FILM AND P.COD_SALA=S.COD AND S.CITTA<> 'PISA')
                  
SELECT F.NOME
FROM FILM F, PROIETTATI P 
WHERE 
GROUP BY F.NOME
HAVING P.INCASSO >500


SELECT F.NOME
FROM FILM F, PROIETTATI P 
WHERE NOT EXISTS (SELECT *
				  FROM PROIEZIONI P
				  WHERE F.COD=P.COD_FILM AND P.INCASSI>500)

                    
                    
                    
                    

Impiegato(Matricola, Nome, Cognome, Dipartimento, Stipendio)
Lavora(Matricola, PIVA, DataInizio,DataFine)
Azienda(PIVA, Citta, Nazione)

/*Trovare la matricola degli impiegati che hanno lavorato in almeno due città differenti.*/

SELECT  I.MATRICOLA
FROM IMPIEGAYO I
WHERE EXISTS (SELECT *
				FROM LAVORA L, AZIENDA A1, AZIENDA A2
				WHERE L.MATRICOLA=I.MATRICOLA AND A1.CITTA<>A2.CITTA)
                
SELECT  I.MATRICOLA
FROM IMPIEGAYO I, LAVORA L
WHERE I.MATRICOLA=L.MATRICOLA AND EXISTS (SELECT *
				FROM LAVORA L1, AZIENDA A1
				WHERE L1.MATRICOLA=I.MATRICOLA AND L1.PIVA=A1.PIVA AND A1.CITTA<>ALL (SELECT A2.CITTA
																FROM AZIENDA A2, LAVORA L2
                                                                WHERE L2.PIVA=A2.PIVA AND L2.MATRICOLA=I.MATRICOLA)


/*Trovare il dipartimento che paga l’importo totale massimo per gli stipendi dei propri impiegati*/

SELECT  I.DIPARTIMENTO, SUM(I.STIPENDIO)
FROM IMPIEGATO I
GROUP BY I.DIPARTIMENTO
HAVING SUM(I.STIPEDIO) >= ALL (SELECT SUM(I.STIPENDIO)
								FROM IMPIEGATO I
                                GROUP BY I.DIPARTIMETO)
                                
/*Trovare il nome e il cognome degli impiegati che hanno lavorato solo in aziende non italiane.*/

SELECT I.NOME, I.COGNOME
FROM IMPIEGATO I, LAVORA L1
WHERE I.MATRICOLA=L1.MATRICOLA NOT EXISTS (SELECT *
											FROM LAVORA L2, AZIENDA A
											WHERE L2.MATRICOLA=I.MATRICOLA AND L.PIVA=A.PIVA AND A.NAZIONE='ITALIA')
                                            
                                            
                                            
CAVALLO(#Ca, Nome, Sesso, Padre, Madre, Anno)
IPPODROMO(#Ip, Nome, Città)
CORSA(#Co, Nome, Ippodromo, Distanza)
ARRIVO(Corsa, Anno, Cavallo, Posizione)

/* I NOMI di tutti i cavalli che hanno vinto almeno una corsa a Roma.*/

SELECT C.NOME 
FROM CAVALLO C, CORSA C, ARRIVO A, IPPODROMO I
WHERE C.CA=A.CAVALLO AND CORSA.CO=A.CORSA AND A.POSIZIONE=1 AND I.CITTA='ROMA' AND I.IP=C.IPPODROMO

/*I nomi di tutti i cavalli maschi che non hanno sorelle né sorellastre.*/

SELECT C.NOME
FROM CAVALLO C1
WHERE C.SESSO='MASCHIO' AND NOT EXISTS (SELECT *
				  FROM CAVALLO C2
                  WHERE C1.NOME<>C2.NOME AND C2.SESSO='F' AND C2.PADRE=C1.PADRE AND C2.MADRE=C1.MADRE)
                  
COMPUTER(MatricolaPC, Marca, AnnoProduzione, RAM, tipologia)
DIPENDENTE(MatricolaDip, MatricolaPC)

/*Scrivere un’interrogazione SQL che restituisce il numero totale di computer dotati del quantitativo
massimo di RAM, prodotti dal 1999 in poi.*/

SELECT COUNT(*)
FROM COMPUTER C1
WHERE C.ANNO=1999 AND C1.RAM= ( SELECT MAX(RAM)
								FROM COMPUTER C2
								WHERE C2.ANNO=1999)
                                
/*Scrivere un’interrogazione SQL che restituisca la matricola degli impiegati che hanno lavorato solo su
computer di tipologia diversa da “server”.*/

SELECT D.MATRICOLA 
FROM DIPENDENTE D
WHERE NOT EXISTS (SELECT *
				  FROM COUMPUTER C
				  WHERE C.TIPOLOGIA='SERVER' AND C.MATRICOLA=D.MATRICOLA_PC)


Palestra(Codice, Sport, Anno, Incasso)
Dove(Codice, Città)

/*Per ogni palestra di Pisa e per ogni anno, calcolare in quali sport la 
palestra ha ottenuto in quell’anno un incasso maggiore di 10.000 euro.*/


SELECT  D.CITTA, P.ANNO
FROM PALESTRA P, DOVE D
WHERE P.CODICE=D.CODICE AND D.CITTA='PISA'
GROUP BY D.CITTA, P.ANNO
HAVING SUM(P.INCASSO) >= 10000 

/*Calcolare gli sport per i quali tutti gli incassi maggiori di 0 relativi al 2010 sono stati ottenuti da
palestre di una sola città.*/

SELECT  D.CITTA, P.ANNO
FROM PALESTRA P, DOVE D
WHERE P.CODICE=D.CODICE AND NOT EXIST(SELECT  D.CITTA, P.ANNO
						FROM  DOVE D2,
						WHERE P.CODICE=D.CODICE






                                