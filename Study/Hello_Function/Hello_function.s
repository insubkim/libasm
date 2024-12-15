section .text
global _hello
_hello:
	mov rsi, msg
	mov rdx, 12 ;mov rdx, len
	mov rdi, 1
	mov rax, 1
	syscall
	ret

section .data
	msg db 'Hello World','$'
	;len equ $ -msg
