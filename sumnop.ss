      --A program to find the sum of a list of numbers
      -- The program uses a subroutine to add 2 numbers, as a demo
      -- It also sets up a stack frame, although not needed for this program
      -- 4000 = # of nums to sum
      -- 4004  = location for sum to be put
      -- 4008 = beginning of array of nums
      -- 
      -- R20, R21 - parameter passing regs
      -- R30 = SP
      -- R31 = Ret Addr Reg
      -- R3 = size of array, in bytes
      -- R4 = Address of beginning of array (4008)
      -- R5 = first address past array, for loop termination
      -- R6 = current address being worked on (loop i variable)
      -- R7 = sum
      -- R8 = current array data value
      -- 
0:  NOP
4:  NOP
8:  NOP
12:  NOP
      -- Stack will be at Org5000 - R30 is SP
16:  ADDI R30, R0, 5000
20:  NOP
24:  NOP
28:  NOP
32:  NOP
      -- Data is at Org 4000
36:  ADDI R4, R0, 4000
40:  NOP
44:  NOP
48:  NOP
52:  NOP
      -- Load number of elements
56:  LW R2, 0(R4)
60:  NOP
64:  NOP
68:  NOP
72:  NOP
      -- Multiply this by 4, since each element is 4 bytes
76:  SLL R3, R2, 2
80:  NOP
84:  NOP
88:  NOP
92:  NOP
      -- R4 is address of beginning of array of numbers
96:  ADDI R4, R4, 8
100:  NOP
104:  NOP
108:  NOP
112:  NOP
      -- R5 now points to first address past array
116:  ADD R5, R4, R3
120:  NOP
124:  NOP
128:  NOP
132:  NOP
      -- initialize loop variable to first address (4008)
136:  ADD R6, R4, R0
140:  NOP
144:  NOP
148:  NOP
152:  NOP
      -- sum = 0
156:  ADD R7, R0, R0
160:  NOP
164:  NOP
168:  NOP
172:  NOP
LABEL LoopStart
176:  NOP
180:  NOP
184:  NOP
188:  NOP
192:  BEQ R6, R5, PostLoop
196:  NOP
200:  NOP
204:  NOP
208:  NOP
      -- load current value
212:  LW R8, 0(R6)
216:  NOP
220:  NOP
224:  NOP
228:  NOP
      -- pass parameters (curr value and curr sum)
232:  ADD R20, R8, R0
236:  NOP
240:  NOP
244:  NOP
248:  NOP
252:  ADD R21, R7, R0
256:  NOP
260:  NOP
264:  NOP
268:  NOP
272:  JAL AddThem
276:  NOP
280:  NOP
284:  NOP
288:  NOP
      -- move sum from return reg to R7
292:  ADD R7, R1, R0
296:  NOP
300:  NOP
304:  NOP
308:  NOP
      -- increment address (by 4 bytes)
312:  ADDI R6, R6, 4
316:  NOP
320:  NOP
324:  NOP
328:  NOP
332:  J LoopStart
336:  NOP
340:  NOP
344:  NOP
348:  NOP
LABEL PostLoop
352:  NOP
356:  NOP
360:  NOP
364:  NOP
      -- store answer
368:  SW R7, -4(R4)
372:  NOP
376:  NOP
380:  NOP
384:  NOP
388:  HALT
392:  NOP
396:  NOP
400:  NOP
404:  NOP
      -- subroutine to add 2 numbers
LABEL AddThem
408:  NOP
412:  NOP
416:  NOP
420:  NOP
      -- if doing recursion, must save R31
424:  SW R31, 0(R30)
428:  NOP
432:  NOP
436:  NOP
440:  NOP
      -- post incr the SP
444:  ADDI R30, R30, 4
448:  NOP
452:  NOP
456:  NOP
460:  NOP
      -- Since subroutine uses R5, must save
464:  SW R5, 0(R30)
468:  NOP
472:  NOP
476:  NOP
480:  NOP
484:  ADDI R30, R30, 4
488:  NOP
492:  NOP
496:  NOP
500:  NOP
      -- get nums from parameter regs and sum
504:  ADD R5, R20, R21
508:  NOP
512:  NOP
516:  NOP
520:  NOP
      -- move result to return reg
524:  ADD R1, R5, R0
528:  NOP
532:  NOP
536:  NOP
540:  NOP
      -- now put stack back the way it was
      -- and restore return address and R5
544:  ADDI R30, R30, -4
548:  NOP
552:  NOP
556:  NOP
560:  NOP
564:  LW R5, 0(R30)
568:  NOP
572:  NOP
576:  NOP
580:  NOP
584:  ADDI R30, R30, -4
588:  NOP
592:  NOP
596:  NOP
600:  NOP
604:  LW R31, 0(R30)
608:  NOP
612:  NOP
616:  NOP
620:  NOP
      -- return from subroutine
624:  JR R31
628:  NOP
632:  NOP
636:  NOP
640:  NOP
644:  NOP
648:  NOP
652:  NOP
656:  NOP
660:  NOP
