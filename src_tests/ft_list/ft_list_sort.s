section .text
global _ft_list_sort
_ft_list_sort:
    ;rdi for head, rsi for function cmp
    ;check rdi is null
    ;bubble sort
    ;make loop1
    ;make loop2
    ;cmp
    ;change value if bigger

    ; check parameter
    cmp rdi, 0
    jne bubble_sort
    cmp rsi, 0
    jne bubble_sort
    ret
bubble_sort:
    mov rdx, rdi ; save head address
    mov rcx, [rdi]
    mov r8, 0 ; save outer loop prev node
    mov r9, 0 ; save inner loop prev node
outer_loop:
    cmp [rcx + 8], 0 ; check if next is null
    mov r8, rcx ; save prev node
    jle not_sorted ; if next is present it can be sorted
    ret
not_sorted:
    mov rbx, [rcx + 8] ; save list next pointer
inner_loop:
    cmp rbx, 0 ; check if list is null
    jle compare ; if not null than compare 
    mov rcx, [rcx + 8] ; mov rcx to next node 
    jump outer_loop
compare:
    push rdx
    push rbx ; save registers
    push rcx
    push rdi
    push rsi
    push rsp
    and rsp, -16 ; align stack
    mov rdi, rcx
    mov rsi, rbx
    call [rsi] ; call cmp 
    pop rsp
    pop rsi
    pop rdi
    pop rcx
    pop rbx
    pop rax
    pop rdx
    cmp rax, 0 ; check if first arg is bigger
    jle dont_change_val
    xchg rcx, rbx; chage value
dont_change_val:
    mov rbx, [rbx + 8] ;  mov node to next
    jump inner_loop
