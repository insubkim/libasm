section .text
global _ft_write

extern __errno_location
_ft_write:
    ;mov rax, 0x2000004 ; use write() syscall 1 for linux, 0x2000004 for macos
    mov rax, 1 ; use write() syscall 1 for linux, 0x2000004 for macos
    syscall
    cmp rax, 0
    jge no_error ; check error
    not rax ; get errno
    add rax, 1
    push rax
    call __errno_location wrt ..plt ; store errno
    pop QWORD [rax]  
    mov rax, -1
no_error:
    ret
