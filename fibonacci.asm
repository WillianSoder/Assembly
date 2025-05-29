%include "io.inc"
section .bss ; seção para variáveis não inicializadas
    ;i resd 1  
section .data 
    msg db "%d", 10, 0 ;mensagem string de formato usada com printf | 10 = \n e 0 = \0 
    n dd 0
    i dd 0 
    primeiro dd 0 
    segundo dd 1 
section .text 
    global main
    extern printf 
    extern exit
    
main:
    GET_DEC 4, n
.loop: 
    mov eax, [i] ; carregando o valor de i em eax 
    cmp eax, [n] ; compara i com n 
    jge .end ; i>=n encerra (0 - (n-1)) 
    
    push eax
    cmp eax, 1
    jg .else_block ; i>1 vai pro else (para tratar os dois casos em q o valor da sequencia de fibonacci é a proprio indice 0 e 1)
    mov ebx, eax ; (ebx é a vriavel proximo) proximo = i
    push ebx ; colocando o proximo na pilha pro printf 
    push msg ; enderço da msg na pilha
    call printf 
    add esp, 8 ; limpa a pilha 8 bytes
    inc dword [i] ; i++
    jmp .loop ; volta pro inicio do loop 
    
.else_block: 
    
    ; proximo(ebx)= primeiro + segundo
    mov ebx, [primeiro]
    add ebx, [segundo] 
    mov esi, [segundo] ; fazendo uma copia da variavel segundo para um registrador de copias 
    mov [primeiro], esi ; primeiro = segundo 
    mov [segundo], ebx ; segundo = proximo 
    push ebx ; colocando o proximo na pilha pro printf 
    push msg ; enderço da msg na pilha
    call printf
    add esp, 8 ; limpa a pilha 8 bytes 
    inc dword [i] ; i++
    jmp .loop ; volta pro inicio do loop 

.end:
    xor ebx, ebx 
    xor eax, eax
    xor esi, esi
    call exit
