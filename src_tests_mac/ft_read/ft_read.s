section .text
global _ft_read
extern ___error
_ft_read:
    mov rax, 0x2000003 ; use read() syscall
    syscall
    cmp rax, 0
    jge no_error ; check error
    not rax ; get errno
    add rax, 1
    push rax
    call ___error 
    pop QWORD [rax]
    mov rax, -1
no_error:
    ret
    ret
