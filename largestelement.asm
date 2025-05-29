section .data
    vetor dd 45, 50, 44, 99, 55, 12, 17, 88, 10, 11, 69, 799, 897, 454, 454, 999, 22, 10, 19, 25
    ;vetor dd 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39
    ;vetor dd 100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10, 5
    ;vetor dd 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
    tam dd 20
    i dd 0
    maior dd 0
    msg db "o maior valor do vetor eh: %d"
section .text
    extern printf 
    extern exit
    global main
main:
    mov ebp, esp; for correct debugging
   
.loop:
    mov eax, [i]; eax = i
    mov esi, [vetor+eax*4] ; copiando posição i do vetor para um registrador de copias 
    inc dword [i] ; i++
    mov eax, [i] ; eax = i+1
    cmp eax, [tam]
    je .end ; se i+1 = 10 acabou o vetor
    mov ebx, [vetor+eax*4] ; copiando a posição i +1 do vetor 
    cmp ebx, esi
    jg .maior ; ebx maior
    jl .menor ; ebx menor
    je .igual; igual 
    
.maior: ; ebx > esi 
    mov eax, [maior]
    cmp eax, ebx
    jg .loop ; se elemento maior na memoria for maior que o ebx volta pro inicio
    je .loop ; se o elemento maior na memoria for igual o ebx volta pro inicio 
    mov [maior], ebx ; se for menor maior = ebx
    jmp .loop ; volta pro inicio 
.menor: ; ebx < esi 
    mov eax, [maior]
    cmp eax, esi
    jg .loop ; se o elemento maior na memoria for maior que o esi volta pro inicio  
    je .loop ; se o elemento maior na memoria for igual o esi volta pro inico 
    mov [maior],esi 
    jmp .loop ; volta pro inicio
.igual: ; esi = ebx
    mov eax, [maior]
    cmp eax, esi
    jg .loop ; se o elemento maior na memoria for maior que o esi volta pro inicio  
    je .loop ; se o elemento maior na memoria for igual o esi volta pro inico 
    mov [maior], esi 
    jmp .loop ; volta pro inicio
    
.end:
    mov eax, [maior]
    push eax
    push msg 
    call printf
    add esp, 8 ; limpa a pilha 8 bytes
    xor eax, eax  
    xor ebx, ebx 
    xor esi, esi   
    call exit