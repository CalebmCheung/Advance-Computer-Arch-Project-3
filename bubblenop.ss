      -- Authors: Caleb Cheung, Joshua Carlson
      --program to sort an array of data using bubble sort.
      --
      -- 4000 = #number of nums in array
      -- 4004 = begining of array
      --
      -- R0 = 0
      -- R20, R21 = parameter passing registers
      -- R30 = SP
      -- R31 = Reuturn address registers
      -- R2 = number of elements (n)
      -- R3 = size of array in bytes
      -- R4 = address of the begining of array (4004)
      -- R5 = counting (J reg)
      -- R11 = J + 1
      -- R12 = i
      -- R6 =  data in arr[j]
      -- R7 =  data in arr[j+1]
      -- R8 = temp
      -- R9 = address to element arr[j]
      -- R10 = address to element arr[j+1]
      -- R13 = n-i
      --
0:  NOP
4:  NOP
8:  NOP
12:  NOP
      -- Stack at 5000
16:  ADDI R30, R0, 5000
20:  NOP
24:  NOP
28:  NOP
32:  NOP
      -- set R0
36:  ADDI R0, R1, 0
40:  NOP
44:  NOP
48:  NOP
52:  NOP
      -- set stack pointer
56:  ADDI R30, R0, 5000
60:  NOP
64:  NOP
68:  NOP
72:  NOP
      -- load in where data starts
76:  ADDI R4, R0, 4004
80:  NOP
84:  NOP
88:  NOP
92:  NOP
      -- load the num of elements into a registers
96:  LW R2, 4000(R0)
100:  NOP
104:  NOP
108:  NOP
112:  NOP
116:  SLL R2, R2, 2
120:  NOP
124:  NOP
128:  NOP
132:  NOP
      -- R4 is now the begining of the array
      -- set I = 0
136:  ADDI R12, R0, 0
140:  NOP
144:  NOP
148:  NOP
152:  NOP
      --
      --
      -- start loops
LABEL LoopStartI
156:  NOP
160:  NOP
164:  NOP
168:  NOP
      -- set J = 0
172:  ADDI R5, R0, 0
176:  NOP
180:  NOP
184:  NOP
188:  NOP
192:  ADDI R12, R12, 4
196:  NOP
200:  NOP
204:  NOP
208:  NOP
      -- branch if i = n
212:  BEQ R2, R12, PostLoop
216:  NOP
220:  NOP
224:  NOP
228:  NOP
      -- n-i
232:  SUB R13, R2, R12
236:  NOP
240:  NOP
244:  NOP
248:  NOP
      --
      --
      -- second loop
LABEL LoopStartJ
252:  NOP
256:  NOP
260:  NOP
264:  NOP
      -- branch if j = n-i
268:  BEQ R5, R13, LoopStartI
272:  NOP
276:  NOP
280:  NOP
284:  NOP
      -- Start Looping through
      -- set J + 1
288:  ADDI R11, R5, 4
292:  NOP
296:  NOP
300:  NOP
304:  NOP
      -- Put arr[j] address in R9 and arr[j] data in R6
308:  ADD R9, R5, R4 
312:  NOP
316:  NOP
320:  NOP
324:  NOP
328:  LW R6, 4004(R5)
332:  NOP
336:  NOP
340:  NOP
344:  NOP
      -- put arra[j + 1] address in R10 and arr[j + 1] data in R7
348:  ADD R10, R4, R11
352:  NOP
356:  NOP
360:  NOP
364:  NOP
368:  LW R7, 4004(R11)
372:  NOP
376:  NOP
380:  NOP
384:  NOP
      -- Branch Condition
388:  SUB R8, R6, R7
392:  NOP
396:  NOP
400:  NOP
404:  NOP
408:  BGTZ R8, Swap
412:  NOP
416:  NOP
420:  NOP
424:  NOP
      --increment j
428:  ADDI R5, R11, 0
432:  NOP
436:  NOP
440:  NOP
444:  NOP
448:  J LoopStartJ
452:  NOP
456:  NOP
460:  NOP
464:  NOP
      --
      --
      --
      -- Swap function
LABEL Swap
468:  NOP
472:  NOP
476:  NOP
480:  NOP
      -- store data of arr[j+1] in arr[j]
484:  SW R7, 0(R9)
488:  NOP
492:  NOP
496:  NOP
500:  NOP
      -- store data of old arr[j] in arr[j+1]
504:  SW R6, 0(R10)
508:  NOP
512:  NOP
516:  NOP
520:  NOP
      --increment j
524:  ADDI R5, R11, 0
528:  NOP
532:  NOP
536:  NOP
540:  NOP
      -- exit function
544:  J LoopStartJ
548:  NOP
552:  NOP
556:  NOP
560:  NOP
      --
      --
      -- exit loop
LABEL PostLoop
564:  NOP
568:  NOP
572:  NOP
576:  NOP
580:  HALT
584:  NOP
588:  NOP
592:  NOP
596:  NOP
