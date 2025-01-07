extern _ft_strlen

section .text
global _ft_atoi_base
_ft_atoi_base:
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
    ; ; check if base has unique chars
    push rdi
    mov rdi, rsi
    call str_is_unique
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
    sub rdi, 1
;get sign chars
convert_sign:
    mov al, BYTE [rdi]
    add rdi, 1
    cmp al, 0 ; check str end
    je return_error
    cmp al, 43 ; 43 is '+' in ascii
    je convert_sign
    xor rbx, rbx ; change sign
    cmp al, 45 ; 45 is '-' in ascii
    je convert_sign
    xor rbx, rbx ; change sign
    sub rdi, 1
;for loop
    xor rax, rax
    xor rdx, rdx
cal:
    ;check str is base char
    ;calculate char
    imul rdx, rcx
    push rdx
    push rsi
    call get_idx
    pop rsi
    pop rdx
    add rdx, rax
    xor rax, rax
    add rdi, 1
    mov al, byte[rdi]
    cmp rax, 0
    jne cal
;return value and sign extend
    ; imul rdx, rbx
    mov rax, rdx
    ret
return_error:
    mov rax, 0
    ret

str_is_unique:
    ;check string is unique. return rax 1 if true
    push rbx
    push rdx
    lea rbx, [rel asciiArray]
loop:
    xor rax, rax
    mov al, BYTE [rdi]
    add rdi, 1
    cmp al, 0
    je end_loop
    mov rdx, rbx
    add rdx, rax
    mov al, BYTE [rdx]
    cmp al, 1
    je dup_char
    mov rax, 1
    mov [rdx], rax
    jmp loop
end_loop:
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

get_idx:
    mov al, byte [rdi]
    mov dl, 0
find_idx:
    mov ah, byte [rsi]
    add rsi, 1
    add dl, 1
    cmp ah, al
    jne find_idx
    sub dl, 1
    xor rax, rax
    mov al, dl
    ret

section .data
    asciiArray db 128 dup(0)
