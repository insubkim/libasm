section .text
global _ft_write
_ft_write:
    mov rax, 0x2000004 ; use write() syscall 1 for linux, 0x2000004 for macos
    syscall
    ret
