;extern _ft_strlen
extern _malloc
;extern _ft_strcpy
section .text
global _ft_strdup
_ft_strdup:
    ;push rdi
    ;call _ft_strlen
    mov rdi, 20
    call _malloc
    ret
    ;pop rdi
    ;mov rsi, rax
    ;call _ft_strcpy
; get length size
; call malloc
; call ft_strcpy
; return str