create table quadro(
	CQ varchar(20) PRIMARY KEY ,
    AUTORE varchar(20),
    PERIODO varchar(20)
    )
    
create table mostra(
	CM varchar(20) PRIMARY KEY,
    NOME varchar(20),
    ANNO smallint,
	ORG varchar(20)
    )
    
create table espone(
	REF_CQ varchar(20) REFERENCES QUADRO(CQ),
    REF_CM varchar(20) REFERENCES QUADRO(CM),    
    SALA smallint,	
    PRIMARY KEY (REF_CQ,REF_CM)
    )
    
    
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

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    