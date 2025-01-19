section .text
global _ft_list_sort
_ft_list_sort:
    ; check parameter
    cmp rdi, 0
    je return_error
    cmp rsi, 0
    je return_error
    mov r12, rsi
bubble_sort:
    mov rcx, [rdi]	; save head
outer_loop:
    mov rax, [rcx + 8] ; get next node 
    cmp rax, 0		; check if next is null
    jne not_sorted	; if next is present it can be sorted
    ret
not_sorted:
    mov rbx, [rcx + 8]	; save list next pointer
inner_loop:
    cmp rbx, 0 		; check if list is null
    jne compare 	; if not null than compare 
    mov rcx, [rcx + 8] 	; mov rcx to next node 
    jmp outer_loop
compare:
    push rbx 		; save registers
    push rcx
    push rdi
    push rsi
    push rsp
    and rsp, -16
    mov rdi, [rcx]
    mov rsi, [rbx]
    call r12 		; call cmp
    pop rsp
    pop rsi
    pop rdi
    pop rcx
    pop rbx
    cmp eax, 0 		; check if first arg is bigger
    jle dont_change_val
    ;change value
    mov r8, [rcx]  
    mov r9, [rbx]
    mov [rcx], r9
    mov [rbx], r8
dont_change_val:
    mov rbx, [rbx + 8]
    jmp inner_loop
return_error:
    mov rax, 0
    ret
