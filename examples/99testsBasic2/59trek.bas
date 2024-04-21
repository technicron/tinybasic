   1 REM "IoT BASIC settings for compatibility with Palo Alto TinyBASIC"
   2 SET 12,0: SET 17,1: REM "array limit 0, Boolean true 1"
   3 SET 18,1: SET 19,1: REM "Integer Mode, Random base 1"
   4 REM "Preallocate memory for all variables tp protect @ from being overwritten"
   5 DIM A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
   9 Y=2999 : INPUT "DO YOU WANT A DIFFICULT GAME (Y OR N)? ",A
  10 PRINT "STARDATE 3200:  YOUR MISSION IS ",: IF A=Y THEN Y=999 
  15 K=0:B=0:D=30:FOR I=0 TO 63:J=RND(99)<5:B=B+J
  20 M=RND(Y):M=(M<209)+(M<99)+(M<49)+(M<24)+(M<9)+(M<2):K=K+M
  25 @(I)=-100*M-10*J-RND(8):NEXT I:IF(B<2)+(K<4) GOTO 15
  30 PRINT "TO DESTROY ",#1,K," KLINGONS IN 30 STARDATES." 
  35 PRINT "THERE ARE ",#1,B," STARBASES.":GOSUB 160:C=0:H=K 
  40 U=RND(8):V=RND(8):X=RND(8):Y=RND(8)
  45 FOR I=71 TO 152: @(I)=0: NEXT I :@(8*X+Y+62)=4: M=ABS(@(8*U+V-9)):N=M/100
  50 I=1: IF N THEN FOR J=1 TO N:GOSUB 165: @(J+134)=300: @(J+140)=S: @(J+146)=T: NEXT J
  55 GOSUB 175: M=M-100*N: I=2: IF M/10 GOSUB 165
  60 M=M-M/10*10: I=3: IF M THEN FOR J=1 TO M: GOSUB  165: NEXT J
  65 GOSUB 145: GOSUB 325:IF K GOTO 95
  70 PRINT: PRINT "MISSION ACCOMPLISHED. ": IF D<3 PRINT "BOY, YOU BARELY MADE IT." 
  75 IF D>5 PRINT "GOOD WORK...": IF D>9 PRINT "FANTASTIC! ": IF D>13 PRINT "UNBELIEVABLE!" 
  80 D=30-D: I=H*100/D*10: PRINT #1,H," KLINGONS IN ",D," STARDATES. (",I,")" 
  85 J=100*(C=0)-5*C:PRINT #1,C," CASUALTIES INCURRED. (",J,")" 
  90 PRINT "YOUR SCORE:",I+J:GOTO 110 
  95 IF D<0 PRINT "IT'S TOO LATE, THE FEDERATION HAS BEEN CONQUERED.":GOTO  110 
 100 IF E>=0 GOTO  120
 105 PRINT "ENTERPRISE DESTROYED":IF H-K>9 PRINT " BUT YOU WERE A GOOD MAN"
 110 Y=987: PRINT: INPUT "ANOTHERE GAME (Y OR N)? ",A:IF A=Y GOTO 5 
 115 PRINT "GOOD BYE.": STOP 
 120 S=220: G=180: L=200: P=260: R=420: W=465: T=555: INPUT "CAPTAIN? ",A
 125 IF (A=S)+(A=G)+(A=L)+(A=P)+(A=R)+(A=W)+(A=T) GOTO A
 130 PRINT "R=REPORT       S=SR. SENSOR   L=LR. SENSOR" 
 135 PRINT "G=GALAXY MAP   P=PHASER       T=TORPEDO" 
 140 PRINT "W=WARP ENGINE  **PLEASE USE ONE OF THESE COMMANDS***":GOTO 120 
 145 FOR I=X-(X>1) TO X+(X<8): FOR J=Y-(Y>1) TO Y+(Y<8)
 150 IF @(8*I+J+62)<>2 :NEXT J: NEXT I: O=0: RETURN
 155 IF O=0 PRINT "SULU: CAPTAIN, WE ARE DOCKED AT STARBASE." 
 160 E=4000:F=10:O=1:FOR I=64 TO 70:@(I)=0: NEXT I: RETURN
 165 S=RND(8):T=RND(8):A=8*S+T+62:IF @(A) GOTO 165
 170 @(A)=I: RETURN
 175 PRINT "ENTERPRISE IN Q-",#1,U,V," S-",X,Y: RETURN 
 180 GOSUB 175:J=2:GOSUB 375: IF I GOTO  120
 185 PRINT " OF GALAXY MAP";: FOR I=0 TO 7:PRINT :PRINT #1,I+1,":",:FOR J=0 TO 7:M=@(8*I+J) 
 190 PRINT #6,(M>0)*M,:NEXT J:PRINT :NEXT I:PRINT " ";:FOR I=0 TO 7:PRINT "  ..",:NEXT I:PRINT  
 195 PRINT "    ";:FOR I=1TO8:PRINT #4,I,:NEXT I:PRINT :PRINT :GOTO  120 
 200 GOSUB 175:J=3:GOSUB 375:IF I GOTO 120
 205 PRINT: FOR I=U-1 TO U+1: FOR J=V-1 TO V+1:M=8*I+J-9:A=0 
 210 IF (I>0)*(I<9)*(J>0)*(J<9) THEN A=ABS(@(M)):@(M)=A
 215 PRINT #4,A,:NEXT J:PRINT :NEXT I: GOTO  120 
 220 GOSUB 175: J=1: GOSUB 375: IF I GOTO  120
 225 M=8*U+V-9: @(M)=ABS(@(M))
 230 PRINT: FOR I=1 TO 8: PRINT #1,I,:FOR J=1 TO 8:M=@(8*I+J+62):IF M=0 PRINT " .", 
 235 IF M=1 PRINT " K", 
 240 IF M=2 PRINT " B", 
 245 IF M=3 PRINT " *", 
 250 IF M=4 PRINT " E", 
 255 NEXT J:PRINT: NEXT I: PRINT " ",: FOR I=1TO8: PRINT #2,I,:NEXT I:PRINT:GOTO  120 
 260 J=4:GOSUB 375: IF I GOTO  120
 265 INPUT " ENERGIZED. UNITS TO FIRE? ",A:IF A<1 GOTO 120
 270 IF A>E PRINT "SPOCK: WE HAVE ONLY ",#1,E," UNITS.": GOTO  120 
 275 E=E-A: IF N<1 PRINT "PHASER FIRED AT EMPTY SPACE.": GOTO  65 
 280 A=A/N: FOR M=135 TO 140: IF @(M)=0 GOTO  290
 285 GOSUB 295: PRINT #3,S," UNITS HIT ",:GOSUB 305 
 290 NEXT M: GOTO  65
 295 IF A>1090 PRINT "...OVERLOADED..": J=4: @(67)=1: A=9: GOSUB  375 
 300 I=@(M+6)-X: J=@(M+12)-Y: S=A*30/(30+I*I+J*J)+1: RETURN
 305 PRINT "KLINGON AT S-",#1,@(M+6),@(M+12),:@(M)=@(M)-S 
 310 IF @(M)>0 PRINT " **DAMAGED**": RETURN 
 315 @(M)=0:I=8*U+V-9:J=@(I)/ABS(@(I)):@(I)=@(I)-100*J:K=K-1
 320 I=8*@(M+6)+@(M+12)+62:@(I)=0:N=N-1:PRINT " ***DESTROYED***": RETURN 
 325 IF N=0 RETURN
 330 PRINT "KLINGON ATTACK":IF O THEN PRINT "STARBASE PROTECTS ENTERPRISE": RETURN 
 335 T=0: FOR M=135 TO 140: IF @(M)=0 GOTO 350
 340 A=(@(M)+RND(@(M)))/2:GOSUB 295:T=T+S:I=@(M+6):J=@(M+12)
 345 PRINT #3,S," UNITS HIT FROM KLINGON AT S-",#1,I,J 
 350 NEXT M:E=E-T:IF E<=0 PRINT "*** BANG ***": RETURN
 355 PRINT #1,E," UNITS OF ENERGY LEFT.": IF RND(E/4)>T RETURN 
 360 IF @(70)=0 THEN @(70)=RND(T/50+1): J=7: GOTO 375
 365 J=RND(6): @(J+63)=RND(T/99+1)+@(J+63): I=RND(8)+1: C=C+I
 370 PRINT "MC COY: SICKBAY TO BRIDGE, WE SUFFERED",#2,I," CASUALTIES." 
 375 I=@(J+63): IF J=1 PRINT "SHORT RANGE SENSOR", 
 380 IF J=2 PRINT "COMPUTER DISPLAY", 
 385 IF J=3 PRINT "LONG RANGE SENSOR", 
 390 IF J=4 PRINT "PHASER", 
 395 IF J=5 PRINT "WARP ENGINE", 
 400 IF J=6 PRINT "PHOTON TORPEDO TUBES", 
 405 IF J=7 PRINT "SHIELD", 
 410 IF I=0 RETURN
 415 PRINT " DAMAGED, ",#1,I," STARDATES ESTIMATED FOR REPAIR": RETURN 
 420 PRINT "STATUS REPORT:":PRINT "STARDATE",#10,3230-D:PRINT "TIME LEFT",#7,D 
 425 PRINT "CONDITION     ",:IF O PRINT "DOCKED":GOTO  445 
 430 IF N PRINT "RED": GOTO 445 
 435 IF E<999 PRINT "YELLOW": GOTO 445 
 440 PRINT "GREEN "
 445 PRINT "POSITION      Q-",#1,U,V," S-",X,Y:PRINT "ENERGY",#12,E 
 450 PRINT "TORPEDOES",#7,F:PRINT "KLINGONS LEFT",#3,K:PRINT "STARBASES",#6,B 
 455 FOR J=1 TO 7: IF @(J+63) GOSUB 375
 460 NEXT J:GOTO 120
 465 J=5:GOSUB  375:IF I=0 PRINT  
 470 INPUT "SECTOR DISTANCE? ",W:IF W<1 GOTO  120
 475 IF I*(W>2) THEN PRINT "CHEKOV: WE CAN TRY 2 AT MOST, SIR.":GOTO  470 
 480 IF W>91 THEN W=91:PRINT "SPOCK: ARE YOU SURE, CAPTAIN?" 
 485 IF E<W*W/2 THEN PRINT "SCOTTY: SIR, WE DO NOT HAVE THE ENERGY.":GOTO  120 
 490 GOSUB 615:IF R=0 GOTO  120 
 495 D=D-1:E=E-W*W/2:@(8*X+Y+62)=0 
 500 FOR M=64 TO 70:@(M)=(@(M)-1)*(@(M)>0):NEXT M 
 505 P=45*X+22:G=45*Y+22:W=45*W:FOR M=1TO8:W=W-R:IF W<-22 GOTO 525 
 510 P=P+S: G=G+T: I=P/45: J=G/45: IF(I<1)+(I>8)+(J<1)+(J>8)GOTO 530 
 515 IF @(8*I+J+62)=0 THEN X=I: Y=J: NEXT M 
 520 PRINT "**EMERGENCY STOP**":PRINT " SPOCK: TO ERR IS HUMAN. " 
 525 @(8*X+Y+62)=4:GOSUB 175:GOTO 65 
 530 P=U*72+P/5+W/5*S/R-9: U=P/72: G=V*72+G/5+W/5*T/R-9: V=G/72 
 535 IF RND(9)<2 PRINT "***SPACE STORM***":T=100:GOSUB 360 
 540 IF (U>0)*(U<9)*(V>0)*(V<9)X=(P+9-72*U)/9: Y=(G+9-72*V)/9: GOTO 45 
 545 PRINT "**YOU WANDERED OUTSIDE THE GALAXY** "
 550 PRINT "ON BOARD COMPUTER TAKES OVER, AND SAVED YOUR LIFE": GOTO 40 
 555 J=6: GOSUB  375: IF I GOTO 120 
 560 IF F=0 PRINT " EMPTY": GOTO 120 
 565 PRINT " LOADED": GOSUB 615: IF R=0 GOTO 120 
 570 PRINT "TORPEDO TRACK ",:F=F-1:P=45*X+22:G=45*Y+22:FOR M=1 TO 8 
 575 P=P+S: G=G+T: I=P/45:J=G/45: IF(I<1)+(I>8)+(J<1)+(J>8) GOTO 585 
 580 L=8*I+J+62: W=8*U+V-9: R=@(W)/ABS(@(W)): PRINT #1,I,J," ",:GOTO 585+5*@(L) 
 585 NEXT M:PRINT "...MISSED":GOTO 65 
 590 S=RND(99)+280:FOR M=135 TO 140: IF(@(M+6)=I)*(@(M+12)=J) GOSUB 305
 592 NEXT M:GOTO 65
 595 B=B-1: @(L)=0: @(W)=@(W)-10*R: PRINT "STARBASE DESTROYED"
 597 PRINT "SPOCK: I OFTEN FIND HUMAN BEHAVIOUR FASCINATING. ": GOTO 65 
 600 PRINT "HIT A STAR":IF RND(9)<3 PRINT " TORPEDO ABSORBED":GOTO 65 
 605 @(L)=0:@(W)=@(W)-R:IFRND(9)<6PRINT " STAR DESTROYED":GOTO 65 
 610 T=300:PRINT "HIT NOVAS    ***RADIATION ALARM***":GOSUB 360 :GOTO  65 
 615 INPUT "COURSE (0-360)? ",I:IF(I>360)+(I<0)THEN R=0: RETURN
 620 S=(I+45)/90: I=I-S*90: R=(45+I*I)/110+45: GOTO 625+5*(S<4)*S
 625 S=-45: T=I: RETURN
 630 S=I: T=45: RETURN
 635 S=45: T=-I: RETURN
 640 S=-I: T=-45: RETURN
