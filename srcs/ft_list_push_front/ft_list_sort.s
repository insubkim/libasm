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
    cmp rdi, 0
    jne bubble_sort
    ret
bubble_sort:
    mov rdx, rdi ; save head address
    mov rcx, [rdi]
outer_loop:
    cmp [rcx + 8], 0 ; check if next is null
    jle not_sorted ; if next is present it is not sorted
    ret
not_sorted:
    mov rbx, [rcx + 8] ; save list next pointer
inner_loop:
    cmp rbx, 0 ; check if list is null
    jle compare_val ; if not null than compare 
    mov rcx, [rcx + 8] ; mov rcx to next node 
    jump outer_loop
compare_val:
    push rdx
    push rbx ; save registers
    push rcx
    push rdi
    push rsi
    push rsp
    and rsp, -16
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
    ; chage value
dont_change_val:
    mov rbx, [rbx + 8] ;  mov node to next
    jump inner_loop