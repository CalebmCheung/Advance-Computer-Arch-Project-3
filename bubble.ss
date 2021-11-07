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
      -- Stack at 5000
0:  ADDI R30, R0, 5000
      -- set R0
4:  ADDI R0, R1, 0
      -- set stack pointer
8:  ADDI R30, R0, 5000
      -- load in where data starts
12:  ADDI R4, R0, 4004
      -- load the num of elements into a registers
16:  LW R2, 4000(R0)
20:  SLL R2, R2, 2
      -- R4 is now the begining of the array
      -- set I = 0
24:  ADDI R12, R0, 0
      --
      --
      -- start loops
LABEL LoopStartI
      -- set J = 0
28:  ADDI R5, R0, 0
32:  ADDI R12, R12, 4
      -- branch if i = n
36:  BEQ R2, R12, PostLoop
      -- n-i
40:  SUB R13, R2, R12
      --
      --
      -- second loop
LABEL LoopStartJ
      -- branch if j = n-i
44:  BEQ R5, R13, LoopStartI
      -- Start Looping through
      -- set J + 1
48:  ADDI R11, R5, 4
      -- Put arr[j] address in R9 and arr[j] data in R6
52:  ADD R9, R5, R4 
56:  LW R6, 4004(R5)
      -- put arra[j + 1] address in R10 and arr[j + 1] data in R7
60:  ADD R10, R4, R11
64:  LW R7, 4004(R11)
      -- Branch Condition
68:  SUB R8, R6, R7
72:  BGTZ R8, Swap
      --increment j
76:  ADDI R5, R11, 0
80:  J LoopStartJ
      --
      --
      --
      -- Swap function
LABEL Swap
      -- store data of arr[j+1] in arr[j]
84:  SW R7, 0(R9)
      -- store data of old arr[j] in arr[j+1]
88:  SW R6, 0(R10)
      --increment j
92:  ADDI R5, R11, 0
      -- exit function
96:  J LoopStartJ
      --
      --
      -- exit loop
LABEL PostLoop
100:  HALT
