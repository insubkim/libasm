extern _ft_strlen
extern malloc
extern _ft_strcpy
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
    mov rsi, r12
    mov rdi, rax
    call _ft_strcpy
    ret

