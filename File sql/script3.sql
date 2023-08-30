select r1.ref_cv, r2.ref_cv 
from prova2 r1, prova2 r2
where r1.ref_cf=r2.ref_cf and r1.data=r2.data and r1.ref_cv<r2.ref_cv

SELECT *
FROM prova2 p1
WHERE exists (SELECT *
			FROM prova2 p2
			WHERE p1.ref_cf=p2.ref_cf 
            AND p1.data=p2.data 
            AND p1.ref_cv<p2.ref_cv)			
            
SELECT *
FROM prova2 p1
WHERE p1.ref_cv >= all (SELECT p2.ref_cv
			FROM prova2 p2)
			WHERE P1.REF_CF=P2.REF_CF 
            AND P1.DATA=P2.DATA 
            AND P1.REF_CV<P2.REF_CV)

INSERT INTO prova2 values('a',1,10);
INSERT INTO prova2 values('a',1,11);
INSERT INTO prova2 values('b',2,12);
INSERT INTO prova2 values('c',3,13);

select r1.ref_cv, r2.ref_cv
from prova2 r1, prova2 r2
where r1.ref_cf=r2.ref_cf and r1.data=r2.data and r1.ref_cv<r2.ref_cv

select p1.ref_cv
from prova2 p1 
where (p1.ref_cf=p1.ref_cf and p1.data=p1.data)