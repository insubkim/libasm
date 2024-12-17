section .text
global _ft_read
_ft_read:
    mov rax, 0 ; use read() syscall
    syscall
    ret