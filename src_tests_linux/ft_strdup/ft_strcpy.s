section .text
global _ft_strcpy
_ft_strcpy:
    xor rcx, rcx
loop:
    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    inc rcx
    cmp al, 0
    jne loop
    mov rax, rdi
    ret