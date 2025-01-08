section .text
global _call_c
_call_c:
    push rbp
    mov rsp, rbp
    and rsp, -16
    call rdi
    mov rsp, rbp
    pop rbp
    ret