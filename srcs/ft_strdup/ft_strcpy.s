section .text
global _ft_strcpy
_ft_strcpy:
    xor rcx, rcx
    mov rdx, rdi
loop:
    mov al, [rsi + rcx]
    mov [rdi], al
    inc rcx
    cmp al, 0
    jne loop
    mov rax, rdx
    ret