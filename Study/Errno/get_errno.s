extern _errno

section .text
global _get_errorno
_get_errorno: 
    mov rax, _errno 
    ret