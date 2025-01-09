section .text
global _ft_list_sort
_ft_list_sort:
    ; check parameter
    cmp rdi, 0
    jne bubble_sort
    cmp rsi, 0
    jne bubble_sort
    mov r12, rsi
    ret
bubble_sort:
    mov r8, 0 ; save outer loop prev node
    mov r9, 0 ; save inner loop prev node
    mov r10, [rdi] ; save head
    mov rcx, r10 ; save outer loop start 
outer_loop:
    mov rax, [rcx + 8] 
    cmp rax, 0 ; check if next is null
    jne not_sorted ; if next is present it can be sorted
    mov [rdi], r10 ; change head
    ret
not_sorted:
    mov rbx, [rcx + 8] ; save list next pointer
inner_loop:
    cmp rbx, 0 ; check if list is null
    jne compare ; if not null than compare 
    mov r8, rcx ; save node
    mov rcx, [rcx + 8] ; mov rcx to next node 
    jmp outer_loop
compare:
    push rbx ; save registers
    push rcx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push rsp
    sub rsp, 8
    mov rdi, rcx
    mov rsi, rbx
    call r12 ; call cmp
    pop rbp 
    pop rsp
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rcx
    pop rbx
    pop rax
    cmp rax, 0 ; check if first arg is bigger
    jne dont_change_val
    ;change value
    mov rax, [rcx + 8] ; save outer next  
    mov r11, [rbx + 8] ; save inner next
    mov [rbx + 8], rax ; 1,2 ; change inner next to outer next

    mov [rcx + 8], r11 ; 3,4 ; change outer next to inner next
    
    cmp r9, 0
    je l1
    mov [r9 + 8], rcx ; 5, 6 ; change inner prev next to outer
l1:
    cmp r8, 0
    je dont_change_val
    mov [r8 + 8], rbx ; 7, 8 ; change puter prev next to inner

dont_change_val:
    mov r9, rbx ; save node
    mov rbx, [rbx + 8] ; mov node to next
    jmp inner_loop