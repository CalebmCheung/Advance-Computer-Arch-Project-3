      -- Authors: Caleb Cheung, Joshua Carlson
      --program to sort an array of data using quick sort.
      --
      -- R0 = 0
      -- R30 = SP
      -- R29 = number of element address 4000
      -- R28 = address of start of array 4004
      --
      --
      --
      -- R31 = Return address registers
      -- R1 = number of elements in inital array
      -- R2 = last element of inital array
      -- R3 = low reg
      -- R4 = high reg
      -- R5 = "a" address
      -- R6 = "a" data
      -- R7 = "b" address
      -- R8 = "b" data
      -- R9 = "i"
      -- R10 = "j"
      -- R11 = pivot register
      -- R12 = temp register 1
      -- R13 = temp register 2
      -- R14 = constant "1"
      --
      --
      --
0:  NOP
4:  NOP
8:  NOP
12:  NOP
      -- stack will be at Org5000
16:  ADDI R30, R0, 0
20:  NOP
24:  NOP
28:  NOP
32:  NOP
      -- load num elements in array
36:  LW R29, 4000(R0)
40:  NOP
44:  NOP
48:  NOP
52:  NOP
56:  SLL R29, R29, 2
60:  NOP
64:  NOP
68:  NOP
72:  NOP
      -- load in address of data
76:  ADDI R28, R0, 4004
80:  NOP
84:  NOP
88:  NOP
92:  NOP
      -- push high on to stack
96:  SW R29, 5000(R30)
100:  NOP
104:  NOP
108:  NOP
112:  NOP
116:  ADDI R30, R30, 4
120:  NOP
124:  NOP
128:  NOP
132:  NOP
      -- push low
136:  SW R0, 5000(R30)
140:  NOP
144:  NOP
148:  NOP
152:  NOP
156:  ADDI R30, R30, 0
160:  NOP
164:  NOP
168:  NOP
172:  NOP
176:  ADDI R14, R0, 4
180:  NOP
184:  NOP
188:  NOP
192:  NOP
      --
      --
      --
LABEL QuickSort
196:  NOP
200:  NOP
204:  NOP
208:  NOP
      -- pop low off of stack
212:  LW R3, 5000(R30)
216:  NOP
220:  NOP
224:  NOP
228:  NOP
232:  SUB R30, R30, R14
236:  NOP
240:  NOP
244:  NOP
248:  NOP
      -- pop high off of stack
252:  LW R4, 5000(R30)
256:  NOP
260:  NOP
264:  NOP
268:  NOP
272:  SUB R30, R30, R14
276:  NOP
280:  NOP
284:  NOP
288:  NOP
      --
      --check to se if low < high
292:  SUB R12, R3, R4
296:  NOP
300:  NOP
304:  NOP
308:  NOP
312:  BGEZ R12, Exit
316:  NOP
320:  NOP
324:  NOP
328:  NOP
      -- call partition function
332:  J Partition
336:  NOP
340:  NOP
344:  NOP
348:  NOP
      --postPartition
LABEL postPartition
352:  NOP
356:  NOP
360:  NOP
364:  NOP
368:  JAL QuickSort
372:  NOP
376:  NOP
380:  NOP
384:  NOP
388:  J QuickSort
392:  NOP
396:  NOP
400:  NOP
404:  NOP
      --
      --
      --
LABEL Partition
408:  NOP
412:  NOP
416:  NOP
420:  NOP
      -- set pivot
424:  LW R11, 4004(R4)
428:  NOP
432:  NOP
436:  NOP
440:  NOP
      -- set i = low - 1
444:  SUB R9, R3, R14
448:  NOP
452:  NOP
456:  NOP
460:  NOP
      -- set up for loop
      -- set j = low - 1
464:  SUB R10, R3, R14
468:  NOP
472:  NOP
476:  NOP
480:  NOP
      --
      --
      -- loop 
LABEL PartitionForLoop
484:  NOP
488:  NOP
492:  NOP
496:  NOP
      -- j++
500:  ADDI R10, R10, 4
504:  NOP
508:  NOP
512:  NOP
516:  NOP
      -- j == high
520:  BEQ R10, R4, afterLoop
524:  NOP
528:  NOP
532:  NOP
536:  NOP
      -- pivot - arr[j]
540:  LW R13, 4004(R10)
544:  NOP
548:  NOP
552:  NOP
556:  NOP
560:  SUB R13, R11, R13
564:  NOP
568:  NOP
572:  NOP
576:  NOP
      --
      --
      -- if the if statement fails go back to top of loop
      --
580:  BLTZ R13, PartitionForLoop
584:  NOP
588:  NOP
592:  NOP
596:  NOP
      -- i++
600:  ADDI R9, R9, 4
604:  NOP
608:  NOP
612:  NOP
616:  NOP
      -- prepare for swap
      --load address and data at i
