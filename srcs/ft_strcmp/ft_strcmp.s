section .text
global _ft_strcmp
_ft_strcmp:
    xor rcx, rcx
loop:
    mov al, BYTE [rdi + rcx]
    cmp al, BYTE [rsi + rcx]
    jne end_loop
    cmp al, 0; both is null
    je end_loop
    inc rcx
    jmp loop
end_loop:
    xor rax, rax
    mov al, BYTE [rdi + rcx]
    sub al, BYTE [rsi + rcx]
    movsx rax, al
min:
    
    ret