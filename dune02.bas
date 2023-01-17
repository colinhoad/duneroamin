10DIM S(19),R(19),SS(19),SR(19)
20MODE 3
30FOR I=1 TO 19
40S(I)=0
50  R(I)=0
60NEXT
70S(0)=23
80R(0)=1
90R=0
100P=0
110T=0.5
120C=0
130A$="L"
140PRINT"Duneroamin (aka Canoworms)"
150PRINT"Written by 'Alice'"
160PRINT"Micro User Vol. 3 No. 1 - March 1985"
170PRINT"------------------------------------"
180PRINT"You must rescue the sole survivor of a ship that"
190PRINT"has crash landed on the planetary surface somewhere"
200PRINT"along the 40,000km equator. Your dune buggy can move"
210PRINT"2,000km East or West at a time. There are 23 fuel dumps"
220PRINT"at Base and you can carry one in addition to your fuel"
230PRINT"tank, which holds 8,000km of fuel when full. You must"
240PRINT"plot a course to the survivor leaving sufficient fuel"
250PRINT"dumps along the way to enable a safe return to Base."
260PRINT"If you run out of fuel away from Base, you will be"
270PRINT"eaten by sandworms! Good luck, Commander."
280PRINT
290PRINT"You can travel (W)est or (E)ast"
300PRINT"You can (G)et or (D)rop a fuel tank"
310PRINT"You can (L)ook at your current position"
320PRINT"You can (S)ave or (R)estore your position"
330PRINT"Commands can be written consecutively on one line"
340PRINT"You can repeat a line of commands (A)gain"
350PRINT
360PRINT"What do you wish to do next..."
370INPUT CC$
380IF CC$="A" THEN CC$=A$ ELSE A$=CC$
390FOR M=1 TO LEN(CC$)
400  C$=MID$(CC$,M,1)
410  IF C$="L" THEN 830
420  IF C$<>"S" THEN 520
430  FOR I=0 TO 19
440    SS(I)=S(I)
450    SR(I)=R(I)
460  NEXT
470  SR=R
480  SP=P
490  ST=T
500  SC=C
510  GOTO 980
520  IF C$<>"R" THEN 620
530  FOR I=0 TO 19
540    S(I)=SS(I)
550    R(I)=SR(I)
560  NEXT
570  R=SR
580  P=SP
590  T=ST
600  C=SC
610  GOTO 830
620  IF C$<>"G" THEN 670
630  IF S(P)=0 OR C=1 THEN 1000
640  S(P)=S(P)-1
650  C=1
660  GOTO 920
670  IF C$<>"D" THEN 720
680  IF C=0 THEN 1000
690  S(P)=S(P)+1
700  C=0
710  GOTO 980
720  IF C$<>"E" THEN 780
730  IF T<0.2 THEN 1000
740  T=T-0.25
750  P=(P+1) MOD 20
760  PRINT"You travel 2000 kms East"
770  GOTO 830
780  IF C$<>"W" THEN 1000
790  IF T<0.2 THEN 1000
800  T=T-0.25
810  P=(P+19) MOD 20
820  PRINT"You travel 2000 kms West"
830  PRINT"You are ";
840  IF P<10 THEN PRINT; P*2000" kms East";ELSE PRINT; (20-P)*2000" kms West";
850  PRINT" of base."
860  IF S(P)=0 THEN S$="nothing" ELSE IF S(P)=1 THEN S$="a fuel dump" ELSE S$=STR$(S(P))+" fuel dumps"
870  PRINT"You can see ";S$;" and can travel ";(T+C)*8000;" kms"
880  IF R(P)<>0 THEN 920
890  R(P)=1
900  R=R+1
910  IF R=19 THEN PRINT"However you dig around and find the survivor"
920  IF P=0 AND R=19 THEN PRINT"Mission accomplished":END
930  IF S(P)+C+T=0 THEN PRINT"Out of fuel! You are a sandworm sandwich":END
940  IF T>0 OR C=0 THEN 980
950  PRINT"You refill the dune buggy"
960  T=1
970  C=0
980NEXT
990GOTO 370
1000PRINT"You can't do that"
1010CC$="L"
1020GOTO 390