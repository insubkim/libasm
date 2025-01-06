extern _ft_strlen

section .text
global ft_atoi_base
ft_atoi_base:
    mov rdx, 0 ; return val
    mov rbx, 1 ; stores sign value 
    mov rcx, 0 ; stores base_len
    ; check string is null
    cmp rdi, 0  
    je return_error
    ; check base is null
    cmp rsi, 0 
    je return_error
    ; check if base len is below 2
    push rdi
    mov rdi, rsi
    call _ft_strlen
    pop rdi
    cmp rax, 2 
    jl return_error
    mov rcx, rax
    ; check if base has unique chars
    push rdi
    mov rdi, rsi
    jmp str_is_unique
    pop rdi
    cmp rax, 0
    je return_error
    ;ignore spaces
    MOV rax, 0
ignore_space:
    mov al, BYTE [rdi]
    add rdi, 1
    cmp al, 32 ; 32 is space in ascii
    je ignore_space
    cmp al, 0 ; check str end
    je return_error
;get sign chars
convert_sign:
    mov al, BYTE [rdi]
    add rdi, 1
    cmp al, 43 ; 43 is '+' in ascii
    je ignore_space
    cmp al, 45 ; 45 is '-' in ascii
    je ignore_space
    cmp al, 0 ; check str end
    je return_error
;for loop  
    ;check str is base char
    ;calculate char
;return value and sign extend
    imul rdx, rbx
    ret
return_error:
    mov rax, 0
    ret

str_is_unique:
    ;check string is unique. return rax 1 if true
    push rbx
    push rdx
    xor rax, rax
    lea rbx, [asciiArray]
loop:
    mov al, BYTE [rdi]
    add rdi, 1
    mov rdx, rbx
    add rdx, rax
    mov rax, [rdx]
    cmp rax, 1
    je dup_char
    mov rax, 1
    mov [rdx], rax
    cmp al, 0
    jne loop
    mov rax, 1
    pop rdx
    pop rbx
    ret
dup_char:
    mov rax, 0
    pop rdx
    pop rbx
    ret

contains:
    ;check base has str
    ret

section .data
    asciiArray db 128 dup(0)
