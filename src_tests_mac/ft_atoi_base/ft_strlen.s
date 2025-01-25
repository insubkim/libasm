section .text
global _ft_strlen
_ft_strlen:
	mov rsi, rdi
	xor rax, rax
	xor rcx, rcx
loop:
	mov al, BYTE [rsi + rcx]
	inc	rcx
	cmp	al, 0
	jne loop
	dec rcx ; do not count NULL
	push rbp
	mov rbp, rsp
	call kkk
	pop rbp 
	mov rax, rcx
	ret 
kkk:
	mov rax, 100
	ret