620:  ADDI R5, R9, 4004
624:  NOP
628:  NOP
632:  NOP
636:  NOP
640:  LW R6, 4004(R9)
644:  NOP
648:  NOP
652:  NOP
656:  NOP
      -- load address and data at J
660:  ADDI R7, R10, 4004
664:  NOP
668:  NOP
672:  NOP
676:  NOP
680:  LW R8, 4004(R10)
684:  NOP
688:  NOP
692:  NOP
696:  NOP
      -- jump to swap function
700:  J SwapIf
704:  NOP
708:  NOP
712:  NOP
716:  NOP
      --
      --
      --
LABEL afterLoop
720:  NOP
724:  NOP
728:  NOP
732:  NOP
      -- prepare for swap
      --load address and data at i + 1
736:  ADDI R9, R9, 4
740:  NOP
744:  NOP
748:  NOP
752:  NOP
756:  ADDI R5, R9, 4004
760:  NOP
764:  NOP
768:  NOP
772:  NOP
776:  LW R6, 4004(R9)
780:  NOP
784:  NOP
788:  NOP
792:  NOP
      -- load address and data at High
796:  ADDI R7, R4, 4004
800:  NOP
804:  NOP
808:  NOP
812:  NOP
816:  LW R8, 4004(R4)
820:  NOP
824:  NOP
828:  NOP
832:  NOP
836:  J SwapOut
840:  NOP
844:  NOP
848:  NOP
852:  NOP
      --
      --
      --
      --
LABEL endFunction
856:  NOP
860:  NOP
864:  NOP
868:  NOP
      -- push high
872:  ADDI R30, R30, 4
876:  NOP
880:  NOP
884:  NOP
888:  NOP
892:  SW R4, 5000(R30)
896:  NOP
900:  NOP
904:  NOP
908:  NOP
      -- push pi+1 (i+2)
912:  ADDI R30, R30, 4
916:  NOP
920:  NOP
924:  NOP
928:  NOP
932:  ADDI R12, R9, 4
936:  NOP
940:  NOP
944:  NOP
948:  NOP
952:  SW R12, 5000(R30)
956:  NOP
960:  NOP
964:  NOP
968:  NOP
      --
      -- push pi - 1 (i)
972:  ADDI R30, R30, 4
976:  NOP
980:  NOP
984:  NOP
988:  NOP
992:  SUB R12, R9, R14
996:  NOP
1000:  NOP
1004:  NOP
1008:  NOP
1012:  SW R12, 5000(R30)
1016:  NOP
1020:  NOP
1024:  NOP
1028:  NOP
      -- push low
1032:  ADDI R30, R30, 4
1036:  NOP
1040:  NOP
1044:  NOP
1048:  NOP
1052:  SW R3, 5000(R30)
1056:  NOP
1060:  NOP
1064:  NOP
1068:  NOP
      --
1072:  J postPartition
1076:  NOP
1080:  NOP
1084:  NOP
1088:  NOP
      --
      --
      --
      -- Swap function
LABEL SwapIf
1092:  NOP
1096:  NOP
1100:  NOP
1104:  NOP
      -- store data of arr[j+1] in arr[j]
1108:  SW R6, 0(R7)
1112:  NOP
1116:  NOP
1120:  NOP
1124:  NOP
      -- store data of old arr[j] in arr[j+1]
1128:  SW R8, 0(R5)
1132:  NOP
1136:  NOP
1140:  NOP
1144:  NOP
1148:  J PartitionForLoop
1152:  NOP
1156:  NOP
1160:  NOP
1164:  NOP
      --
      --
      -- Swap function
LABEL SwapOut
1168:  NOP
1172:  NOP
1176:  NOP
1180:  NOP
      -- store data of arr[j+1] in arr[j]
1184:  SW R6, 0(R7)
1188:  NOP
1192:  NOP
1196:  NOP
1200:  NOP
      -- store data of old arr[j] in arr[j+1]
1204:  SW R8, 0(R5)
1208:  NOP
1212:  NOP
1216:  NOP
1220:  NOP
1224:  J endFunction
1228:  NOP
1232:  NOP
1236:  NOP
1240:  NOP
      --
      --
      --
LABEL Exit
1244:  NOP
1248:  NOP
1252:  NOP
1256:  NOP
1260:  ADDI R12, R30, 0
1264:  NOP
1268:  NOP
1272:  NOP
1276:  NOP
1280:  BLEZ R12, End
1284:  NOP
1288:  NOP
1292:  NOP
1296:  NOP
1300:  JR R31
1304:  NOP
1308:  NOP
1312:  NOP
1316:  NOP
      --
LABEL End
1320:  NOP
1324:  NOP
1328:  NOP
1332:  NOP
1336:  HALT
1340:  NOP
1344:  NOP
1348:  NOP
1352:  NOP
