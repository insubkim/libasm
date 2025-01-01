extern _ft_strlen
extern malloc
extern _ft_strcpy
section .text
global _ft_strdup
_ft_strdup:
    mov r12, rdi
    call _ft_strlen
    mov rdi, rax
	sub rsp, 8
    call malloc wrt ..plt
    add rsp, 8
    mov rsi, r12
    mov rdi, rax
    call _ft_strcpy
    ret
; get length size
; call malloc
; call ft_strcpy
; return str
