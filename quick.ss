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
      -- stack will be at Org5000
0:  ADDI R30, R0, 0
      -- load num elements in array
4:  LW R29, 4000(R0)
8:  SLL R29, R29, 2
      -- load in address of data
12:  ADDI R28, R0, 4004
      -- push high on to stack
16:  SW R29, 5000(R30)
20:  ADDI R30, R30, 4
      -- push low
24:  SW R0, 5000(R30)
28:  ADDI R30, R30, 0
32:  ADDI R14, R0, 4
      --
      --
      --
LABEL QuickSort
      -- pop low off of stack
36:  LW R3, 5000(R30)
40:  SUB R30, R30, R14
      -- pop high off of stack
44:  LW R4, 5000(R30)
48:  SUB R30, R30, R14
      --
      --check to se if low < high
52:  SUB R12, R3, R4
56:  BGEZ R12, Exit
      -- call partition function
60:  J Partition
      --postPartition
LABEL postPartition
64:  JAL QuickSort
68:  J QuickSort
      --
      --
      --
LABEL Partition
      -- set pivot
72:  LW R11, 4004(R4)
      -- set i = low - 1
76:  SUB R9, R3, R14
      -- set up for loop
      -- set j = low - 1
80:  SUB R10, R3, R14
      --
      --
      -- loop 
LABEL PartitionForLoop
      -- j++
84:  ADDI R10, R10, 4
      -- j == high
88:  BEQ R10, R4, afterLoop
      -- pivot - arr[j]
92:  LW R13, 4004(R10)
96:  SUB R13, R11, R13
      --
      --
      -- if the if statement fails go back to top of loop
      --
100:  BLTZ R13, PartitionForLoop
      -- i++
104:  ADDI R9, R9, 4
      -- prepare for swap
      --load address and data at i
108:  ADDI R5, R9, 4004
112:  LW R6, 4004(R9)
      -- load address and data at J
116:  ADDI R7, R10, 4004
120:  LW R8, 4004(R10)
      -- jump to swap function
124:  J SwapIf
      --
      --
      --
LABEL afterLoop
      -- prepare for swap
      --load address and data at i + 1
128:  ADDI R9, R9, 4
132:  ADDI R5, R9, 4004
136:  LW R6, 4004(R9)
      -- load address and data at High
140:  ADDI R7, R4, 4004
144:  LW R8, 4004(R4)
148:  J SwapOut
      --
      --
      --
      --
LABEL endFunction
      -- push high
152:  ADDI R30, R30, 4
156:  SW R4, 5000(R30)
      -- push pi+1 (i+2)
160:  ADDI R30, R30, 4
164:  ADDI R12, R9, 4
168:  SW R12, 5000(R30)
      --
      -- push pi - 1 (i)
172:  ADDI R30, R30, 4
176:  SUB R12, R9, R14
180:  SW R12, 5000(R30)
      -- push low
184:  ADDI R30, R30, 4
188:  SW R3, 5000(R30)
      --
192:  J postPartition
      --
      --
      --
      -- Swap function
LABEL SwapIf
      -- store data of arr[j+1] in arr[j]
196:  SW R6, 0(R7)
      -- store data of old arr[j] in arr[j+1]
200:  SW R8, 0(R5)
204:  J PartitionForLoop
      --
      --
      -- Swap function
LABEL SwapOut
      -- store data of arr[j+1] in arr[j]
208:  SW R6, 0(R7)
      -- store data of old arr[j] in arr[j+1]
212:  SW R8, 0(R5)
216:  J endFunction
      --
      --
      --
LABEL Exit
220:  ADDI R12, R30, 0
224:  BLEZ R12, End
228:  JR R31
      --
LABEL End
232:  HALT
