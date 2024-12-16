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
	dec rcx
	mov rax, rcx
	ret 
