/* PROGRAM 1:- */

DECLARE
	 year NUMBER(4);
BEGIN
	 DBMS_OUTPUT.PUT_LINE  ('Enter a year'); 
	 year:= &year;
	 IF (MOD (year,400) = 0) THEN 
		 DBMS_OUTPUT.PUT_LINE ('The given year is leap year'); 
	 ELSIF (MOD (year ,100) <> 0  AND  MOD (year , 4)= 0 )THEN 
		 DBMS_OUTPUT.PUT_LINE ('The given year is also leap year'); 
	 ELSE 
		 DBMS_OUTPUT.PUT_LINE ('The given year is not leap year'); 
	END IF;
 
	END;
/

/* PROGRAM 2:- */

DECLARE
	len number;
       	s1 varchar2(20) := '&s1';
       	s2 varchar2(20);
BEGIN
       	len := length(s1);
       	for i in REVERSE 1..len loop
       	s2 := s2||substr(s1,i,1);
       	END loop;

       	IF s2= s1 THEN
       		DBMS_OUTPUT.PUT_LINE('Given String is a PALINDROME');
       	ELSE
       		DBMS_OUTPUT.PUT_LINE('Given String  is not a PALINDROME');
       	END IF;
       	END;
/

/* PROGRAM 3:- */

DECLARE
	y number:=&y;
	x number;
	z number;	
	s number:=0;

 BEGIN
 	DBMS_OUTPUT.PUT_LINE('YOU HAVE ENTERED '||y);
	x:=y;
	while x!=0 loop
		z:=mod(x,10);
		s:=s+power(z,3);
		x:=trunc(x/10);
	END loop;
	if (s=y) then
		DBMS_OUTPUT.PUT_LINE(' Is an Armstrong Number.');
	ELSE
		DBMS_OUTPUT.PUT_LINE(' Is not an Armstrong Number.');
	END IF;
	END;
/

/* PROGRAM 4:- */

DECLARE
	y number:=&y;
	x number:=&x;
	z number:=&z;
	a number;
	b number;
	r number;

BEGIN
	IF (y>x) THEN
		a:=y;
		b:=x;
	ELSE
		a:=x;
		b:=y;
	END IF;
	WHILE mod(a,b) <>0 loop
		r:=mod(a,b);
		a:=b;
		b:=r;
	END loop;
		x:=b;
		y:=z;
	
		DBMS_OUTPUT.PUT_LINE('GCD of three number is '||r);
	END;
/

/* PROGRAM 5:- */

DECLARE
	A INTEGER;
	B INTEGER;
	C INTEGER;
	I INTEGER;
	LCM INTEGER;
	RES INTEGER;
BEGIN
	A:=&A;
	B:=&B;
	C:=&C;
	I:=1;
	WHILE(I<=A*B*C)	
	LOOP
		IF((MOD(I,A)=0) AND (MOD(I,B)=0) AND (MOD(I,C)=0)) THEN
			DBMS_OUTPUT.PUT_LINE('THE LCM IS ');
			DBMS_OUTPUT.PUT_LINE(I);		
			EXIT;
		ELSE
			I:=I+1;	
		END IF;
	END LOOP;
END;
/	

/* PROGRAM 6:- */

DECLARE 
	ACC_NO VARCHAR2(10);
	AMOUNT NUMBER(8,2);
BEGIN
	ACC_NO :=&ACC_NO;
	SELECT AMT INTO AMOUNT FROM DEPOSIT WHERE ACT_NO=ACC_NO;
	IF (AMOUNT >5000) THEN
		UPDATE DEPOSIT SET AMT=(AMT+2000) 
		WHERE ACT_NO = ACC_NO;			
	END IF;
END;
/

/* PROGRAM 7:-  (a)*/

CREATE TABLE EMP(CODE VARCHAR2(5),NAME VARCHAR2(12),SALARY NUMBER(6,2));
INSERT INTO EMP
VALUES('MH145','MAHI',4000.00);
INSERT INTO EMP
VALUES('SU246','SUSHMITA',7000.00);
INSERT INTO EMP
VALUES('SU890','SUJIT',9000.00);
INSERT INTO EMP
VALUES('AB128','ABHISHEK',1000.00);

DECLARE
	ENAME VARCHAR2(12);
	ECODE VARCHAR2(5);
BEGIN
	ECODE :=&ECODE;
	SELECT NAME INTO ENAME 
	FROM EMP WHERE CODE=ECODE;
	DBMS_OUTPUT.PUT_LINE('NAME OF THE EMPLOYEE IS '||ENAME);	
END;
/

/* PROGRAM 7:-  (b)*/

DECLARE
	ENAME VARCHAR2(13);
	NEWCODE VARCHAR2(5);
	NEWNAME VARCHAR2(12);
	NEWSAL NUMBER(6,2);
BEGIN
	NEWCODE :='&NEWCODE';
	NEWNAME := '&NEWNAME;
	NEWSAL :='&NEWSAL';
	SELECT NAME INTO ENAME FROM EMP
		WHERE CODE = NEWCODE;
	DBMS_OUTPUT.PUT_LINE('DUPLICATE CODE IS NOT ALLOWED '||ENAME);	
	EXCEPTION
		WHEB NO_DATA _FOUND THEN
		INSERT INTO EMP 
		VALUES (NEWCODE, NEWNAME, NEWSAL);
END;
/

/* PROGRAM 8:- */

 DECLARE
	BRANCH VARCHAR2(4) :='&BRANCH';	
 BEGIN
 	DELETE FROM BORROW
	WHERE BRANCH LIKE B_NAME;
	DBMS_OUTPUT.PUT_LINE('Number of Rows Deleted: '||sql%rowcount);
END;
/