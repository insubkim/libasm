section .text
global _ft_write

extern ___error
_ft_write:
    mov rax, 0x2000004 ; use write() syscall 1 for linux, 0x2000004 for macos
    syscall
    jnc no_error ; check error
    push rax
    call ___error 
    pop QWORD [rax]  
    mov rax, -1
no_error:
    ret
