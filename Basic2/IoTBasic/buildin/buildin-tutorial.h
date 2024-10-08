const char buildin_pgm1[] PROGMEM = {
"100 REM \"CALCULATING PI FOR HUNDREDS OF DIGITS\"\n"
"110 REM \"THX TO ROSETTACODE.ORG FOR THE BASE OF THE PROGRAM\"\n"
"120 REM \"SHOULD BE A BENCHMARK FOR THE BASIC INTERPRETER/COMPILER\"\n"
"130 REM \"WRITTEN IN 2023 FOR FORUM.CLASSIC-COMPUTING.DE BY PETER DASSOW\"\n"
"135 REM \"Ported to IoT BASIC by Guido Lehwalder\"\n"
"136 REM \"Added some IoT BASIC features - Stefan Lenz, 2023\"\n"
"137 CLS\n"
"140 PRINT \"Calculating Pi as a BASIC benchmark.\"\n"
"150 PRINT \"Enter number of digits: \";\n"
"160 INPUT S$\n"
"170 IF S$=\"\" THEN PRINT \"Nothing done.\": END\n"
"180 N=VAL(S$): IF N<1 THEN PRINT \"Not a valid number.\":  GOTO 150\n"
"190 REM \"N DETERMINES ALSO THE ARRAY (ABOUT 3-4 TIMES BIGGER)\"\n"
"200 LN=INT(10*N/3)+16\n"
"204 REM \"@ is the space on the heap for numbers, reserve 64 bytes\"\n"
"205 IF LN>(@-64) THEN PRINT \"Not enough memory\": GOTO 150\n"
"210 ND=1\n"
"220 SM=MILLIS(1)\n"
"225 REM \"Delete the array if already there\"\n"
"230 IF FIND(A())<>0 THEN CLR A()\n"
"235 REM \"Then redim\"\n"
"240 DIM A(LN)\n"
"250 N9=0\n"
"260 PD=0\n"
"270 REM\n"
"280 FOR J=1 TO LN\n"
"290 A(J)=2\n"
"300 NEXT J\n"
"310 REM \"Use of the modulo operator % speeds things up\"\n"
"320 FOR J=1 TO N\n"
"330 Q=0\n"
"340 FOR I=LN TO 1 STEP -1\n"
"350 X=10*A(I)+Q*I\n"
"360 A(I)=X%(2*I-1)\n"
"370 Q=INT(X/(2*I-1))\n"
"380 NEXT I\n"
"390 A(1)=Q%10\n"
"400 Q=INT(Q/10)\n"
"410 IF Q=9 THEN N9=N9+1:  GOTO 610\n"
"420 IF Q<>10 THEN  GOTO 540\n"
"430 REM \"Q==10\"\n"
"440 D=PD+1:  GOSUB 670\n"
"450 IF N9<=0 THEN  GOTO 500\n"
"460 FOR K=1 TO N9\n"
"470 D=0:  GOSUB 670\n"
"480 NEXT K\n"
"490 REM \"END IF\"\n"
"500 PD=0\n"
"510 N9=0\n"
"520 GOTO 610\n"
"530 REM \"Q<>10\"\n"
"540 D=PD:  GOSUB 670\n"
"550 PD=Q\n"
"560 IF N9=0 THEN  GOTO 610\n"
"570 FOR K=1 TO N9\n"
"580 D=9:  GOSUB 670\n"
"590 NEXT K\n"
"600 N9=0\n"
"610 NEXT J\n"
"620 C$=(\"0\"+PD%10)\n"
"621 PRINT C$\n"
"630 EM=MILLIS(1)-SM\n"
"635 PRINT \"Calculation time \";EM/1000;\" seconds.\"\n"
"640 GOTO 140\n"
"650 REM\n"
"660 REM \"OUTPUT DIGITS\"\n"
"670 C$=(\"0\"+D%10)\n"
"671 IF ND=0 THEN PRINT C$;: RETURN\n"
"680 IF D=0 THEN RETURN\n"
"691 PRINT C$;\".\";\n"
"700 ND=0\n"
"710 RETURN\n"
"\f"
};
const char buildin_pgm1_name[] PROGMEM = "*cpinew2.bas";
const char buildin_pgm2[] PROGMEM = {
"10 REM \"Solves the Euler 9 problem \"\n"
"20 REM \"See https://projecteuler.net/problem=9 for details\"\n"
"30 REM \"with a number theoretical approach\"\n"
"100 PRINT \"Enter the circumference K of a triangle\"\n"
"110 PRINT \"The program finds a pythagorean triangle\"\n"
"120 PRINT \"a^2 + b^2 = c^2\"\n"
"130 INPUT \"K= (0 to end) \",K \n"
"140 IF K=0 THEN END \n"
"150 IF K%2=0 THEN U=K/2: GOTO 200 \n"
"160 PRINT \"K is odd, no solution\": GOTO 130 \n"
"200 REM \"Main Program\"\n"
"210 F=0 \n"
"220 X=SQR(U/2)\n"
"230 FOR I=1 TO X \n"
"240 IF U%I<>0 THEN CONT \n"
"250 FOR J=1 TO I \n"
"260 D=I+J \n"
"270 IF U%D<>0 THEN CONT \n"
"280 IF D%2=0 THEN CONT \n"
"290 R=I: Q=J \n"
"300 GOSUB 800 \n"
"310 IF R<>1 THEN CONT \n"
"320 A=I*I-J*J \n"
"330 B=2*I*J \n"
"340 C=I*I+J*J \n"
"350 PRINT \"Primitive triple\",A ,B, C \n"
"360 PRINT \"Circumference=\",A+B+C \n"
"370 S=K/(A+B+C)\n"
"380 PRINT \"Scale with\",S \n"
"390 PRINT \"Solution \",A*S, B*S, C*S \n"
"400 F=1 \n"
"420 NEXT \n"
"430 NEXT \n"
"440 REM \"All solutions found\"\n"
"450 IF F=0 THEN PRINT \"No solution\"\n"
"460 GOTO 130 \n"
"800 REM \"Find GCD\"\n"
"810 IF R=Q THEN RETURN \n"
"820 IF R>Q THEN R=R-Q \n"
"830 IF Q>R THEN Q=Q-R \n"
"840 GOTO 810 \n"
"\f"
};
const char buildin_pgm2_name[] PROGMEM = "*euler9.bas";
const char buildin_pgm3[] PROGMEM = {
"10 REM \"Calculates the Fibonacci numbers\"\n"
"20 REM \"And the Golden Ratio on an Integer BASIC\"\n"
"200 REM \"Main program\"\n"
"210 N=19\n"
"220 DIM A(N)\n"
"230 A(1)=1\n"
"240 A(2)=1\n"
"250 FOR I=3 TO N\n"
"260 IF A(I)>16000 THEN BREAK\n"
"270 A(I)=A(I-1)+A(I-2)\n"
"280 Q=A(I): D=A(I-1)\n"
"290 PRINT #4;I,Q,D;\n"
"300 GOSUB 500\n"
"310 NEXT\n"
"320 END\n"
"500 REM \"Print a decimal ratio of a fraction\"\n"
"520 Z=INT(Q/D)\n"
"530 PRINT \" \";Z;\".\";\n"
"540 FOR J=1 TO 10\n"
"550 Z=Q%D\n"
"560 Q=Z*10\n"
"570 Z=INT(Q/D)\n"
"580 PRINT Z;\n"
"590 NEXT\n"
"600 PRINT \" \"\n"
"610 RETURN\n"
"\f"
};
const char buildin_pgm3_name[] PROGMEM = "*fibo.bas";
const char buildin_pgm4[] PROGMEM = {
"100 REM \"Calculate the first N prime numbers\"\n"
"110 REM \"and output them!\"\n"
"200 CLR \n"
"210 INPUT \"How many primes (0=stop)? \", N \n"
"220 IF N=0 THEN 500\n"
"230 DIM P(N): P(1)=2: P(2)=3: I=2 \n"
"240 IF I=N THEN 360\n"
"250 K=P(I)\n"
"260 K=K+2 \n"
"270 L=SQR(K)\n"
"280 J=1 \n"
"290 D=P(J)\n"
"310 M=K%D \n"
"320 IF M=0 THEN 260\n"
"330 IF D<L THEN J=J+1: GOTO 290 \n"
"340 I=I+1: P(I)=K \n"
"350 GOTO 240 \n"
"360 PRINT \"The first\",N ,\"primes are:\"\n"
"370 FOR J=1 TO N \n"
"380 PRINT #4,J ,P(J)\n"
"390 NEXT \n"
"400 GOTO 200\n"
"500 END\n"
"\f"
};
const char buildin_pgm4_name[] PROGMEM = "*primes.bas";
const char buildin_pgm5[] PROGMEM = {
"10 REM \"Calculate Factorial and Stirlings function\"\n"
"20 REM \"\"\n"
"100 REM \"Factorial\"\n"
"110 L=20 \n"
"120 DIM F(L)\n"
"130 F(1)=1\n"
"140 FOR I=2 TO L\n"
"150 F(I)=F(I-1)*I \n"
"160 NEXT \n"
"200 REM \"Stirling\"\n"
"210 P1=4*ATAN(1)\n"
"220 DEF FNS(N)=SQR(2*P1*N)*EXP(N*(LOG(N)-1))\n"
"300 REM \"Print table\"\n"
"305 PRINT \"N\";: TAB(4)    \n"
"310 PRINT \"FACT(N)\";: TAB(6)\n"
"315 PRINT \"STIR(N)\";: TAB(6)\n"
"320 PRINT \"Accuracy (%)\"\n"
"330 FOR I=1 TO L\n"
"340 PRINT #4, I, #12, F(I), FNS(I), (F(I)-FNS(I))/F(I)*100\n"
"350 NEXT\n"
"400 END\n"
"\f"
};
const char buildin_pgm5_name[] PROGMEM = "*stir.bas";
const char buildin_pgm6[] PROGMEM = {
"10 REM \"TIC TAC TOE from 101 BASIC games\"\n"
"20 REM \"by David Ahl.\"\n"
"30 REM \"Ported to Stefan's BASIC in 2021\"\n"
"40 REM \"The machine goes first\"\n"
"100 PRINT \"Welcome to tictactoe\"\n"
"110 PRINT \"The game board is numbered:\"\n"
"120 PRINT\n"
"130 PRINT \"1  2  3\"\n"
"140 PRINT \"8  9  4\"\n"
"150 PRINT \"7  6  5\"\n"
"160 PRINT\n"
"200 REM \"Main Program\"\n"
"210 PRINT \"Staring a new game\"\n"
"230 A=9\n"
"240 M=A\n"
"250 GOSUB 800 \n"
"260 P=M\n"
"270 B=P%8+1\n"
"280 M=B\n"
"290 GOSUB 800 \n"
"300 Q=M\n"
"310 IF Q=(B+3)%8+1 GOTO 360\n"
"320 C=(B+3)%8+1\n"
"330 M=C\n"
"340 GOSUB 900 \n"
"350 GOTO 640 \n"
"360 C=(B+1)%8+1\n"
"370 M=C\n"
"380 GOSUB 800 \n"
"390 R=M\n"
"400 IF R=(C+3)%8+1 GOTO 450\n"
"410 D=(C+3)%8+1\n"
"420 M=D\n"
"430 GOSUB 900\n"
"440 GOTO 640 \n"
"450 IF P%2<>0 GOTO 500\n"
"460 D=(C+6)%8+1\n"
"470 M=D\n"
"480 GOSUB 900\n"
"490 GOTO 640 \n"
"500 D=(C+2)%8+1\n"
"510 M=D\n"
"520 GOSUB 800 \n"
"530 S=M\n"
"540 IF S=(D+3)%8+1 GOTO 590\n"
"550 E=(D+3)%8+1\n"
"560 M=E\n"
"570 GOSUB 900\n"
"580 REM \"Game is a draw\"\n"
"590 E=(D+5)%8+1\n"
"600 M=E\n"
"610 GOSUB 900\n"
"620 PRINT \"The game is a draw.\"\n"
"630 GOTO 200\n"
"640 PRINT \"and wins!  ********\"\n"
"650 GOTO 200\n"
"800 REM \"Subroutine to ask user for the move\"\n"
"810 GOSUB 900\n"
"820 INPUT \"Your move? \", M\n"
"830 RETURN\n"
"900 REM \"Subroutine to display move\"\n"
"910 PRINT \"Computer moves:\",M\n"
"920 RETURN\n"
"\f"
};
const char buildin_pgm6_name[] PROGMEM = "*tictac.bas";
const char* const buildin_programs[] PROGMEM = {
buildin_pgm1,
buildin_pgm2,
buildin_pgm3,
buildin_pgm4,
buildin_pgm5,
buildin_pgm6,
0
};
const char* const buildin_program_names[] PROGMEM = {
buildin_pgm1_name,
buildin_pgm2_name,
buildin_pgm3_name,
buildin_pgm4_name,
buildin_pgm5_name,
buildin_pgm6_name,
0
};
