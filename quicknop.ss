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
      -- stack will be at Org5000
8:  ADDI R30, R0, 0
12:  NOP
16:  NOP
      -- load num elements in array
20:  LW R29, 4000(R0)
24:  NOP
28:  NOP
32:  SLL R29, R29, 2
36:  NOP
40:  NOP
      -- load in address of data
44:  ADDI R28, R0, 4004
48:  NOP
52:  NOP
      -- push high on to stack
56:  SW R29, 5000(R30)
60:  NOP
64:  NOP
68:  ADDI R30, R30, 4
72:  NOP
76:  NOP
      -- push low
80:  SW R0, 5000(R30)
84:  NOP
88:  NOP
92:  ADDI R30, R30, 0
96:  NOP
100:  NOP
104:  ADDI R14, R0, 4
108:  NOP
112:  NOP
      --
      --
      --
LABEL QuickSort
116:  NOP
120:  NOP
      -- pop low off of stack
124:  LW R3, 5000(R30)
128:  NOP
132:  NOP
136:  SUB R30, R30, R14
140:  NOP
144:  NOP
      -- pop high off of stack
148:  LW R4, 5000(R30)
152:  NOP
156:  NOP
160:  SUB R30, R30, R14
164:  NOP
168:  NOP
      --
      --check to se if low < high
172:  SUB R12, R3, R4
176:  NOP
180:  NOP
184:  BGEZ R12, Exit
188:  NOP
192:  NOP
      -- call partition function
196:  J Partition
200:  NOP
204:  NOP
      --postPartition
LABEL postPartition
208:  NOP
212:  NOP
216:  JAL QuickSort
220:  NOP
224:  NOP
228:  J QuickSort
232:  NOP
236:  NOP
      --
      --
      --
LABEL Partition
240:  NOP
244:  NOP
      -- set pivot
248:  LW R11, 4004(R4)
252:  NOP
256:  NOP
      -- set i = low - 1
260:  SUB R9, R3, R14
264:  NOP
268:  NOP
      -- set up for loop
      -- set j = low - 1
272:  SUB R10, R3, R14
276:  NOP
280:  NOP
      --
      --
      -- loop 
LABEL PartitionForLoop
284:  NOP
288:  NOP
      -- j++
292:  ADDI R10, R10, 4
296:  NOP
300:  NOP
      -- j == high
304:  BEQ R10, R4, afterLoop
308:  NOP
312:  NOP
      -- pivot - arr[j]
316:  LW R13, 4004(R10)
320:  NOP
324:  NOP
328:  SUB R13, R11, R13
332:  NOP
336:  NOP
      --
      --
      -- if the if statement fails go back to top of loop
      --
340:  BLTZ R13, PartitionForLoop
344:  NOP
348:  NOP
      -- i++
352:  ADDI R9, R9, 4
356:  NOP
360:  NOP
      -- prepare for swap
      --load address and data at i
364:  ADDI R5, R9, 4004
368:  NOP
372:  NOP
376:  LW R6, 4004(R9)
380:  NOP
384:  NOP
      -- load address and data at J
388:  ADDI R7, R10, 4004
392:  NOP
396:  NOP
400:  LW R8, 4004(R10)
404:  NOP
408:  NOP
      -- jump to swap function
412:  J SwapIf
416:  NOP
420:  NOP
      --
      --
      --
LABEL afterLoop
424:  NOP
428:  NOP
      -- prepare for swap
      --load address and data at i + 1
432:  ADDI R9, R9, 4
436:  NOP
440:  NOP
444:  ADDI R5, R9, 4004
448:  NOP
452:  NOP
456:  LW R6, 4004(R9)
460:  NOP
464:  NOP
      -- load address and data at High
468:  ADDI R7, R4, 4004
472:  NOP
476:  NOP
480:  LW R8, 4004(R4)
484:  NOP
488:  NOP
492:  J SwapOut
496:  NOP
500:  NOP
      --
      --
      --
      --
LABEL endFunction
504:  NOP
508:  NOP
      -- push high
512:  ADDI R30, R30, 4
516:  NOP
520:  NOP
524:  SW R4, 5000(R30)
528:  NOP
532:  NOP
      -- push pi+1 (i+2)
536:  ADDI R30, R30, 4
540:  NOP
544:  NOP
548:  ADDI R12, R9, 4
552:  NOP
556:  NOP
560:  SW R12, 5000(R30)
564:  NOP
568:  NOP
      --
      -- push pi - 1 (i)
572:  ADDI R30, R30, 4
576:  NOP
580:  NOP
584:  SUB R12, R9, R14
588:  NOP
592:  NOP
596:  SW R12, 5000(R30)
600:  NOP
604:  NOP
      -- push low
608:  ADDI R30, R30, 4
612:  NOP
616:  NOP
620:  SW R3, 5000(R30)
624:  NOP
628:  NOP
      --
632:  J postPartition
636:  NOP
640:  NOP
      --
      --
      --
      -- Swap function
LABEL SwapIf
644:  NOP
648:  NOP
      -- store data of arr[j+1] in arr[j]
652:  SW R6, 0(R7)
656:  NOP
660:  NOP
      -- store data of old arr[j] in arr[j+1]
664:  SW R8, 0(R5)
668:  NOP
672:  NOP
676:  J PartitionForLoop
680:  NOP
684:  NOP
      --
      --
      -- Swap function
LABEL SwapOut
688:  NOP
692:  NOP
      -- store data of arr[j+1] in arr[j]
696:  SW R6, 0(R7)
700:  NOP
704:  NOP
      -- store data of old arr[j] in arr[j+1]
708:  SW R8, 0(R5)
712:  NOP
716:  NOP
720:  J endFunction
724:  NOP
728:  NOP
      --
      --
      --
LABEL Exit
732:  NOP
736:  NOP
740:  ADDI R12, R30, 0
744:  NOP
748:  NOP
752:  BLEZ R12, End
756:  NOP
760:  NOP
764:  JR R31
768:  NOP
772:  NOP
      --
LABEL End
776:  NOP
780:  NOP
784:  HALT
788:  NOP
792:  NOP
