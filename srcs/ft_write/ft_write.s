section .text
global _ft_write
_ft_write:
    mov rax, 1 ; use write() syscall
    syscall
    ret