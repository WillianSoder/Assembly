%include "io.inc"
section .data 
    msg1 db "eh bisexto (resto %d)", 10, 0 
    msg2 db "nao eh bisexto (resto %d)", 10, 0
    ano dd 0 ; aramzenar o ano

section .text
    global main
    extern printf 
main:
    GET_DEC 4, ano 
    mov eax, [ano] ; carrega ano em eax
    xor edx, edx ; zera edx (divisão segura) 
    mov ecx, 4 ; para dividir por 4
    div ecx ; divide eax por ecx e resto em edx 
    
    push edx
    cmp edx, 0 ; ve se tem resto 0 
    jne .else_block
    
   ; caso positvo
    push msg1 
    call printf
    add esp, 8
    jmp main.end
 
main.else_block: 
    push msg2
    call printf
    add esp, 8
    
main.end: 
    xor eax, eax    
    ret