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
Begin Assembly
NOP
NOP
NOP
NOP
-- Stack at 5000
ADDI R30, R0, 5000
NOP
NOP
NOP
NOP
-- set R0
ADDI R0, R1, 0
NOP
NOP
NOP
NOP
-- set stack pointer
ADDI R30, R0, 5000
NOP
NOP
NOP
NOP
-- load in where data starts
ADDI R4, R0, 4004
NOP
NOP
NOP
NOP
-- load the num of elements into a registers
LW R2, 4000(R0)
NOP
NOP
NOP
NOP
SLL R2, R2, 2
NOP
NOP
NOP
NOP
-- R4 is now the begining of the array
-- set I = 0
ADDI R12, R0, 0
NOP
NOP
NOP
NOP
--
--
-- start loops
LABEL LoopStartI
NOP
NOP
NOP
NOP
-- set J = 0
ADDI R5, R0, 0
NOP
NOP
NOP
NOP
ADDI R12, R12, 4
NOP
NOP
NOP
NOP
-- branch if i = n
BEQ R2, R12, PostLoop
NOP
NOP
NOP
NOP
-- n-i
SUB R13, R2, R12
NOP
NOP
NOP
NOP
--
--
-- second loop
LABEL LoopStartJ
NOP
NOP
NOP
NOP
-- branch if j = n-i
BEQ R5, R13, LoopStartI
NOP
NOP
NOP
NOP
-- Start Looping through
-- set J + 1
ADDI R11, R5, 4
NOP
NOP
NOP
NOP
-- Put arr[j] address in R9 and arr[j] data in R6
ADD R9, R5, R4 
NOP
NOP
NOP
NOP
LW R6, 4004(R5)
NOP
NOP
NOP
NOP
-- put arra[j + 1] address in R10 and arr[j + 1] data in R7
ADD R10, R4, R11
NOP
NOP
NOP
NOP
LW R7, 4004(R11)
NOP
NOP
NOP
NOP
-- Branch Condition
SUB R8, R6, R7
NOP
NOP
NOP
NOP
BGTZ R8, Swap
NOP
NOP
NOP
NOP
--increment j
ADDI R5, R11, 0
NOP
NOP
NOP
NOP
J LoopStartJ
NOP
NOP
NOP
NOP
--
--
--
-- Swap function
LABEL Swap
NOP
NOP
NOP
NOP
-- store data of arr[j+1] in arr[j]
SW R7, 0(R9)
NOP
NOP
NOP
NOP
-- store data of old arr[j] in arr[j+1]
SW R6, 0(R10)
NOP
NOP
NOP
NOP
--increment j
ADDI R5, R11, 0
NOP
NOP
NOP
NOP
-- exit function
J LoopStartJ
NOP
NOP
NOP
NOP
--
--
-- exit loop
LABEL PostLoop
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
10
79
56
3
87
93
32
34
86
41
33
End Data