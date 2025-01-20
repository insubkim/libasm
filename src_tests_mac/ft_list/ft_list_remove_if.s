section .text
global _ft_list_remove_if
_ft_list_remove_if:
	;rdi for head, rsi for data_ref, rdx for cmp, rcx for free
	;check null
    cmp rdi, 0
    je return
    cmp rsi, 0
    je return
    cmp rdx, 0
    je return
    cmp rcx, 0
    je return
	mov r8, [rdi] ; store cur node
	mov r9, 0 ; store prev node
loop:
	cmp r8, 0
	je return
	; compare val
	push r8
	push r9
	push rdi
	push rsi
	push rdx
	push rcx
	push rsp
	and rsp, -16
	mov rdi, [r8]
	call rdx
	pop rsp
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r9
	pop r8
	cmp rax, 0
	jne dont_delete
	;delete val
	push r8
	push r9
	push rdi
	push rsi
	push rdx
	push rcx
	push rsp
	and rsp, -16
	mov rdi, [r8]
	call rcx
	pop rsp
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop r9
	pop r8
	;change prev
	cmp r9, 0
	je change_root
	mov rax, [r8 + 8]
	mov [r9 + 8], rax
	jmp dont_delete
change_root:
	mov rax, [r8 + 8]
	mov [rdi], rax
dont_delete:
	mov r9, r8
	mov r8, [r8 + 8]
	jmp loop
return:
    ret
