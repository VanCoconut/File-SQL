/*1*/
SELECT pc.*
FROM pc, riparazione r
WHERE pc.cp=r.ref_cp and pc.nome='Apple' and r.data_rip>='01/01/01' and r.data_rip<='01/01/05'

/*2*/
SELECT t.*
FROM pc, riparazione r, tecnico t
WHERE pc.cp=r.ref_cp and pc.nome='Apple' and t.cf=r.ref_cf 

/*3*/
select r1.ref_cp,r2.ref_cp
from riparazione r1, riparazione r2
where r1.ref_cf=r2.ref_cf and r1.data_rip=r2.data_rip and r1.ref_cp<r2.ref_cp

/*4 CON PASSAGGIO DI PARAMETRI*/
SELECT pc.*
FROM pc
WHERE 10<= (SELECT SUM(ORE)
			FROM riparazione r
			WHERE r.ref_cp=pc.cp)

/*4 CON GROUP BY*/
SELECT PC.CP, pc.nome
FROM pc, riparazione r
WHERE pc.cp=r.ref_cp
GROUP BY pc.cp, pc.nome
HAVING SUM(R.ORE)>=10 

/*5*/
SELECT r1.data_rip,t1.qualifica, t1.cf
FROM tecnico t1, riparazione r1
WHERE t1.cf=r1.ref_cf
GROUP BY r1.data_rip, t1.qualifica, t1.cf
HAVING count(*) >= all (SELECT count(*)
								FROM riparazione r2	
                                WHERE r2.data_rip=r1.data_rip
								GROUP BY r2.ref_cf)

/*6*/
SELECT pc.cp, pc.nome, SUM(ORE*COSTO_ORARIO) as COSTO
FROM pc, tecnico t1, riparazione r1
WHERE t1.cf=r1.ref_cf AND r1.ref_cp=pc.cp
GROUP BY pc.cp, pc.nome
HAVING SUM(ORE*COSTO_ORARIO) >= ALL (SELECT SUM(ORE*COSTO_ORARIO) 
									FROM tecnico t2, riparazione r2						
									WHERE t2.cf=r2.ref_cf
                                    GROUP BY r2.ref_cp)