section .text
global _return_num
_return_num:
	xor rcx, rcx
loop1:
	inc	rcx
	cmp rcx, 10
	jl loop1	 
	mov rax, rcx
	ret
