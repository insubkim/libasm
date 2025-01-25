extern _ft_strlen
extern _malloc
extern _ft_strcpy
extern ___error

section .text
global _ft_strdup
_ft_strdup:
    mov r12, rdi
    call _ft_strlen
    mov rdi, rax
    push rsp
    and rsp, -16 
    call _malloc
    pop rsp
    cmp rax, 0
    jge no_error ; check error
    not rax ; get errno
    add rax, 1
    push rax
    call ___error
    pop QWORD [rax]
    mov rax, -1
    ret
no_error:
    mov rsi, r12
    mov rdi, rax
    call _ft_strcpy
    ret

