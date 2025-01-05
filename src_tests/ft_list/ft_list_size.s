section .text
global _ft_list_size
_ft_list_size:
    ;rdi for head
    ;check head is null
    ;loop until null
    cmp rdi, 0
    jne get_size
    mov rax, -1
    ret
get_size:
    xor rcx, rcx
loop:
    add rcx, 1
    mov rdi, [rdi + 8]
    cmp rdi, 0
    jne loop
    mov rax, rcx
    ret
