# Lab: Assembly Logical Instructions

## Task

1.) Prove that XORing an operand with itself changes the operand to 0.
- print value stored in result before xor & after.

2.) Create a case where you can implement a TEST instruction.
- print 'y' to stdout if result is even, else print 'n' to stdout.


## Flowchart
[Flowchart](docs/flowchart.jpg)

## Challenges Faced During the Lab
The main challenges I faced in this assignment stemmed from understanding how 
low-level data representations impact output and instruction behavior in assembly. 
A key difficulty was distinguishing between raw numeric values and their ASCII 
representations. I had to realize that storing 9 (a number) is not the same as 
storing '9' (ASCII 57), and that in order to print data to the console, it is 
necessary to convert a raw numeric value into its ASCII representation. Not fully 
understanding this led to confusion on how to convert the number in order for the 
data to log properly. I also had some uncertainty around valid operand combinations 
in instructions like xor and mov, particularly regarding immediate values, memory 
references, and required size specifiers. I now feel very confident in my ability 
to properly convert raw numerics into their ASCII representations to facilitate 
proper logging.

### Phase 1: Planning
For this phase of the assignment I had to decide how I wanted to approach both 
the test and the xor assignments. I took this time to plan out all my initiated 
and uninitiated variables. For the test case, I also had to figure out how I 
wanted to use the jz instruction to jump to the correct spot in the code 
according to whether or not the value in result was determined to be positive or 
negative.

### Phase 2: Implementation
During the implementation phase, I began translating my plan into working assembly 
code. I started by declaring all necessary sections (.data, .bss, and .text) and 
allocating space for both initialized and uninitialized variables. For the xor 
portion, I stored a raw numeric value, printed its ASCII representation, then 
used the xor instruction to zero it out by XORing it with itself. I followed 
this by converting the result back to ASCII to display the zero on the console. 
For the test case, I loaded a value into a register and used the test instruction 
to check its least significant bit. Based on the result, I used the jz instruction 
to branch to the appropriate label, printing either 'y' or 'n' to indicate an 
even or odd result. Throughout this phase, I carefully managed data conversions, 
syscall parameters, and control flow to ensure the program behaved as intended.

### Phase 3: Debugging
During the debugging phase, I ran into several issues that required careful 
inspection of both logic and syntax. One recurring problem was forgetting to 
specify operand sizes, especially when using instructions like `xor` with memory 
operands, which led to ambiguous operand errors from the assembler. Another 
issue involved accidentally printing raw numeric values without converting them 
to ASCII, resulting in invisible or unexpected output in the terminal. To 
troubleshoot, I inserted temporary print statements after key operations to 
verify the contents of registers and memory. within gdb I steppped through the 
program and verify that jumps and conditionals like jz were working as expected. 
Eventually, by isolating code blocks and testing them individually, I was able to
identify and resolve the problems, resulting in a clean and correctly functioning 
final version of the program.
