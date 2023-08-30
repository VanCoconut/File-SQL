create table tecnico(
	CF varchar(20) primary key,
    INDIRIZZO varchar(20),
    QUALIFICA varchar(20) not null,
    COSTO_ORARIO smallint not null);
create table pc(
	CP varchar(20) primary key,
	NOME varchar(20) not null,
    TIPO varchar(20) not null,
    NOME_PROP varchar(20) not null);
    
create table riparazione(
	DATA_RIP varchar(20) ,
    REF_CF varchar(20) references tecnico (cf),
    REF_CP varchar(20) references pc (cp),
    ORE smallint not null
    primary key (DATA_RIP,REF_CF,REF_CP));
    
drop table riparazione
select *
from riparazione
select *
from riparazione
UPDATE riparazione
	SET data_rip='01/01/01'
    WHERE ref_cp = 'b3';

INSERT INTO riparazione values('01/01/01','a1','b1',33);
INSERT INTO riparazione values('01/01/01','a1','b2',33);
INSERT INTO riparazione values('01/01/04','a2','b3',44);
INSERT INTO riparazione values('01/01/05','a3','b4',55);




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

/*4*/
SELECT pc.*
FROM pc, riparazione r
WHERE pc.cp=r.ref_cp AND r.ore>=10

/*5*/
SELECT t.*, r.data_rip
FROM tecnico t, riparazione r
WHERE t.cf=r.ref_cf
GROUP BY r.data_rip
HAVING count(t.cf) >= all (SELECT r.ref_cf
								FROM riparazione r								
								GROUP BY r.data_rip)

/*6*/
SELECT pc.*, t.costo_orario*r.ore AS COSTO_TOT
FROM pc, tecnico t, riparazione r
WHERE t.cf=r.ref_cf 
	AND pc.cp=r.ref_cp 
	AND t.costo_orario*r.ore >= ALL (SELECT t.costo_orario*r.ore 
									FROM tecnico t, riparazione r
									WHERE t.cf=r.ref_cf)


