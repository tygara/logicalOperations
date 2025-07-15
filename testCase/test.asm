section .data
    message db 'y'              ; This will be the default message if number is even

section .bss
    result resb 1               ; Only need one byte for this

section .text
    global _start

_start:
    mov eax, 8
    test eax, 1                 ; test operation, if LSB is 1 then its odd
    jz even                     ; jump if zero to even block

    mov byte [result], 'n'
    jmp print


even:
    mov byte [result], 'y'


print:
    mov eax, 4                ; syscall:write
    mov ebx, 1                ; first args to the prev syscall (destination)
    mov ecx, result           ; pointer to buffer
    mov edx, 1                ; write 1 byte
    int 0x80


exit_program:
    mov eax, 1
    xor ebx, ebx              ; exit code 0 for clean termination
    int 0x80
