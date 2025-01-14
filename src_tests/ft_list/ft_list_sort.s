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
    mov r8, 0		; save outer loop prev node
    mov r9, 0     	; save inner loop prev node
    mov r10, [rdi]	; save head
    mov rcx, r10	; save outer loop start 
outer_loop:
    mov rax, [rcx + 8]
    mov r9, rcx		; set inner loop prev node 
    cmp rax, 0		; check if next is null
    jne not_sorted	; if next is present it can be sorted
    mov [rdi], r10	; change head
    ret
not_sorted:
    mov rbx, [rcx + 8]	; save list next pointer
inner_loop:
    cmp rbx, 0 		; check if list is null
    jne compare 	; if not null than compare 
    mov r8, rcx 	; save node
    mov rcx, [rcx + 8] 	; mov rcx to next node 
    jmp outer_loop
compare:
    push rbx 		; save registers
    push rcx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push rsp
    and rsp, -16
    mov rdi, rcx
    mov rsi, rbx
    call r12 		; call cmp
    pop rsp
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rcx
    pop rbx
    cmp rax, 0 		; check if first arg is bigger
    jne dont_change_val
    ;change value
    mov rax, [rcx + 8] 	; save outer next  
    mov r11, [rbx + 8] 	; save inner next
    
    mov [rbx + 8], rax 	; change inner next to outer next
    mov [rcx + 8], r11 	; change outer next to inner next
  
    cmp r8, 0
    je change_root 
    mov [r8 + 8], rbx
    mov [r9 + 8], rcx
    jmp exchange     
change_root: 
    mov r10, rbx
    cmp r9, rcx
    je c1
    mov [r9 + 8], rcx
c1:
    mov [rbx + 8], rcx
exchange:
    mov rax, rbx
    mov rbx, rcx
    mov rcx, rax
    mov r9, rbx
    mov rbx, [rbx + 8]
    jmp inner_loop
dont_change_val:
    mov r9, rbx
    mov rbx, [rbx + 8]
    jmp inner_loop
return_error:
    mov rax, 0
    ret
