section .text
global _print_str
_print_str:
	mov rsi, rdi
	mov rdx, 14 ;mov rdx, len
	mov rdi, 1
	mov rax, 1
	syscall
	ret
