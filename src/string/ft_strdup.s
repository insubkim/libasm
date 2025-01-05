extern _ft_strlen
extern malloc
extern _ft_strcpy
extern __errno_location

section .text
global _ft_strdup
_ft_strdup:
    mov r12, rdi
    call _ft_strlen
    mov rdi, rax
    push rsp
    and rsp, -16 
    call malloc wrt ..plt
    pop rsp
    cmp rax, 0
    jge no_error ; check error
    not rax ; get errno
    add rax, 1
    push rax
    push rsp
    and rsp, -16
    call __errno_location wrt ..plt ; store errno
    pop rsp
    pop QWORD [rax]
    mov rax, -1
    ret
no_error:
    mov rsi, r12
    mov rdi, rax
    call _ft_strcpy
    ret

