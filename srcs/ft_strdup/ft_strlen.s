section .text
global _ft_strlen
_ft_strlen:
	xor rcx, rcx
loop:
	mov al, BYTE [rdi + rcx]
	inc	rcx
	cmp	al, 0
	jne loop
	dec rcx ; do not count NULL 
	mov rax, rcx
	ret 
