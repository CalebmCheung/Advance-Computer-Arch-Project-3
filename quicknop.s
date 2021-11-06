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
Begin Assembly
NOP
NOP
NOP
NOP
-- stack will be at Org5000
ADDI R30, R0, 0
NOP
NOP
NOP
NOP
-- load num elements in array
LW R29, 4000(R0)
NOP
NOP
NOP
NOP
SLL R29, R29, 2
NOP
NOP
NOP
NOP
-- load in address of data
ADDI R28, R0, 4004
NOP
NOP
NOP
NOP
-- push high on to stack
SW R29, 5000(R30)
NOP
NOP
NOP
NOP
ADDI R30, R30, 4
NOP
NOP
NOP
NOP
-- push low
SW R0, 5000(R30)
NOP
NOP
NOP
NOP
ADDI R30, R30, 0
NOP
NOP
NOP
NOP
ADDI R14, R0, 4
NOP
NOP
NOP
NOP
--
--
--
LABEL QuickSort
NOP
NOP
NOP
NOP
-- pop low off of stack
LW R3, 5000(R30)
NOP
NOP
NOP
NOP
SUB R30, R30, R14
NOP
NOP
NOP
NOP
-- pop high off of stack
LW R4, 5000(R30)
NOP
NOP
NOP
NOP
SUB R30, R30, R14
NOP
NOP
NOP
NOP
--
--check to se if low < high
SUB R12, R3, R4
NOP
NOP
NOP
NOP
BGEZ R12, Exit
NOP
NOP
NOP
NOP
-- call partition function
J Partition
NOP
NOP
NOP
NOP
--postPartition
LABEL postPartition
NOP
NOP
NOP
NOP
JAL QuickSort
NOP
NOP
NOP
NOP
J QuickSort
NOP
NOP
NOP
NOP
--
--
--
LABEL Partition
NOP
NOP
NOP
NOP
-- set pivot
LW R11, 4004(R4)
NOP
NOP
NOP
NOP
-- set i = low - 1
SUB R9, R3, R14
NOP
NOP
NOP
NOP
-- set up for loop
-- set j = low - 1
SUB R10, R3, R14
NOP
NOP
NOP
NOP
--
--
-- loop 
LABEL PartitionForLoop
NOP
NOP
NOP
NOP
-- j++
ADDI R10, R10, 4
NOP
NOP
NOP
NOP
-- j == high
BEQ R10, R4, afterLoop
NOP
NOP
NOP
NOP
-- pivot - arr[j]
LW R13, 4004(R10)
NOP
NOP
NOP
NOP
SUB R13, R11, R13
NOP
NOP
NOP
NOP
--
--
-- if the if statement fails go back to top of loop
--
BLTZ R13, PartitionForLoop
NOP
NOP
NOP
NOP
-- i++
ADDI R9, R9, 4
NOP
NOP
NOP
NOP
-- prepare for swap
--load address and data at i
ADDI R5, R9, 4004
NOP
NOP
NOP
NOP
LW R6, 4004(R9)
NOP
NOP
NOP
NOP
-- load address and data at J
ADDI R7, R10, 4004
NOP
NOP
NOP
NOP
LW R8, 4004(R10)
NOP
NOP
NOP
NOP
-- jump to swap function
J SwapIf
NOP
NOP
NOP
NOP
--
--
--
LABEL afterLoop
NOP
NOP
NOP
NOP
-- prepare for swap
--load address and data at i + 1
ADDI R9, R9, 4
NOP
NOP
NOP
NOP
ADDI R5, R9, 4004
NOP
NOP
NOP
NOP
LW R6, 4004(R9)
NOP
NOP
NOP
NOP
-- load address and data at High
ADDI R7, R4, 4004
NOP
NOP
NOP
NOP
LW R8, 4004(R4)
NOP
NOP
NOP
NOP
J SwapOut
NOP
NOP
NOP
NOP
--
--
--
--
LABEL endFunction
NOP
NOP
NOP
NOP
-- push high
ADDI R30, R30, 4
NOP
NOP
NOP
NOP
SW R4, 5000(R30)
NOP
NOP
NOP
NOP
-- push pi+1 (i+2)
ADDI R30, R30, 4
NOP
NOP
NOP
NOP
ADDI R12, R9, 4
NOP
NOP
NOP
NOP
SW R12, 5000(R30)
NOP
NOP
NOP
NOP
--
-- push pi - 1 (i)
ADDI R30, R30, 4
NOP
NOP
NOP
NOP
SUB R12, R9, R14
NOP
NOP
NOP
NOP
SW R12, 5000(R30)
NOP
NOP
NOP
NOP
-- push low
ADDI R30, R30, 4
NOP
NOP
NOP
NOP
SW R3, 5000(R30)
NOP
NOP
NOP
NOP
--
J postPartition
NOP
NOP
NOP
NOP
--
--
--
-- Swap function
LABEL SwapIf
NOP
NOP
NOP
NOP
-- store data of arr[j+1] in arr[j]
SW R6, 0(R7)
NOP
NOP
NOP
NOP
-- store data of old arr[j] in arr[j+1]
SW R8, 0(R5)
NOP
NOP
NOP
NOP
J PartitionForLoop
NOP
NOP
NOP
NOP
--
--
-- Swap function
LABEL SwapOut
NOP
NOP
NOP
NOP
-- store data of arr[j+1] in arr[j]
SW R6, 0(R7)
NOP
NOP
NOP
NOP
-- store data of old arr[j] in arr[j+1]
SW R8, 0(R5)
NOP
NOP
NOP
NOP
J endFunction
NOP
NOP
NOP
NOP
--
--
--
LABEL Exit
NOP
NOP
NOP
NOP
ADDI R12, R30, 0
NOP
NOP
NOP
NOP
BLEZ R12, End
NOP
NOP
NOP
NOP
JR R31
NOP
NOP
NOP
NOP
--
LABEL End
NOP
NOP
NOP
NOP
HALT
NOP
NOP
NOP
NOP
End Assembly
-- begin main data
Begin Data 4000 44
9
100
5
9
3
6
15
12
8
16
10
End Data
-- stack
Begin Data 5000 100
End Data