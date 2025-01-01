extern puts

section .text
global main
main:
    mov rdi, message
    call puts wrt ..plt
    ret
section .data

message:
    db "Hello World", 0