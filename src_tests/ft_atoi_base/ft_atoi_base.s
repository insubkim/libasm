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
;get sign chars
;for loop  
    ;check str is base char
    ;calculate char
;return value and sign extend
    ret
return_error:
    mov rax, 0
    ret

str_is_unique:
    ;check s is unique 

contains:
    ;check base has str

section .data
    asciiArray db 128 dup(0)