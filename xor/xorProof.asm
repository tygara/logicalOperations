; Proof that xorign nd operand with itself changes the operand to 0.
section .data
  result db 9
  newline db 10

section .text
  global _start

_start:
    mov al, [result]        ; al = 9
    add al, '0'             ; convert to ascii by adding raw w/ ascii 9+48('0')=57
    mov [result], al        ; store ASCII value of '9'=57

; print before xor
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

; print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

; xor result with itself and store in result
    mov byte [result], 9      ; overide ascii value with raw value 
    xor byte [result], 9      ; zero out with xor

; replace raw value with ascii value of 0
    mov al, [result]          ; loading 0 into al
    add al, '0'               ; convert raw into ascii 0 + '0'(48)=48
    mov [result], al          ; load ascii value of (0)48 -> result

; print zero'd out xor result value
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
