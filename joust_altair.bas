10 PRINT TAB(26);"JOUST"
20 PRINT TAB(20);"CREATIVE COMPUTING"
30 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
40 PRINT:PRINT:PRINT
100 INPUT"WHAT IS YOUR NAME, PLEASE";A$
120 PRINT"SIR ";A$;", YOU ARE A MEDIEVAL KNIGHT IN A JOUSTING TOURNAMENT."
121 PRINT"THE PRIZE TO THE WINNER IS THE PRINCESS' HAND IN MARRIAGE."
122 PRINT "TO WIN, YOU MUST BEAT FOUR OTHER KNIGHTS."
125 PRINT "TO JOUST, YOU PICK AN AIMING POINT FOR THE LANCE,"
128 PRINT "AND THEN ONE OF FROM 3 TO 6 DIFFERENT POSSIBLE DEFENSE POSITIONS."
130 PRINT "THE AIMING POINTS ARE:"
150 PRINT "1- HELM"
200 PRINT "2- UPPER LEFT (OF SHIELD)"
250 PRINT "3- UPPER MIDDLE"
300 PRINT "4- UPPER RIGHT"
350 PRINT "5- LOWER LEFT"
400 PRINT "6- LOWER MIDDLE"
450 PRINT "7- LOWER RIGHT"
500 PRINT "8- BASE OF SHIELD"
520 PRINT
530 PRINT "IF YOU BREAK A LANCE OR LOSE A HELM, YOU WILL BE GIVEN ANOTHER."
550 PRINT "GOOD LUCK, SIR!"
555 PRINT
600 FOR A = 1 TO 4
650 ON A GOTO 800, 950, 1100, 1250
700 REM OFF YOU GO TO THE FOUR JOUSTS.
750 REM ------------------------------
800 PRINT "THIS IS YOUR FIRST JOUST. YOU ARE UP AGAINST THE GOLD KNIGHT."
850 GOTO 1400
950 PRINT "THIS IS YOUR SECOND JOUST. YOUR OPPONENT IS THE SILVER KNIGHT."
1000 GOTO 1400
1100 PRINT "YOU ARE DOING WELL! YOUR THIRD JOUST IS AGAINST THE RED KNIGHT."
1150 GOTO 1400
1250 PRINT "THIS IS YOUR FINAL TEST!! IF YOU WIN THIS ONE THE PRINCESS"
1270 PRINT "IS YOURS!!! THIS FIGHT IS AGAINST THE FIERCE BLACK KNIGHT!!!!"
1400 INPUT "YOUR AIMING POINT(1-8)";B
1450 IF B <1 OR B>8 THEN 1400
1470 PRINT "YOU MAY USE ONE OF THESE DEFENSES:"
1500 ON B GOTO 1550, 1650, 1750, 1850, 1550, 1750, 1550, 1950
1550 PRINT " 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW."
1600 GOTO 2000
1650 PRINT " 3-LEFT LEAN, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW."
1700 GOTO 2000
1750 PRINT " 1-LOWER HELM, 2-RIGHT LEAN, 3-LEFT LEAN, 4-STEADY SEAT, "
1755 PRINT " 5-SHIELD HIGH, 6-SHIELD LOW."
1800 GOTO 2000
1850 PRINT " 2-RIGHT LEAN, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW."
1900 GOTO 2000
1950 PRINT " 1-LOWER HELM, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW."
2000 INPUT "WHAT IS YOUR CHOICE"; C
2050 D = INT(RND(1)*8) + 1
2100 ON D GOTO 2150, 2200, 2250, 2300, 2350, 2400, 2450, 2500

