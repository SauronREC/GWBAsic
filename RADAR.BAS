10 SCREEN 9,0,0,0
15 CLS
20 REM Dibuja el Circulo y la linea del radar
30 CIRCLE (320,170),160,14,,,1
45 PAINT(320,170),2,14
50 REM movimiento del radar
60 X=560:Y=170
100 GOSUB 1000
101 IF SW=0 THEN GOSUB 2000
102 GOSUB 3000
103 A$=INKEY$
104 IF A$="Q" THEN END
110 GOTO 100
1000 REM LINE (320,170)-(X,Y),2
1005 LINE(320,170)-(320+150*COS(A),170+150*SIN(A)),2
1010 REM trazamos las cordenadas de un circulo usando el seno y el coseno
1020 A=A+.005
1030 LINE(320,170)-(320+150*COS(A),170+150*SIN(A)),15
1031 REM FOR B=1 TO 600:NEXT B
1040 IF A>=6.3 THEN A=0:F=0
1050 RETURN
2000 REM donde esta el avion?
2001 SW=1
2010 RANDOMIZE TIME
2015 MOV=1
2020 XA=INT(RND(TIME)*319)+1
2030 YA=INT(RND(TIME)*169)+1
2035 DI=INT(RND(TIME)*2)+1
2036 REM DI=1 IZQ-DER
2037 REM DI=2 DER-IZQ
2040 REM PSET (XA,YA),15
2050 RETURN
3000 REM movimiento del avion
3001 IF POINT(XA,YA)=14 THEN MOV=.05
3002 IF POINT(XA,YA)=14 AND POINT(XA+1,YA)=2 THEN SW=1
3003 IF SW=1 THEN SW=0:GOSUB 2000
3010 IF DI=1 THEN XA=XA+MOV
3020 IF DI=2 THEN XA=XA-MOV
3030 IF XA>=639 THEN XA=0
3040 IF XA<=1 THEN XA=640
3045 REM PSET(XA-1,YA),15
3050 IF POINT(XA,YA)=15 THEN GOSUB 4000
3055 IF POINT(XA,YA)=15 THEN GOSUB 2000
3060 RETURN
4000 REM deteccion avion
4005 O=210
4010 FOR R=1 TO 10
4020   CIRCLE(XA,YA),R,10
4025   LINE(320,170)-(320+150*COS(A),170+150*SIN(A)),15
4026   O=O+10
4027   SOUND O,.1
4028   SOUND 1000-O,.2
4030 NEXT R
4035 O=210
4040 FOR R=1 TO 10
4050   CIRCLE(XA,YA),R,2
4055   LINE(320,170)-(320+150*COS(A),170+150*SIN(A)),15
4056   O=O+10
4057   SOUND O,.1
4058   SOUND 1000-O,.2
4060 NEXT R
4070 RETURN