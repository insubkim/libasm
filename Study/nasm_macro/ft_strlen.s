struc locals
	.str resd 1
endstruc

%define LOCAL_SIZE 8

section .text
global _ft_strlen
_ft_strlen:
	; save stack registers
	push rbp
	mov rbp, rsp
	; prepare stack
	sub rsp, LOCAL_SIZE
	mov [rsp - locals.str], rdi
loop:
	mov rcx, [rsp - locals.str]
	mov al, BYTE [rcx]
	inc DWORD [rsp - locals.str]
	cmp	al, 0
	jne loop
	dec DWORD [rsp - locals.str]
	; mov rax, rcx
	sub [rsp - locals.str], rdi
	mov rax, [rsp - locals.str] 
	; restore stack registers
	mov rsp, rbp
	pop rbp
	ret 
