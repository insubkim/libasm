extern malloc
section .text
global _ft_list_push_front
_ft_list_push_front:
    ;rdi for head, rsi for data
    ;check head is null
    cmp rdi, 0
    jne make_node
    ret
make_node:
    push rdi
    push rsi
    ;malloc node
    mov rdi, 16
    push rsp 
    and rsp, -16
    call malloc wrt ..plt
    pop rsp
    cmp rax, 0
    jne change_head
    ret
change_head:
    pop rsi
    pop rdi
    ;link new node next to head
    mov rdx, [rdi]
    mov [rax + 8], rdx
    mov [rax], rsi
    ;change head to new node
    mov [rdi], rax
    ret