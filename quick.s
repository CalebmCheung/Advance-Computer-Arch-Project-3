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
-- stack will be at Org5000
ADDI R30, R0, 0
-- load num elements in array
LW R29, 4000(R0)
SLL R29, R29, 2
-- load in address of data
ADDI R28, R0, 4004
-- push high on to stack
SW R29, 5000(R30)
ADDI R30, R30, 4
-- push low
SW R0, 5000(R30)
ADDI R30, R30, 0
ADDI R14, R0, 4
--
--
--
LABEL QuickSort
-- pop low off of stack
LW R3, 5000(R30)
SUB R30, R30, R14
-- pop high off of stack
LW R4, 5000(R30)
SUB R30, R30, R14
--
--check to se if low < high
SUB R12, R3, R4
BGEZ R12, Exit
-- call partition function
J Partition
--postPartition
LABEL postPartition
JAL QuickSort
J QuickSort
--
--
--
LABEL Partition
-- set pivot
LW R11, 4004(R4)
-- set i = low - 1
SUB R9, R3, R14
-- set up for loop
-- set j = low - 1
SUB R10, R3, R14
--
--
-- loop 
LABEL PartitionForLoop
-- j++
ADDI R10, R10, 4
-- j == high
BEQ R10, R4, afterLoop
-- pivot - arr[j]
LW R13, 4004(R10)
SUB R13, R11, R13
--
--
-- if the if statement fails go back to top of loop
--
BLTZ R13, PartitionForLoop
-- i++
ADDI R9, R9, 4
-- prepare for swap
--load address and data at i
ADDI R5, R9, 4004
LW R6, 4004(R9)
-- load address and data at J
ADDI R7, R10, 4004
LW R8, 4004(R10)
-- jump to swap function
J SwapIf
--
--
--
LABEL afterLoop
-- prepare for swap
--load address and data at i + 1
ADDI R9, R9, 4
ADDI R5, R9, 4004
LW R6, 4004(R9)
-- load address and data at High
ADDI R7, R4, 4004
LW R8, 4004(R4)
J SwapOut
--
--
--
--
LABEL endFunction
-- push high
ADDI R30, R30, 4
SW R4, 5000(R30)
-- push pi+1 (i+2)
ADDI R30, R30, 4
ADDI R12, R9, 4
SW R12, 5000(R30)
--
-- push pi - 1 (i)
ADDI R30, R30, 4
SUB R12, R9, R14
SW R12, 5000(R30)
-- push low
ADDI R30, R30, 4
SW R3, 5000(R30)
--
J postPartition
--
--
--
-- Swap function
LABEL SwapIf
-- store data of arr[j+1] in arr[j]
SW R6, 0(R7)
-- store data of old arr[j] in arr[j+1]
SW R8, 0(R5)
J PartitionForLoop
--
--
-- Swap function
LABEL SwapOut
-- store data of arr[j+1] in arr[j]
SW R6, 0(R7)
-- store data of old arr[j] in arr[j+1]
SW R8, 0(R5)
J endFunction
--
--
--
LABEL Exit
ADDI R12, R30, 0
BLEZ R12, End
JR R31
--
LABEL End
HALT
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