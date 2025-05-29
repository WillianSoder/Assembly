section .data ; seção utilizada para armazenar a string 
    mensagem db "i equal %d", 10, 0 ;mensagem string de formato usada com printf 10 = \n e 0 = \0

section .bss ; seção para variáveis não inicializadas
    i resd 1 ; reserva 4bytes para 'i'
        
section .text ; seção de codigo executavel 
    global main ; ponto de entrada 
    extern printf ; usar printf da biblioteca C 
    
main: 
    mov dword [i], 0 ; i = 0 
.loop:
    mov eax, [i] ; carrega o valor de i em eax
    cmp eax, 100 ; comparação de i com 100
    jge .end ; se i>= 100 encerra (0-99)
    
    push eax ; empilha eax(valor de i) na pilha para o printf
    push mensagem ; coloca o endereço da string na pilha
    call printf ; printf(mensagem, i)
    add esp, 8 ; limpa a pilha 8 bytes
    
    inc dword [i] ; i++
    jmp .loop ; volta pro incio para refazer o loop 
    
.end: 
    xor eax, eax
    ret 
    