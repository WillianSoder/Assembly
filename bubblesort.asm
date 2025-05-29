section .data
    vetor dd 45, 50, 44, 99, 55, 12, 17, 88, 10, 11, 69, 799, 897, 454, 454, 999, 22, 10, 19, 25
    ;vetor dd 100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10, 5
    ;vetor dd 1, 3, 5, 7, 10, 12, 15, 18, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100
    ;vetor dd 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    tam dd 20
    tam2 dd 0
    i dd 0
    j dd 0
    msg db "o vetor ordenado eh:", 0
    msg2 db " %d ", 0
section .text
    extern printf 
    extern exit
    global main
main:
    mov ebp, esp; for correct debugging
    .loop1: ; loop externo 0 a tam-1
    mov eax, [i] ; eax = i 
    mov ebx, [tam]
    sub ebx, 1 ; tam-1
    cmp eax, ebx
    jge .imprimir ; i >= tam-1 finaliza o loop 
    
        .loop2: ;loop interno 0 a tam-1-i
        mov eax, [tam] 
        sub eax, [i] ;eax = tam - i
        sub eax, 1 ; eax = tam - i -1
        mov dword [tam2], eax ; tam2 = tam - i - 1
        mov eax, [j] ; eax = j 
        cmp eax, [tam2]
        jge .fimloop2 ; se j >= tam-i-1 finaliza o loop2
        mov eax, [j] ; eax = j
        inc dword [j]
        mov ebx, [j] ; ebx = j + 1
        ;add ebx, 1 ; ebx = j+1
        mov ecx, [vetor+eax*4] ; ecx = v[j]
        cmp ecx, [vetor+ebx*4] ; comparando v[j] com v[j+1]
        jg .swap ; se v[j]>v[j+1] faz a troca 
        jle .loop2 ; se v[j]<=v[j+1] volta pro inicio do loop 2
    .fimloop2:
    mov dword [j], 0
    inc dword [i]; i++
    jmp .loop1
    
    .swap:
    mov esi, [vetor+eax*4] ; esi = vetor[j]
    mov edi, [vetor+ebx*4] ; edi = vetor[j+1]
    mov [vetor+eax*4], edi ; vetor[j] = vetor[j+1]
    mov [vetor+ebx*4], esi ; vetor[j+1] = vetor[j] (salvo em esi)
    jmp .loop2 ; volto pro loop2
    
    
    .imprimir:
        push msg
        call printf 
        add esp, 4
        mov dword [i], 0 
        .printvetor:
        mov eax, [i] ; eax = i
        cmp eax, [tam]
        jge .end ; se i>=n  
        mov ebx, [vetor+eax*4] ; ebx = vetor[i]
        push ebx
        push msg2 
        call printf ; imprime v[i]
        add esp, 8 ; limpa a pilha
        inc dword [i] ; i++
        jmp .printvetor
    .end:
    xor eax, eax
    xor esi, esi
    xor ebx, ebx
    xor ecx, ecx
    xor edi, edi
    call exit 