2150 ON C GOTO 2600, 2600, 2600, 2700, 2800, 2600
2200 ON C GOTO 2800, 2750, 2600, 2750, 2750, 2600
2250 ON C GOTO 2850, 2800, 2650, 2750, 2950, 2900
2300 ON C GOTO 2650, 2600, 2750, 2650, 2650, 2800
2350 ON C GOTO 2750, 2950, 2600, 2750, 2600, 2750
2400 ON C GOTO 2950, 2650, 2750, 2950, 2850, 2750
2450 ON C GOTO 2650, 2600, 2950, 2650, 2650, 2650
2500 ON C GOTO 2750, 2650, 2850, 2750, 2850, 2750
2600 PRINT "HE MISSED YOU!":S=0:GOTO 3000
2650 PRINT "HE HIT YOUR SHIELD BUT IT GLANCED OFF.":S=0:GOTO 3000
2700 PRINT "HE KNOCKED OFF YOUR HELM!":S=0:GOTO 3000
2750 PRINT "HE BROKE HIS LANCE.":S=0:GOTO 3000
2800 PRINT "HE HAS UNSEATED YOU(THUD!)":S=5:GOTO 3000
2850 PRINT "HE HAS BROKEN HIS LANCE, INJURED AND UNSEATED YOU (OUCH!)"
2855 S=5:GOTO 3000
2900 PRINT "HE HAS INJURED AND UNSEATED YOU (CRASH!)":S=5:GOTO 3000
2950 PRINT "HE HAS BROKEN HIS LANCE AND UNSEATED YOU (CLANG! )":S=5
3000 E = INT(RND(1)*6) + 1
3050 ON D GOTO 3100,3150,3200,3250,3100,3200,3100,3300
3100 IF E<4 THEN 3000 :If E > 3 Then 3350
3150 IF E<3 THEN 3000 :If E > 2 Then 3350
3200 GOTO 3350
3250 IF E=1 Or E=3 THEN 3000: If E <> 1 Or E <> 3 Then 3350
3300 IF E = 2 OR E = 3 THEN 3000
3350 ON E GOTO 3400, 3450, 3500, 3550, 3600, 3650
3400 ON B GOTO 3700, 3900, 3950, 3750, 3850, 4050, 3750, 3850
3450 ON B GOTO 3700, 3850, 3900, 3700, 4050, 3750, 3700, 3750
3500 ON B GOTO 3700, 3700, 3750, 3850, 3700, 3850, 4050, 3900
3550 ON B GOTO 3800, 3850, 3850, 3750, 3850, 4050, 3750, 3850
3600 ON B GOTO 3900, 3850, 4050, 3750, 3700, 3950, 3750, 3950
3650 ON B GOTO 3700, 3700, 4000, 3900, 3850, 3850, 3750, 3850
3700 PRINT "YOU MISSED HIM (HISS!)":T=O:GOTO 4100
3750 PRINT "YOU HIT HIS SHIELD BUT GLANCED OFF.":T=0:GOTO 4100
3800 PRINT "YOU KNOCKED OFF HIS HELM!(CHEERS!)":T=0:GOTO 4100
3850 PRINT "YOU BROKE YOUR LANCE(CRACK...)":T=0:GOTO 4100
3900 PRINT "YOU UNSEATED HIM (LOUD CHEERS AND HUZZAHS!!)":T=5:GOTO 4100
3950 PRINT "YOU BROKE YOUR LANCE, BUT UNSEATED AND INJURED YOUR FOE."
3955 T=5:GOTO 4100
4000 PRINT "YOU INJURED AND UNSEATED YOUR OPPONENT.":T=5:GOTO 4100
4050 PRINT "YOU BROKE YOUR LANCE BUT UNSEATED YOUR OPPONENT.":T=5:GOTO 4100
4100 IF S = T And S = 0 THEN 4450
4150 IF S = T THEN GOTO 4400
4200 IF S<T THEN GOTO 4300
4250 IF S>T THEN GOTO 4350
4300 PRINT "YOU HAVE WON THIS JOUST.":PRINT:GOTO 4320
4320 NEXT A
4330 GOTO 4550
4350 PRINT "TOO BAD, YOU LOST. HOPE YOUR INSURANCE WAS PAID UP.":GOTO 4500
4400 PRINT "TOO BAD, YOU BOTH LOST. AT LEAST YOUR HONOR IS INTACT.":GOTO 4500
4450 PRINT "YOU ARE NOW READY TO TRY AGAIN.":GOTO 1400
4500 PRINT "SORRY, BETTER LUCK NEXT JOUST.":GOTO 9999
4550 PRINT "HOORAY! YOU ARE THE WINNER. HERE COMES THE BRIDE!"
9999 END
