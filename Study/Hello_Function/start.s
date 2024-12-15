section .text
global _start
_start:
	mov rsi, msg
	mov rdx, len
	mov rdi, 1
	mov rax, 1
	syscall
        mov ebx,0
        mov eax,1
        int 0x80
	
section .data
	msg db 'Hello World','$'
	len equ $ -msg
