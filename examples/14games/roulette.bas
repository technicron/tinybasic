10 REM "ROULETTE"
20 REM "Ported by Stefan in 2022"
30 REM 
40 PRINT "ENTER THE CURRENT DATE (AS IN 'JANUARY 23, 1979') -";
50 INPUT D$,E$
1000 REM "-ROULETTE"
1010 REM "-DAVID JOSLIN"
1020 PRINT "WELCOME TO THE ROULETTE TABLE"
1030 PRINT 
1040 PRINT "DO YOU WANT INSTRUCTIONS";
1050 INPUT Y$
1060 IF Y$(1,1)="N" OR Y$(1,1)="n" THEN 1550
1070 PRINT
1080 PRINT "THIS IS THE BETTING LAYOUT"
1090 PRINT "  (*=RED)"
1100 PRINT 
1110 PRINT " 1*    2     3*"
1120 PRINT " 4     5*    6 "
1130 PRINT " 7*    8     9*"
1140 PRINT "10    11    12*"
1150 PRINT "---------------"
1160 PRINT "13    14*   15 "
1170 PRINT "16*   17    18*"
1180 PRINT "19*   20    21*"
1190 PRINT "22    23*   24 "
1200 PRINT "---------------"
1210 PRINT "25*   26    27*"
1220 PRINT "28    29    30*"
1230 PRINT "31    32*   33 "
1240 PRINT "34*   35    36*"
1250 PRINT "---------------"
1260 PRINT "    00    0    "
1270 PRINT
1280 PRINT "TYPES OF BETS"
1290 PRINT 
1300 PRINT "THE NUMBERS 1 TO 36 SIGNIFY A STRAIGHT BET"
1310 PRINT "ON THAT NUMBER."
1320 PRINT "THESE PAY OFF 35:1"
1330 PRINT 
1340 PRINT "THE 2:1 BETS ARE:"
1350 PRINT " 37) 1-12     40) FIRST COLUMN"
1360 PRINT " 38) 13-24    41) SECOND COLUMN"
1370 PRINT " 39) 25-36    42) THIRD COLUMN"
1380 PRINT 
1390 PRINT "THE EVEN MONEY BETS ARE:"
1400 PRINT " 43) 1-18     46) ODD"
1410 PRINT " 44) 19-36    47) RED"
1420 PRINT " 45) EVEN     48) BLACK"
1430 PRINT 
1440 PRINT " 49)0 AND 50)00 PAY OFF 35:1"
1450 PRINT " NOTE: 0 AND 00 DO NOT COUNT UNDER ANY"
1460 PRINT "       BETS EXCEPT THEIR OWN."
1470 PRINT
1480 PRINT "WHEN I ASK FOR EACH BET, TYPE THE NUMBER"
1490 PRINT "AND THE AMOUNT, SEPARATED BY A COMMA."
1500 PRINT "FOR EXAMPLE: TO BET $500 ON BLACK, TYPE 48,500"
1510 PRINT "WHEN I ASK FOR A BET."
1520 PRINT 
1530 PRINT "THE MINIMUM BET IS $5, THE MAXIMUM IS $500."
1540 PRINT 
1550 REM-PROGRAM BEGINS HERE
1560 REM-TYPE OF BET(NUMBER) ODDS
1570 REM  DON'T NEED TO DIMENSION STRINGS
1580 DIM B(100),C(100),T(100),X(38)
1590 DIM A(50)
1600 FOR I=1 TO 38: X(I)=0: NEXT I: REM  "MAT X=ZER"
1610 P=1000
1620 D=100000.
1630 PRINT "HOW MANY BETS? ";
1640 INPUT Y
1650 IF Y<1 OR Y<>INT(Y) THEN 1630
1660 FOR I=1 TO 50: A(I)=0: NEXT I: REM  MAT A=ZER
1670 FOR C=1 TO Y
1680 PRINT "NUMBER ";C;
1690 INPUT X,Z
1700 B(C)=Z
1710 T(C)=X
1720 IF X<1 OR X>50 OR X<>INT(X) THEN 1680
1730 IF Z<1 OR Z<>INT(Z) THEN 1680
1740 IF Z<5 OR Z>500 THEN 1680
1750 IF A(X)=0 THEN 1780
1760 PRINT "YOU MADE THAT BET ONCE ALREADY,DUM-DUM"
1770 GOTO 1680
1780 A(X)=1
1790 NEXT C
1800 PRINT "SPINNING"
1810 PRINT 
1820 PRINT 
1830 S=INT(RND(1)*100)
1840 IF S=0 OR S>38 THEN 1830
1850 X(S)=X(S)+1
1860 IF S<37 THEN 1920
1870 IF S=37 THEN 1900
1880 PRINT "00"
1890 GOTO 2020
1900 PRINT "0"
1910 GOTO 2020
1920 RESTORE 
1930 FOR I1=1 TO 18
1940 READ R
1950 IF R=S THEN 2000
1960 NEXT I1
1970 A$="BLACK"
1980 PRINT S;A$
1990 GOTO 2020
2000 A$="RED"
2010 GOTO 1980
2020 PRINT
2030 FOR C=1 TO Y
2040 IF T(C)<37 THEN 2710
2050 ON T(C)-36 GOTO 2090,2190,2220,2250,2300,2350,2400,2470,2500
2060 ON T(C)-45 GOTO 2530,2560,2630
2070 GOTO 2710
2080 STOP
2090 REM  1-12(37) 2:1
2100 IF S <= 12 THEN 2150
2110 PRINT "YOU LOSE ";B(C);" DOLLARS ON BET";C
2120 D=D+B(C)
2130 P=P-B(C)
2140 GOTO 2180
2150 PRINT "YOU WIN ";B(C)*2;" DOLLARS ON BET"C
2160 D=D-B(C)*2
2170 P=P+B(C)*2
2180 GOTO 2810
2190 REM  13-24(38) 2:1
2200 IF S>12 AND S<25 THEN 2150
2210 GOTO 2110
2220 REM  25-36(39) 2:1
2230 IF S>24 AND S<37 THEN 2150
2240 GOTO 2110
2250 REM  FIRST COLUMN(40) 2:1
2260 FOR I=1 TO 34 STEP 3
2270 IF S=I THEN 2150
2280 NEXT I
2290 GOTO 2110
2300 REM  SECOND COLUMN(41) 2:1
2310 FOR I=2 TO 35 STEP 3
2320 IF S=I THEN 2150
2330 NEXT I
2340 GOTO 2110
2350 REM  THIRD COLUMN(42) 2:1
2360 FOR I=3 TO 36 STEP 3
2370 IF S=I THEN 2150
2380 NEXT I
2390 GOTO 2110
2400 REM  1-18(43) 1:1
2410 IF S<19 THEN 2430
2420 GOTO 2110
2430 PRINT "YOU WIN ";B(C);" DOLLARS ON BET";C
2440 D=D-B(C)
2450 P=P+B(C)
2460 GOTO 2810
2470 REM  19-36(44) 1:1
2480 IF S<37 AND S>18 THEN 2430
2490 GOTO 2110
2500 REM  EVEN(45) 1:1
2510 IF S/2=INT(S/2) AND S<37 THEN 2430
2520 GOTO 2110
2530 REM  ODD(46) 1:1
2540 IF S/2<>INT(S/2) AND S<37 THEN 2430
2550 GOTO 2110
2560 REM  RED(47) 1:1
2570 RESTORE 
2580 FOR I=1 TO 18
2590 READ R
2600 IF S=R THEN 2430
2610 NEXT I
2620 GOTO 2110
2630 REM  BLACK(48) 1:1
2640 RESTORE 
2650 FOR I=1 TO 18
2660 READ R
2670 IF S=R THEN 2110
2680 NEXT I
2690 IF S>36 THEN 2110
2700 GOTO 2430
2710 REM--1TO36,0,00(1-36,49,50)35:1
2720 IF T(C)<49 THEN 2760
2730 IF T(C)=49 AND S=37 THEN 2780
2740 IF T(C)=50 AND S=38 THEN 2780
2750 GOTO 2110
2760 IF T(C)=S THEN 2780
2770 GOTO 2110
2780 PRINT "YOU WIN ";B(C)*35;" DOLLARS ON BET";C
2790 D=D-B(C)*35
2800 P=P+B(C)*35
2810 NEXT C
2820 PRINT 
2830 PRINT "TOTALS:","ME","YOU"
2840 PRINT " ",D,P
2850 IF P>0 THEN 2880
2860 PRINT "OOPS! YOU JUST SPENT YOUR LAST DOLLAR!"
2870 GOTO 3190
2880 IF D>0 THEN 2920
2890 PRINT "YOU BROKE THE HOUSE!"
2900 P=101000.
2910 GOTO 2960
2920 PRINT "AGAIN";
2930 INPUT Y$
2940 IF LEFT$(Y$,1)="Y" THEN 1630
2950 DATA 1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36
2960 IF P<1 THEN 3190
2970 PRINT "TO WHOM SHALL I MAKE THE CHECK";
2980 INPUT B$
2990 PRINT 
3000 FOR I=1 TO 72: PRINT "-";: NEXT I: REM PRINT 72 DASHES
3010 PRINT TAB(50);"CHECK NO. ";INT(RND(1)*100)
3020 PRINT 
3030 GOSUB 3230
3040 TAB(40): PRINT M$
3050 PRINT 
3060 PRINT 
3070 PRINT "PAY TO THE ORDER OF-----";B$;"-----$ ";
3080 PRINT P
3090 PRINT 
3100 PRINT 
3110 TAB(10): PRINT "THE MEMORY BANK OF NEW YORK"
3120 PRINT 
3130 TAB(40): PRINT "THE COMPUTER"
3140 TAB(40): PRINT "----------X-----"
3150 PRINT 
3160 FOR I=1 TO 62: PRINT "-";: NEXT I
3170 PRINT "COME BACK SOON!"
3180 GOTO 3210
3190 PRINT "THANKS FOR YOUR MONEY."
3200 PRINT "I'LL USE IT TO BUY A SOLID GOLD ROULETTE WHEEL"
3210 PRINT 
3220 GOTO 3420
3230 REM
3240 REM     THIS ROUTINE RETURNS THE CURRENT DATE IN M$
3250 REM     IF YOU HAVE SYSTEM FUNCTIONS TO HANDLE THIS
3260 REM     THEY CAN BE USED HERE.  HOWEVER IN THIS
3270 REM     PROGRAM, WE JUST INPUT THE DATE AT THE START
3280 REM     THE GAME
3290 REM
3300 REM     THE DATE IS RETURNED IN VARIABLE M$
3310 M$=D$+", "+E$
3320 RETURN
3420 END
