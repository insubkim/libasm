section .text
global ft_atoi_base
ft_atoi_base:
mov rax, 0 ; return val
mov rbx, 0 ; stores sign value 0 = +, 1 = -
mov rcx, 0 ; stores base_len
;check if str is unique. return 0 on error
;ignore spaces
;get sign chars
;for loop  
    ;check str is base char
    ;calculate char
;return value and sign extend