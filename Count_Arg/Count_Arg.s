section .text
global _start
_start:
    dec dword [rsp];
    jz exit_proc;
add:
    mov ecx, msg;
    mov edx, len;
    mov eax, 4;
    int 0x80;
exit_proc:
    mov rbx, [rsp];
    mov eax, 1;
    int 0x80;

section .data
    count   db  0
    sum     db  0
    msg     db  'ARG NOT ZERO','$';
    len     equ $ -msg
