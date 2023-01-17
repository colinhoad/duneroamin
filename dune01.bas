10DIM S(19),R(19),SS(19),SR(19)
20FOR I=1 TO 19
30S(I)=0
40  R(I)=0
50NEXT
60S(0)=23
70R(0)=1
80R=0
90P=0
100T=0.5
110C=0
120A$="L"
130INPUT CC$
140IF CC$="A" THEN CC$=A$ ELSE A$=CC$
150FOR M=1 TO LEN(CC$)
160  C$=MID$(CC$,M,1)
170  IF C$="L" THEN 590
180  IF C$<>"S" THEN 280
190  FOR I=0 TO 19
200    SS(I)=S(I)
210    SR(I)=R(I)
220  NEXT
230  SR=R
240  SP=P
250  ST=T
260  SC=C
270  GOTO 740
280  IF C$<>"R" THEN 380
290  FOR I=0 TO 19
300    S(I)=SS(I)
310    R(I)=SR(I)
320  NEXT
330  R=SR
340  P=SP
350  T=ST
360  C=SC
370  GOTO 590
380  IF C$<>"G" THEN 430
390  IF S(P)=0 OR C=1 THEN 760
400  S(P)=S(P)-1
410  C=1
420  GOTO 680
430  IF C$<>"D" THEN 480
440  IF C=0 THEN 760
450  S(P)=S(P)+1
460  C=0
470  GOTO 740
480  IF C$<>"E" THEN 540
490  IF T<0.2 THEN 760
500  T=T-0.25
510  P=(P+1) MOD 20
520  PRINT"You travel 2000 kms East"
530  GOTO 590
540  IF C$<>"W" THEN 760
550  IF T<0.2 THEN 760
560  T=T-0.25
570  P=(P+19) MOD 20
580  PRINT"You travel 2000 kms West"
590  PRINT"You are ";
600  IF P<10 THEN PRINT; P*2000" kms East";ELSE PRINT; (20-P)*2000" kms West";
610  PRINT" of base."
620  IF S(P)=0 THEN S$="nothing" ELSE S$="a fuel dump"
630  PRINT"You can see ";S$;" and can travel ";(T+C)*8000;" kms"
640  IF R(P)<>0 THEN 680
650  R(P)=1
660  R=R+1
670  IF R=19 THEN PRINT"However you dig around and find the survivor"
680  IF P=0 AND R=19 THEN PRINT"Mission accomplished":END
690  IF S(P)+C+T=0 THEN PRINT"Out of fuel! You are a sandworm sandwich":END
700  IF T>0 OR C=0 THEN 740
710  PRINT"You refill the dune buggy"
720  T=1
730  C=0
740NEXT
750GOTO 130
760PRINT"You can't do that"
770CC$="L"
780GOTO 150