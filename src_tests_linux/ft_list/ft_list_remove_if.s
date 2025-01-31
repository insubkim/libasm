struc	locals
	.cur_node		resw 1
	.prev_node	resw 1
	.head_ptr		resw 1
	.data_ref		resw 1
	.cmp_ptr		resw 1
	.free_ptr		resw 1
endstruc

%define LOCAL_SIZE 48

section .text
global _ft_list_remove_if
_ft_list_remove_if:
	; save stack registers
	push rbp
	mov rbp, rsp
	; set local vars
	sub rsp, LOCAL_SIZE
	mov [rsp - locals.head_ptr], rdi
	mov [rsp - locals.data_ref], rsi
	mov [rsp - locals.cmp_ptr], rdx
	mov [rsp - locals.free_ptr], rcx
	;rdi for head, rsi for data_ref, rdx for cmp, rcx for free
	;check null
	cmp QWORD [rsp - locals.head_ptr], 0
	je return
	cmp QWORD [rsp - locals.data_ref], 0
	je return
	cmp QWORD [rsp - locals.cmp_ptr], 0
	je return
	cmp QWORD [rsp - locals.free_ptr], 0
	je return
	mov rax, [rsp - locals.head_ptr]
	mov rax, [rax]
	mov QWORD [rsp - locals.cur_node], rax ; store cur node
	mov QWORD [rsp - locals.prev_node], 0 ; store prev node
loop:
	cmp QWORD [rsp - locals.cur_node], 0
	je return
	; compare val
	push rsp
	and rsp, -16
	mov rax, QWORD [rsp - locals.cur_node]
	mov rdi, [rax]
	mov rax, QWORD [rsp - locals.data_ref]
	mov rsi, rax
	call QWORD [rsp - locals.cmp_ptr]
	pop rsp
	cmp rax, 0
	jne dont_delete
	; delete val
	push rsp
	and rsp, -16
	mov rax, QWORD [rsp - locals.cur_node]
	mov rdi, [rax]
	call QWORD [rsp - locals.free_ptr]
	pop rsp
	; change prev
	cmp QWORD [rsp - locals.prev_node], 0
	je change_root
	mov rax, QWORD [rsp - locals.cur_node]
	mov rax, [rax + 8]
	mov rcx, QWORD [rsp - locals.prev_node]
	mov [rcx + 8], rax
	jmp dont_delete
change_root:
	mov rax, QWORD [rsp - locals.cur_node]
	mov rax, [rax + 8]
	mov rcx, QWORD [rsp - locals.head_ptr]
	mov [rcx], rax
dont_delete:
	; change prev and cur
	mov rax, QWORD [rsp - locals.cur_node]
	mov rbx, [rax + 8]
	mov rcx, QWORD [rsp - locals.prev_node]
	; check prev null
	cmp rcx, 0
	je l
	mov QWORD [rsp - locals.prev_node], rax 
l:
	mov QWORD [rsp - locals.cur_node], rbx 
	jmp loop
return:
	; restore stack registers
	mov rsp, rbp
	pop rbp
  ret
