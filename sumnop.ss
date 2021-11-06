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
      -- Stack will be at Org5000 - R30 is SP
0:  ADDI R30, R0, 5000
4:  NOP
8:  NOP
12:  NOP
16:  NOP
      -- Data is at Org 4000
20:  ADDI R4, R0, 4000
24:  NOP
28:  NOP
32:  NOP
36:  NOP
      -- Load number of elements
40:  LW R2, 0(R4)
44:  NOP
48:  NOP
52:  NOP
56:  NOP
      -- Multiply this by 4, since each element is 4 bytes
60:  SLL R3, R2, 2
64:  NOP
68:  NOP
72:  NOP
76:  NOP
      -- R4 is address of beginning of array of numbers
80:  ADDI R4, R4, 8
84:  NOP
88:  NOP
92:  NOP
96:  NOP
      -- R5 now points to first address past array
100:  ADD R5, R4, R3
104:  NOP
108:  NOP
112:  NOP
116:  NOP
      -- initialize loop variable to first address (4008)
120:  ADD R6, R4, R0
124:  NOP
128:  NOP
132:  NOP
136:  NOP
      -- sum = 0
140:  ADD R7, R0, R0
144:  NOP
148:  NOP
152:  NOP
156:  NOP
LABEL LoopStart
160:  NOP
164:  NOP
168:  NOP
172:  NOP
176:  BEQ R6, R5, PostLoop
180:  NOP
184:  NOP
188:  NOP
192:  NOP
      -- load current value
196:  LW R8, 0(R6)
200:  NOP
204:  NOP
208:  NOP
212:  NOP
      -- pass parameters (curr value and curr sum)
216:  ADD R20, R8, R0
220:  NOP
224:  NOP
228:  NOP
232:  NOP
236:  ADD R21, R7, R0
240:  NOP
244:  NOP
248:  NOP
252:  NOP
256:  JAL AddThem
260:  NOP
264:  NOP
268:  NOP
272:  NOP
      -- move sum from return reg to R7
276:  ADD R7, R1, R0
280:  NOP
284:  NOP
288:  NOP
292:  NOP
      -- increment address (by 4 bytes)
296:  ADDI R6, R6, 4
300:  NOP
304:  NOP
308:  NOP
312:  NOP
316:  J LoopStart
320:  NOP
324:  NOP
328:  NOP
332:  NOP
LABEL PostLoop
336:  NOP
340:  NOP
344:  NOP
348:  NOP
      -- store answer
352:  SW R7, -4(R4)
356:  NOP
360:  NOP
364:  NOP
368:  NOP
372:  HALT
376:  NOP
380:  NOP
384:  NOP
388:  NOP
      -- subroutine to add 2 numbers
LABEL AddThem
392:  NOP
396:  NOP
400:  NOP
404:  NOP
      -- if doing recursion, must save R31
408:  SW R31, 0(R30)
412:  NOP
416:  NOP
420:  NOP
424:  NOP
      -- post incr the SP
428:  ADDI R30, R30, 4
432:  NOP
436:  NOP
440:  NOP
444:  NOP
      -- Since subroutine uses R5, must save
448:  SW R5, 0(R30)
452:  NOP
456:  NOP
460:  NOP
464:  NOP
468:  ADDI R30, R30, 4
472:  NOP
476:  NOP
480:  NOP
484:  NOP
      -- get nums from parameter regs and sum
488:  ADD R5, R20, R21
492:  NOP
496:  NOP
500:  NOP
504:  NOP
      -- move result to return reg
508:  ADD R1, R5, R0
512:  NOP
516:  NOP
520:  NOP
524:  NOP
      -- now put stack back the way it was
      -- and restore return address and R5
528:  ADDI R30, R30, -4
532:  NOP
536:  NOP
540:  NOP
544:  NOP
548:  LW R5, 0(R30)
552:  NOP
556:  NOP
560:  NOP
564:  NOP
568:  ADDI R30, R30, -4
572:  NOP
576:  NOP
580:  NOP
584:  NOP
588:  LW R31, 0(R30)
592:  NOP
596:  NOP
600:  NOP
604:  NOP
      -- return from subroutine
608:  JR R31
612:  NOP
616:  NOP
620:  NOP
624:  NOP
628:  NOP
632:  NOP
636:  NOP
640:  NOP
644:  NOP
